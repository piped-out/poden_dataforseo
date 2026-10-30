-- Full landed keyword-expansion v1 schema; unused fields are typed nulls.
select
  cast(null as date) as date,
  cast(null as string) as run_id,
  cast(null as timestamp) as run_started_at,
  cast(null as string) as endpoint,
  cast(null as struct<`request_kind` string, `location_code` int64, `language_code` string, `order_by` array<string>, `filters` string, `method` string, `seed_keywords` array<string>, `depth` int64, `row_count` int64>) as run_settings,
  cast(null as int64) as call_index,
  cast(null as int64) as call_row_index,
  cast(null as int64) as call_offset,
  cast(null as int64) as call_total_count,
  cast(null as float64) as call_cost_usd,
  cast(null as int64) as location_code,
  cast(null as string) as language_code,
  cast(null as string) as keyword,
  cast(null as timestamp) as data_as_of,
  cast(null as struct<`se_type` string, `keyword` string, `location_code` int64, `language_code` string, `keyword_info` struct<`se_type` string, `last_updated_time` string, `competition` float64, `competition_level` string, `cpc` float64, `search_volume` int64, `low_top_of_page_bid` float64, `high_top_of_page_bid` float64, `categories` array<int64>, `monthly_searches` array<struct<`year` int64, `month` int64, `search_volume` int64>>, `search_volume_trend` struct<`monthly` int64, `quarterly` int64, `yearly` int64>>, `keyword_info_normalized_with_bing` struct<`search_volume` int64, `last_updated_time` string, `is_normalized` bool>, `keyword_info_normalized_with_clickstream` struct<`search_volume` int64, `last_updated_time` string, `is_normalized` bool>, `clickstream_keyword_info` struct<`search_volume` int64, `last_updated_time` string>, `keyword_properties` struct<`se_type` string, `core_keyword` string, `synonym_clustering_algorithm` string, `keyword_difficulty` int64, `detected_language` string, `is_another_language` bool, `words_count` int64>, `serp_info` struct<`se_type` string, `check_url` string, `serp_item_types` array<string>, `se_results_count` int64, `last_updated_time` string, `previous_updated_time` string>, `avg_backlinks_info` struct<`se_type` string, `backlinks` float64, `dofollow` float64, `referring_pages` float64, `referring_domains` float64, `referring_main_domains` float64, `rank` float64, `main_domain_rank` float64, `last_updated_time` string>, `search_intent_info` struct<`se_type` string, `main_intent` string, `foreign_intent` array<string>, `last_updated_time` string>>) as keyword_data,
  cast(null as string) as seed_keyword,
  cast(null as int64) as depth
from unnest([1]) as empty_seed
where false
