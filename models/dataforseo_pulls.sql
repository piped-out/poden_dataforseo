-- Aggregate held rows by call before adding costs across a run.
{% set rels = poden_contract_relations('dataforseo-labs') %}
{% if rels %}
with input_rows as (
  {% for relation in rels %}
    {% if not loop.first %}union all{% endif %}
    select run_id, run_started_at, date, endpoint, run_settings.request_kind,
      to_json_string(run_settings) as run_settings, call_index, request_cost_usd,
      '{{ relation }}' as contract_relation
    from {{ relation }}
  {% endfor %}
), calls as (
  select run_id, run_started_at, date, endpoint, request_kind, run_settings,
    contract_relation, call_index, count(*) as rows_held,
    max(request_cost_usd) as request_cost_usd
  from input_rows
  group by all
)
select run_id, run_started_at, date, endpoint, request_kind, run_settings,
  sum(rows_held) as rows_held, count(*) as calls_with_rows,
  cast(sum(cast(request_cost_usd as numeric)) as float64) as cost_usd_of_calls_with_rows, contract_relation
from calls
group by all
{% else %}
{{ poden_dataforseo_empty_pulls() }}
{% endif %}
