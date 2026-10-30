-- Latest available value for each keyword month, including historical entries.
{% set rels = poden_contract_relations('dataforseo-labs') %}
{% if rels %}
with input_rows as (
  {% set parts = [] %}
  {% for kind in ['keyword_list', 'domain_rankings', 'domain_pair', 'keyword_expansion'] %}
    {% for relation in poden_contract_relations('dataforseo-labs', kind) %}
      {% do parts.append(poden_dataforseo_monthly_rows(kind, relation)) %}
    {% endfor %}
  {% endfor %}
  {{ parts | join('
union all
') }}
)
select keyword, location_code, language_code, month, search_volume,
  data_as_of, run_id, contract_relation
from input_rows
qualify row_number() over (
  partition by keyword, location_code, language_code, month
  order by {{ poden_dataforseo_latest() }}
) = 1
{% else %}
{{ poden_dataforseo_empty_keyword_monthly_volume() }}
{% endif %}
