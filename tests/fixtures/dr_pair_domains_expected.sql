select
  cast('first.com' as string) as domain,
  cast('shared' as string) as keyword,
  cast(2840 as int64) as location_code,
  cast('en' as string) as language_code,
  cast('a' as string) as run_id,
  cast('2026-10-29T10:00:00Z' as timestamp) as run_started_at,
  cast(1 as int64) as rank_group,
  cast(1 as int64) as rank_absolute,
  cast('https://first.com/' as string) as url,
  cast(20 as float64) as etv,
  cast(100 as int64) as search_volume,
  cast('__dbt__cte__poden__contract_00000000000000000000000000000003' as string) as contract_relation
union all
select
  cast('second.com' as string) as domain,
  cast('shared' as string) as keyword,
  cast(2840 as int64) as location_code,
  cast('en' as string) as language_code,
  cast('a' as string) as run_id,
  cast('2026-10-29T10:00:00Z' as timestamp) as run_started_at,
  cast(2 as int64) as rank_group,
  cast(2 as int64) as rank_absolute,
  cast('https://second.com/' as string) as url,
  cast(20 as float64) as etv,
  cast(100 as int64) as search_volume,
  cast('__dbt__cte__poden__contract_00000000000000000000000000000003' as string) as contract_relation
union all
select
  cast('first.com' as string) as domain,
  cast('gap' as string) as keyword,
  cast(2840 as int64) as location_code,
  cast('en' as string) as language_code,
  cast('a' as string) as run_id,
  cast('2026-10-29T10:00:00Z' as timestamp) as run_started_at,
  cast(1 as int64) as rank_group,
  cast(1 as int64) as rank_absolute,
  cast('https://first.com/' as string) as url,
  cast(20 as float64) as etv,
  cast(100 as int64) as search_volume,
  cast('__dbt__cte__poden__contract_00000000000000000000000000000003' as string) as contract_relation
