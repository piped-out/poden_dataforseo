select
  cast('shared' as string) as keyword,
  cast(2840 as int64) as location_code,
  cast('en' as string) as language_code,
  cast('2026-08-01' as date) as month,
  cast(300 as int64) as search_volume,
  cast('2026-09-20T00:00:00Z' as timestamp) as data_as_of,
  cast('a' as string) as run_id,
  cast('__dbt__cte__poden__contract_00000000000000000000000000000001' as string) as contract_relation
