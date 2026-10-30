-- Coverage describes bought rows, grouped independently of continuation ranges.
{% set rels = poden_contract_relations('dataforseo-labs', 'domain_rankings') + poden_contract_relations('dataforseo-labs', 'domain_pair') + poden_contract_relations('dataforseo-labs', 'keyword_expansion') %}
{% if rels %}
with input_rows as (
  {% set parts = [] %}
  {% for kind in ['domain_rankings', 'domain_pair', 'keyword_expansion'] %}
  {% for relation in poden_contract_relations('dataforseo-labs', kind) %}
    {% set projection %}
    select '{{ relation }}' as contract_relation, keyword, location_code,
      language_code,
      to_json_string((select as struct run_settings.* except({% if kind != 'keyword_expansion' %}row_start, {% endif %}row_count))) as query_settings,
      run_id, run_started_at, date, call_total_count, call_index, call_row_index
    from {{ relation }}
  {% endset %}
  {% do parts.append(projection) %}
  {% endfor %}
  {% endfor %}
  {{ parts | join('\nunion all\n') }}
)
select contract_relation, location_code, language_code, query_settings,
  count(distinct keyword) as rows_held,
  count(*) - count(distinct keyword) as overlap_rows,
  array_agg(struct(call_total_count, run_id, date)
    order by run_started_at desc, run_id desc, call_index, call_row_index
    limit 1)[offset(0)].call_total_count as last_observed_total,
  array_agg(struct(call_total_count, run_id, date)
    order by run_started_at desc, run_id desc, call_index, call_row_index
    limit 1)[offset(0)].run_id as last_run_id,
  array_agg(struct(call_total_count, run_id, date)
    order by run_started_at desc, run_id desc, call_index, call_row_index
    limit 1)[offset(0)].date as last_run_date
from input_rows
group by contract_relation, location_code, language_code, query_settings
{% else %}
{{ poden_dataforseo_empty_coverage() }}
{% endif %}
