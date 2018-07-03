connection: "mak_test"

include: "*.view"

include: "*.dashboard"

datagroup: thesis_test_default_datagroup {
  max_cache_age: "24 hours"
}

persist_with: thesis_test_default_datagroup

# NOTE: please see https://looker.com/docs/r/sql/bigquery?version=5.14
# NOTE: for BigQuery specific considerations

explore: credits {}

explore: keywords {}

explore: links {}

explore: rating {}
