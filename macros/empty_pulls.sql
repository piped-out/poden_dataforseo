{% macro poden_dataforseo_empty_pulls() %}
select
  cast(null as string) as run_id,
  cast(null as timestamp) as run_started_at,
  cast(null as date) as date,
  cast(null as string) as endpoint,
  cast(null as string) as request_kind,
  cast(null as string) as run_settings,
  cast(null as int64) as rows_held,
  cast(null as int64) as calls_with_rows,
  cast(null as float64) as cost_usd_of_calls_with_rows,
  cast(null as string) as contract_relation
from unnest([1]) as empty_seed
where false
{% endmacro %}
