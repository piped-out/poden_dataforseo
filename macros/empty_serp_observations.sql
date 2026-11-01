{% macro poden_dataforseo_empty_serp_observations() %}
select
  cast(null as string) as source,
  cast(null as string) as observation_key,
  cast(null as string) as keyword,
  cast(null as int64) as location_code,
  cast(null as string) as language_code,
  cast(null as timestamp) as observed_at,
  cast(null as struct<search_engine string, location_code int64, location_name string, language_code string, language_name string, device string, os string, depth int64, calculate_rectangles bool>) as search_settings,
  cast(null as array<struct<type string, rank_group int64, rank_absolute int64, domain string, url string, title string>>) as items,
  cast(null as string) as run_id,
  cast(null as string) as contract_relation
from unnest([1]) as empty_seed
where false
{% endmacro %}
