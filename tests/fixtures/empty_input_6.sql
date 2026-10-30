select
  cast(null as string) as keyword,
  cast(null as date) as date,
  cast(null as int64) as location_code,
  cast(null as string) as language_code,
  cast(null as timestamp) as datetime,
  cast(null as array<struct<type string, rank_group int64, rank_absolute int64, title string, url string, domain string>>) as items,
  cast(null as string) as observation_id,
  cast(null as struct<search_engine string, location_code int64, location_name string, language_code string, language_name string, device string, os string, depth int64>) as search_settings
from unnest([1]) as empty_seed
where false
