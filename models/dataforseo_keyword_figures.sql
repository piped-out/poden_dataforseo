-- Latest keyword figures across every Labs contract.
{% set rels = poden_contract_relations('dataforseo-labs') %}
{% if rels %}
with input_rows as (
  {% set parts = [] %}
  {% for kind in ['keyword_list', 'domain_rankings', 'domain_pair', 'keyword_expansion'] %}
    {% for relation in poden_contract_relations('dataforseo-labs', kind) %}
      {% do parts.append(poden_dataforseo_keyword_rows(kind, relation)) %}
    {% endfor %}
  {% endfor %}
  {{ parts | join('
union all
') }}
)
select keyword, location_code, language_code,
  search_volume, cpc, competition, competition_level, keyword_difficulty, main_intent,
  data_as_of, run_id, run_started_at, contract_relation
from input_rows
qualify row_number() over (
  partition by keyword, location_code, language_code
  order by {{ poden_dataforseo_latest() }}
) = 1
{% else %}
{{ poden_dataforseo_empty_keyword_figures() }}
{% endif %}
