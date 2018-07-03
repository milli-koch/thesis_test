view: links {
  sql_table_name: mak_test_data.links ;;

  dimension: imdb_id {
    type: number
    sql: ${TABLE}.imdbId ;;
  }

  dimension: movie_id {
    type: number
    sql: ${TABLE}.movieId ;;
  }

  dimension: tmdb_id {
    type: number
    sql: ${TABLE}.tmdbId ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: []
  }
}
