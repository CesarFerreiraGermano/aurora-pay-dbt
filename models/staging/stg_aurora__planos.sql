with fonte as (
   select * from {{ source('aurora', 'planos') }}
)

select
   plano_id,
   nome_plano,
   taxa_credito_pct,
   taxa_debito_pct,
   mensalidade_centavos
from fonte
