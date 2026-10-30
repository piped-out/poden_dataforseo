-- Observation IDs preserve settings and timestamp ties; Labs pages keep their latest row.
{% set rels = poden_contract_relations('dataforseo-labs', 'keyword_list') + poden_contract_relations('dataforseo-serp-advanced') %}
{% if rels %}
with input_rows as (
  {% set parts = [] %}
  {% for connector_type in ['dataforseo-labs', 'dataforseo-serp-advanced'] %}
    {% for relation in poden_contract_relations(connector_type, 'keyword_list' if connector_type == 'dataforseo-labs' else none) %}
      {% do parts.append(poden_dataforseo_serp_rows(connector_type, relation)) %}
    {% endfor %}
  {% endfor %}
  {{ parts | join('
union all
') }}
)
select * except(data_as_of, run_started_at, call_index, call_row_index)
from input_rows
qualify source = 'serp_advanced' or row_number() over (
  partition by source, observation_key
  order by {{ poden_dataforseo_latest() }}
) = 1
{% else %}
{{ poden_dataforseo_empty_serp_observations() }}
{% endif %}
