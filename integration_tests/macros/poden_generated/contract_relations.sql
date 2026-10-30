{% macro poden_contract_relations(connector_type, request_kind=none) %}
  {% set entries = [
    ("dataforseo-labs", "keyword_list", "contract_00000000000000000000000000000001"),
    ("dataforseo-labs", "domain_rankings", "contract_00000000000000000000000000000002"),
    ("dataforseo-labs", "domain_pair", "contract_00000000000000000000000000000003"),
    ("dataforseo-labs", "keyword_expansion", "contract_00000000000000000000000000000004"),
    ("dataforseo-serp-advanced", none, "contract_00000000000000000000000000000005"),
    ("dataforseo-serp-advanced", none, "contract_00000000000000000000000000000006")
  ] %}
  {% set relations = [] %}
  {% for entry_type, entry_kind, table_name in entries %}
    {% if entry_type == connector_type and (request_kind is none or entry_kind == request_kind) %}
      {% do relations.append(source('poden', table_name)) %}
    {% endif %}
  {% endfor %}
  {{ return(relations) }}
{% endmacro %}
