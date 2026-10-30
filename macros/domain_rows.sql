{# A pair contributes each ranked domain, retaining the source row indexes. #}
{% macro poden_dataforseo_domain_rows(kind, relation) %}
{% set elements = ['ranked_serp_element.serp_item'] if kind == 'domain_rankings' else ['first_domain_serp_element', 'second_domain_serp_element'] %}
{% for element in elements %}
{% if not loop.first %}union all{% endif %}
select {{ element }}.domain as domain, keyword, location_code, language_code,
  run_id, run_started_at, {{ element }}.rank_group as rank_group,
  {{ element }}.rank_absolute as rank_absolute, {{ element }}.url as url,
  {{ element }}.etv as etv, keyword_data.keyword_info.search_volume as search_volume,
  '{{ relation }}' as contract_relation, call_index, call_row_index
from {{ relation }}
where {{ element }} is not null
{% endfor %}
{% endmacro %}
