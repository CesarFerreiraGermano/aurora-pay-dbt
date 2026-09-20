-- Teste singular: retorna as linhas ERRADAS. Zero linhas = passou.

select
    transacao_id,
    valor_centavos,
    status

from {{ ref('fct_transacoes') }}

where valor_centavos < 0
  and status != 'estornada'
