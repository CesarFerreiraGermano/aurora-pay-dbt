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

qualify row_number() over (partition by chargeback_id order by data_abertura) = 1