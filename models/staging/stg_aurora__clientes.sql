WITH fonte AS (
    SELECT * FROM {{ source('aurora', 'clientes') }}
)

select
    cliente_id,
    lpad(cast(cnpj as string), 14, '0') as cnpj,
    nome_fantasia,
    cidade,
    upper(uf)                           as uf,
    plano_id,
    data_cadastro,
    status,
    canal_aquisicao,
    cast(mcc_principal as string)       as mcc_principal
from fonte
