{{ config(severity = 'warn') }}

-- Regra de negocio: contestacao nao pode valer mais que a transacao.

select
    cb.chargeback_id,
    cb.transacao_id,
    cb.valor_centavos       as valor_contestado,
    abs(t.valor_centavos)   as valor_transacao

from {{ ref('stg_aurora__chargebacks') }} cb

inner join {{ ref('stg_aurora__transacoes') }} t
    on cb.transacao_id = t.transacao_id

where cb.valor_centavos > abs(t.valor_centavos)
