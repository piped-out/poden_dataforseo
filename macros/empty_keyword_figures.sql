{% macro poden_dataforseo_empty_keyword_figures() %}
select
  cast(null as string) as keyword,
  cast(null as int64) as location_code,
  cast(null as string) as language_code,
  cast(null as int64) as search_volume,
  cast(null as float64) as cpc,
  cast(null as float64) as competition,
  cast(null as string) as competition_level,
  cast(null as int64) as keyword_difficulty,
  cast(null as string) as main_intent,
  cast(null as timestamp) as data_as_of,
  cast(null as string) as run_id,
  cast(null as timestamp) as run_started_at,
  cast(null as string) as contract_relation
from unnest([1]) as empty_seed
where false
{% endmacro %}
