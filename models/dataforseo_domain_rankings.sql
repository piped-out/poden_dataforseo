-- Preserve run history and keep the first occurrence of a ranked keyword per run.
{% set rels = poden_contract_relations('dataforseo-labs', 'domain_rankings') + poden_contract_relations('dataforseo-labs', 'domain_pair') %}
{% if rels %}
with input_rows as (
  {% set parts = [] %}
  {% for kind in ['domain_rankings', 'domain_pair'] %}
    {% for relation in poden_contract_relations('dataforseo-labs', kind) %}
      {% do parts.append(poden_dataforseo_domain_rows(kind, relation)) %}
    {% endfor %}
  {% endfor %}
  {{ parts | join('
union all
') }}
)
select * except(call_index, call_row_index)
from input_rows
qualify row_number() over (
  partition by domain, keyword, location_code, language_code, run_id
  order by call_index, call_row_index
) = 1
{% else %}
{{ poden_dataforseo_empty_domain_rankings() }}
{% endif %}
