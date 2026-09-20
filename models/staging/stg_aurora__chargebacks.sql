with fonte as (
    select * from {{ source('aurora', 'chargebacks') }}
)

select
    chargeback_id,
    transacao_id,
    data_abertura,
    valor_centavos,
    motivo,
    status
from fonte
