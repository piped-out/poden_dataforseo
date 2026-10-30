{# Project each landed Labs kind to common fields before any cross-kind union. #}
{% macro poden_dataforseo_keyword_rows(kind, relation) %}
{% set figures = 'metrics' if kind == 'keyword_list' else 'keyword_data' %}
select keyword, location_code, language_code, data_as_of, run_id,
  run_started_at, call_index, call_row_index,
  '{{ relation }}' as contract_relation,
  {{ figures }}.keyword_info.search_volume as search_volume,
  {{ figures }}.keyword_info.cpc as cpc,
  {{ figures }}.keyword_info.competition as competition,
  {{ figures }}.keyword_info.competition_level as competition_level,
  {{ figures }}.keyword_properties.keyword_difficulty as keyword_difficulty,
  {{ figures }}.search_intent_info.main_intent as main_intent,
  array(select as struct volume.year, volume.month, volume.search_volume
    from unnest({{ figures }}.keyword_info.monthly_searches) as volume) as monthly_searches
from {{ relation }}
{% if kind == 'keyword_list' %}where fill = 'metrics'{% endif %}
{% endmacro %}
