select
  cast('shared' as string) as keyword,
  cast(null as date) as date,
  cast(2840 as int64) as location_code,
  cast('en' as string) as language_code,
  cast('2026-10-29T12:00:00Z' as timestamp) as datetime,
  cast([cast(struct(cast('organic' as string) as type, cast(1 as int64) as rank_group, cast(1 as int64) as rank_absolute, cast('Result' as string) as title, cast('https://first.com/' as string) as url, cast('first.com' as string) as domain) as struct<type string, rank_group int64, rank_absolute int64, title string, url string, domain string>)] as array<struct<type string, rank_group int64, rank_absolute int64, title string, url string, domain string>>) as items,
  cast('first' as string) as observation_id,
  cast(struct(cast('google' as string) as search_engine, cast(2840 as int64) as location_code, cast(null as string) as location_name, cast('en' as string) as language_code, cast(null as string) as language_name, cast('desktop' as string) as device, cast('windows' as string) as os, cast(10 as int64) as depth) as struct<search_engine string, location_code int64, location_name string, language_code string, language_name string, device string, os string, depth int64>) as search_settings
