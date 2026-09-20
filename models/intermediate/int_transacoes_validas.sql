with transacoes as (
    select * from {{ ref('stg_aurora__transacoes') }}
),

clientes as (
    select cliente_id from {{ ref('stg_aurora__clientes') }}
)

select t.*
from transacoes t
-- tira as 40 transacoes orfas
inner join clientes c
    on t.cliente_id = c.cliente_id
-- tira os 25 valores negativos indevidos
where not (t.valor_centavos < 0 and t.status != 'estornada')
  -- tira as 15 datas no futuro
  and t.data_transacao <= current_date()
