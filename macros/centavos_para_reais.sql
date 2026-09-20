{% macro centavos_para_reais(coluna) %}
    round({{ coluna }} / 100.0, 2)
{% endmacro %}
