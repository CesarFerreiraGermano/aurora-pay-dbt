with fonte as (
    select * from {{ source('aurora', 'transacoes') }}
)

select
    transacao_id,
    cliente_id,
    data_transacao,
    valor_centavos,
    tipo,
    bandeira,
    parcelas,
    cast(mcc as string)                 as mcc,
    status
from fonte
