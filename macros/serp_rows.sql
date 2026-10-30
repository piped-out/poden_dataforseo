{# Project both providers to one observation shape, with ordering only for Labs. #}
{% macro poden_dataforseo_serp_rows(connector_type, relation) %}
{% if connector_type == 'dataforseo-serp-advanced' %}
select 'serp_advanced' as source, observation_id as observation_key,
  keyword, location_code, language_code, datetime as observed_at,
  search_settings,
  array(select as struct item.type, item.rank_group, item.rank_absolute,
    item.domain, item.url, item.title from unnest(items) as item) as items,
  cast(null as string) as run_id, '{{ relation }}' as contract_relation,
  cast(null as timestamp) as data_as_of, cast(null as timestamp) as run_started_at,
  cast(null as int64) as call_index, cast(null as int64) as call_row_index
from {{ relation }}
{% else %}
select 'labs_historical' as source,
  concat(keyword, '|', cast(location_code as string), '|', language_code, '|',
    format_timestamp('%Y-%m-%dT%H:%M:%SZ', historical_serp.datetime, 'UTC')) as observation_key,
  keyword, location_code, language_code, historical_serp.datetime as observed_at,
  cast(null as struct<search_engine string, location_code int64, location_name string,
    language_code string, language_name string, device string, os string, depth int64>) as search_settings,
  array(select as struct item.type, item.rank_group, item.rank_absolute,
    item.domain, item.url, item.title from unnest(historical_serp.items) as item) as items,
  run_id, '{{ relation }}' as contract_relation,
  data_as_of, run_started_at, call_index, call_row_index
from {{ relation }}
where fill = 'historical_serps'
{% endif %}
{% endmacro %}
