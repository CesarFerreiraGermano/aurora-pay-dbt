{{ 
    config(
        materialized='incremental',
        unique_key='transacao_id'
    ) 
}}

select
    transacao_id,
    cliente_id,
    data_transacao,
    valor_centavos,
    tipo,
    bandeira,
    parcelas,
    mcc,
    status
from {{ ref('stg_aurora__transacoes') }}

{% if is_incremental() %}

where data_transacao > (select max(data_transacao) from {{ this }})

{% endif %}

