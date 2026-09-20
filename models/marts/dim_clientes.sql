{{ config(materialized='table') }}


with clientes as (
   select * from {{ ref('stg_aurora__clientes') }}
),


planos as (
   select * from {{ ref('stg_aurora__planos') }}
)

select
   c.cliente_id,
   c.cnpj,
   c.nome_fantasia,
   c.cidade,
   c.uf,
   c.mcc_principal,
   p.nome_plano,
   p.taxa_credito_pct,
   p.taxa_debito_pct,
   c.data_cadastro,
   c.status,
   c.canal_aquisicao
from clientes c

left join planos p
   on c.plano_id = p.plano_id