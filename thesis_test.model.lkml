connection: "mak_test"

include: "*.view"

include: "*.dashboard"

datagroup: thesis_test_default_datagroup {
  max_cache_age: "24 hours"
}

persist_with: thesis_test_default_datagroup

explore: credits {}

explore: movies {
  sql_always_where: ${movies.title} is not null and ${movies.status} = "Released";;
  join: keywords_clean {
    sql_on: ${movies.id} = ${keywords_clean.id} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: genres {
    sql_on: ${movies.id} = ${genres.id} ;;
    relationship: one_to_many
    type: left_outer
  }
}

explore: genres {}

explore: keywords_clean {}
