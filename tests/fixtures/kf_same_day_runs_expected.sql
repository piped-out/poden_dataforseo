select
  cast('shared' as string) as keyword,
  cast(2840 as int64) as location_code,
  cast('en' as string) as language_code,
  cast(20 as int64) as search_volume,
  cast(1.5 as float64) as cpc,
  cast(0.3 as float64) as competition,
  cast('LOW' as string) as competition_level,
  cast(25 as int64) as keyword_difficulty,
  cast('informational' as string) as main_intent,
  cast('2026-09-01T00:00:00Z' as timestamp) as data_as_of,
  cast('late' as string) as run_id,
  cast('2026-10-29T15:00:00Z' as timestamp) as run_started_at,
  cast('__dbt__cte__poden__contract_00000000000000000000000000000002' as string) as contract_relation
union all
select
  cast('only_late' as string) as keyword,
  cast(2840 as int64) as location_code,
  cast('en' as string) as language_code,
  cast(20 as int64) as search_volume,
  cast(1.5 as float64) as cpc,
  cast(0.3 as float64) as competition,
  cast('LOW' as string) as competition_level,
  cast(25 as int64) as keyword_difficulty,
  cast('informational' as string) as main_intent,
  cast('2026-09-01T00:00:00Z' as timestamp) as data_as_of,
  cast('late' as string) as run_id,
  cast('2026-10-29T15:00:00Z' as timestamp) as run_started_at,
  cast('__dbt__cte__poden__contract_00000000000000000000000000000002' as string) as contract_relation
union all
select
  cast('only_early' as string) as keyword,
  cast(2840 as int64) as location_code,
  cast('en' as string) as language_code,
  cast(10 as int64) as search_volume,
  cast(1.5 as float64) as cpc,
  cast(0.3 as float64) as competition,
  cast('LOW' as string) as competition_level,
  cast(25 as int64) as keyword_difficulty,
  cast('informational' as string) as main_intent,
  cast('2026-09-01T00:00:00Z' as timestamp) as data_as_of,
  cast('early' as string) as run_id,
  cast('2026-10-29T10:00:00Z' as timestamp) as run_started_at,
  cast('__dbt__cte__poden__contract_00000000000000000000000000000002' as string) as contract_relation
