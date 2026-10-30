{% macro poden_dataforseo_empty_keyword_monthly_volume() %}
select
  cast(null as string) as keyword,
  cast(null as int64) as location_code,
  cast(null as string) as language_code,
  cast(null as date) as month,
  cast(null as int64) as search_volume,
  cast(null as timestamp) as data_as_of,
  cast(null as string) as run_id,
  cast(null as string) as contract_relation
from unnest([1]) as empty_seed
where false
{% endmacro %}
