view: credits {
  sql_table_name: mak_test_data.credits ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cast {
    type: string
    sql: ${TABLE}.cast ;;
  }

  dimension: crew {
    type: string
    sql: ${TABLE}.crew ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [id]
  }
}
