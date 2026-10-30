select
  cast('serp_advanced' as string) as source,
  cast('depth10' as string) as observation_key,
  cast('shared' as string) as keyword,
  cast(2840 as int64) as location_code,
  cast('en' as string) as language_code,
  cast('2026-10-29T12:00:00Z' as timestamp) as observed_at,
  cast(struct('google' as search_engine, 2840 as location_code, cast(null as string) as location_name, 'en' as language_code, cast(null as string) as language_name, 'desktop' as device, 'windows' as os, 10 as depth) as struct<search_engine string, location_code int64, location_name string, language_code string, language_name string, device string, os string, depth int64>) as search_settings,
  cast([struct('organic' as type, 1 as rank_group, 1 as rank_absolute, 'first.com' as domain, 'https://first.com/' as url, 'Result' as title)] as array<struct<type string, rank_group int64, rank_absolute int64, domain string, url string, title string>>) as items,
  cast(null as string) as run_id,
  cast('__dbt__cte__poden__contract_00000000000000000000000000000005' as string) as contract_relation
union all
select
  cast('serp_advanced' as string) as source,
  cast('depth100' as string) as observation_key,
  cast('shared' as string) as keyword,
  cast(2840 as int64) as location_code,
  cast('en' as string) as language_code,
  cast('2026-10-29T12:00:00Z' as timestamp) as observed_at,
  cast(struct('google' as search_engine, 2840 as location_code, cast(null as string) as location_name, 'en' as language_code, cast(null as string) as language_name, 'desktop' as device, 'windows' as os, 100 as depth) as struct<search_engine string, location_code int64, location_name string, language_code string, language_name string, device string, os string, depth int64>) as search_settings,
  cast([struct('organic' as type, 1 as rank_group, 1 as rank_absolute, 'first.com' as domain, 'https://first.com/' as url, 'Result' as title)] as array<struct<type string, rank_group int64, rank_absolute int64, domain string, url string, title string>>) as items,
  cast(null as string) as run_id,
  cast('__dbt__cte__poden__contract_00000000000000000000000000000005' as string) as contract_relation
