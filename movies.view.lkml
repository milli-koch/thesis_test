view: movies {
  sql_table_name: mak_test_data.movies ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

#   dimension: adult {
#     type: yesno
#     sql: ${TABLE}.adult ;;
#   }

  dimension: belongs_to_collection {
    type: string
    sql: ${TABLE}.belongs_to_collection ;;
  }

  dimension: budget {
    type: string
    sql: ${TABLE}.budget ;;
  }

  dimension: genres {
    type: string
    sql: ${TABLE}.genres ;;
  }

  dimension: homepage {
    type: string
    sql: ${TABLE}.homepage ;;
  }

  dimension: imdb_id {
    hidden: yes
    type: string
    sql: ${TABLE}.imdb_id ;;
  }

  dimension: original_language {
    type: string
    sql: ${TABLE}.original_language ;;
  }

#   dimension: original_title {
#     type: string
#     sql: ${TABLE}.original_title ;;
#   }

  dimension: overview {
    type: string
    sql: ${TABLE}.overview ;;
  }

  dimension: popularity {
    type: number
    sql: ${TABLE}.popularity ;;
  }

#   dimension: poster_path {
#     type: string
#     sql: ${TABLE}.poster_path ;;
#   }

  dimension: production_companies {
    type: string
    sql: ${TABLE}.production_companies ;;
  }

  dimension: production_countries {
    type: string
    sql: ${TABLE}.production_countries ;;
  }

  dimension_group: release {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.release_date ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
    value_format_name: usd_0
  }

  dimension: runtime {
    hidden: yes
    type: number
    sql: CAST(${TABLE}.runtime AS float);;
  }

  measure: average_runtime {
    type: average
    sql: ${runtime} ;;
  }

  dimension: spoken_languages {
    type: string
    sql: ${TABLE}.spoken_languages ;;
  }

  dimension: status {
    hidden: yes
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: tagline {
    type: string
    sql: ${TABLE}.tagline ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
    link: {
      label: "IMDb"
      url:"https://www.imdb.com/title/{{ ['movies.imdb_id'] }}"
      icon_url: "https://imdb.com/favicon.ico"
    }
    link: {
      label: "{{ ['movies.homepage_link'] }}"
      url: "{{ ['movies.homepage'] }}"
    }
  }

  dimension: has_homepage{
    hidden: yes
    type: yesno
    sql: ${homepage} is not null ;;
  }

  dimension: homepage_link {
    hidden: yes
    sql: CASE WHEN ${has_homepage} THEN "Homepage" ELSE "∅" END ;;
  }

#   dimension: video {
#     type: yesno
#     sql: ${TABLE}.video ;;
#   }

  dimension: vote_average {
    hidden: yes
    type: number
    sql:CAST(${TABLE}.vote_average AS float);;
  }

  measure: vote_avg {
    label: "Vote Average"
    type: average
    sql: ${vote_average} ;;
    value_format_name: decimal_2
  }

  dimension: vote_count {
    type: number
    sql: ${TABLE}.vote_count ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [id]
  }
}
