{# Shared spec 265 ordering. Indexes select the first occurrence within a run. #}
{% macro poden_dataforseo_latest() %}
data_as_of desc nulls last, run_started_at desc, run_id desc,
call_index asc, call_row_index asc
{% endmacro %}
