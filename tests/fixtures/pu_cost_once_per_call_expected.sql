select
  cast('a' as string) as run_id,
  cast('2026-10-29T10:00:00Z' as timestamp) as run_started_at,
  cast('2026-10-29' as date) as date,
  cast('ranked_keywords' as string) as endpoint,
  cast('domain_rankings' as string) as request_kind,
  cast('{"request_kind":"domain_rankings","location_code":2840,"language_code":"en","order_by":[],"filters":"[]","row_start":0,"row_count":1000}' as string) as run_settings,
  cast(4 as int64) as rows_held,
  cast(2 as int64) as calls_with_rows,
  cast(0.0244 as float64) as cost_usd_of_calls_with_rows,
  cast('__dbt__cte__poden__contract_00000000000000000000000000000002' as string) as contract_relation
