{% macro poden_dataforseo_empty_coverage() %}
select
  cast(null as string) as contract_relation,
  cast(null as int64) as location_code,
  cast(null as string) as language_code,
  cast(null as string) as query_settings,
  cast(null as int64) as rows_held,
  cast(null as int64) as overlap_rows,
  cast(null as int64) as last_observed_total,
  cast(null as string) as last_run_id,
  cast(null as date) as last_run_date
from unnest([1]) as empty_seed
where false
{% endmacro %}
