{% macro poden_dataforseo_empty_domain_rankings() %}
select
  cast(null as string) as domain,
  cast(null as string) as keyword,
  cast(null as int64) as location_code,
  cast(null as string) as language_code,
  cast(null as string) as run_id,
  cast(null as timestamp) as run_started_at,
  cast(null as int64) as rank_group,
  cast(null as int64) as rank_absolute,
  cast(null as string) as url,
  cast(null as float64) as etv,
  cast(null as int64) as search_volume,
  cast(null as string) as contract_relation
from unnest([1]) as empty_seed
where false
{% endmacro %}
