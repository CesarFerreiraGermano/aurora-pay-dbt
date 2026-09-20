{{ 
    config(
        materialized='incremental',
        unique_key='transacao_id'
    ) 
}}

select
    t.transacao_id,
    t.cliente_id,
    t.data_transacao,
    t.valor_centavos,
    {{ centavos_para_reais('t.valor_centavos') }} as valor_reais,
    t.tipo,
    t.bandeira,
    t.parcelas,
    t.mcc,
    cat.categoria,
    cat.segmento,
    t.status
from {{ ref('int_transacoes_validas') }} t
left join {{ ref('mcc_categorias') }} cat
    on t.mcc = cat.mcc


{% if is_incremental() %}

where data_transacao > (select max(data_transacao) from {{ this }})

{% endif %}

