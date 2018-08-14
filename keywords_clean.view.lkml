view: keywords_clean {
  label: "Keywords"
  derived_table: {
    sql: SELECT row_number() over (order by id) as prim_key, id, replace(replace(replace(sub, '"', ''), '-', ''), "name': '", '') as keyword
      FROM
      (SELECT id, ltrim(rtrim(split(keywords), "'}]"), "'': ") as sub
          FROM [movie-project-208020:mak_test_data.keywords])
                where sub not like "%id%" and sub not like '['
       ;;
  }

  measure: count {
    type: count
    drill_fields: [keyword, movies.title]
  }

  dimension: prim_key {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.prim_key ;;
  }

  dimension: id {
    hidden: yes
    type: number
    sql: ${TABLE}.id2 ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }
}
