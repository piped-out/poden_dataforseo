{# Each history entry has its own provider date, unlike current metrics.
   DataForSEO writes it as "YYYY-MM-DD HH:MM:SS +00:00", which CAST rejects. #}
{% macro poden_dataforseo_monthly_rows(kind, relation) %}
select keyword, location_code, language_code,
  date(volume.year, volume.month, 1) as month, volume.search_volume,
  data_as_of, run_id, run_started_at, call_index, call_row_index,
  '{{ relation }}' as contract_relation
from ({{ poden_dataforseo_keyword_rows(kind, relation) }}),
unnest(monthly_searches) as volume
{% if kind == 'keyword_list' %}
union all
select keyword, location_code, language_code,
  date(volume.year, volume.month, 1) as month, volume.search_volume,
  parse_timestamp('%Y-%m-%d %H:%M:%S %Ez', history.keyword_info.last_updated_time) as data_as_of,
  run_id, run_started_at, call_index, call_row_index,
  '{{ relation }}' as contract_relation
from {{ relation }}, unnest(volume_history.history) as history,
unnest(history.keyword_info.monthly_searches) as volume
where fill = 'volume_history'
{% endif %}
{% endmacro %}
