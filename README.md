# poden_dataforseo

A dbt package combining a Workspace's Poden DataForSEO Labs contracts and
SERP Advanced observations into six standard table models. Requires dbt
1.12 or later and the BigQuery adapter.

## Install and use

Add the package to the root project's `packages.yml`, pinned to a release:

```yaml
packages:
  - git: "https://github.com/piped-out/poden_dataforseo.git"
    revision: v0.1.0
```

Download the Workspace's generated sources and macros from Poden and place
them in the root project. They include `poden_contract_relations`, which
selects every matching contract and records its dbt source dependency.
A new contract joins the models at the next parse without editing SQL.

With a BigQuery profile configured for the root project, run:

```sh
dbt deps
dbt build --select package:poden_dataforseo
```

Every model has an enforced column contract. With no matching contracts,
it builds an empty table with the same columns. The package's own model
tests are disabled unless `poden_dataforseo_unit_tests` is explicitly true.

## Models

| Model | Grain and selection |
| --- | --- |
| `dataforseo_keyword_figures` | Latest keyword and market figures across Labs contracts, with the winning run and contract |
| `dataforseo_keyword_monthly_volume` | Latest value per keyword, market and month, including volume history |
| `dataforseo_serp_observations` | Every SERP Advanced observation ID and each distinct Labs historical page |
| `dataforseo_domain_rankings` | Domain, keyword, market and run; first returned row within a run |
| `dataforseo_pulls` | Run holding rows, with distinct-call cost and held-row counts |
| `dataforseo_coverage` | Contract, market and query settings, with distinct held keywords, overlap and latest reported total |

Latest means descending `data_as_of` with null last, then descending
`run_started_at` and `run_id`, then ascending `call_index` and
`call_row_index`. Monthly history uses each entry's own provider date.
SERP Advanced observations retain full search settings and are not collapsed
by keyword or timestamp. A repeated Labs historical page keeps its latest row.
`contract_relation` is the rendered source relation in every model.
Domain rankings is clustered by domain, then keyword.

Coverage counts bought rows, not current completeness. It excludes keyword-list
fills and does not change after a pull holding no rows. Domain totals are
only over the rows held, not the provider's whole-domain totals. Pull costs
count each call once, even when its cost appears on every returned row.

## Package verification

`integration_tests` installs this local package and contains generator-checked
source fixtures for every Labs kind and two SERP Advanced contracts. Its 12
permanent model tests use typed SQL inputs, with no source tables required:

```sh
cd integration_tests
dbt deps
dbt test --select test_type:unit
```

`integration_tests_empty` reads six empty input tables named `input_1` through
`input_6` in the profile's target dataset. Its source declarations carry the
full landed v1 schema for each Labs kind and SERP Advanced. Create those empty
tables with the declared schemas before running `dbt build`. This exercises
every union across kinds even when no rows are held. The offline parse owner
also checks the separate no-contract case with freshly generated files.
Use a separately authorized BigQuery project and dataset for either live project. Their profile name is `fixture`. The checked-in generated files
are test fixtures; do not commit generated directories to a customer Pipeline.

The live RED/GREEN, empty builds, full column and clustering readback, and
proof-dataset deletion are recorded in
`docs/references/evidence/poden-dataforseo-package-live-proof.md` in the Poden
application repository.
