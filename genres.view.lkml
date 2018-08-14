view: genres {
  derived_table: {
    sql: SELECT row_number() over (order by id) as prim_key, id, replace(sub, "'name': '", '') as genre
      FROM
      (SELECT id,  ltrim(rtrim(split(genres, ','), "'}]0123456789"), "[{'id':'name':0123456789") as sub
      FROM [movie-project-208020:mak_test_data.movies]) as subq
      where sub not like "%id%"
       ;;
  }

  measure: count {
    type: count
    drill_fields: [genre]
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
    sql: ${TABLE}.id ;;
  }

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
  }

}
