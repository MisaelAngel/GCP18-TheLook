view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: char_test {
    string_datatype: unicode
    sql: CONCAT(${first_name},"A-κόσμεBC,D-�E123 ࠀ-5") ;;
  }

  dimension: regexp_replace {
    type: string
    sql: REPLACE(${char_test},'?','') ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    map_layer_name: us_states
    link: {
      label: "Test"
      url: "https://gcpl2218.cloud.looker.com/dashboards/3?State={{ value | url_encode}}&Created+Year="
    }
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: age_functions{
    type: number
    sql: CASE WHEN {%parameter type_of_function%} = 'AVG'
          THEN AVG(${age})
        ELSE
          round(100*${count},0)
        END;;
     html: {% if type_of_function._parameter_value == "'AVG'" %}
             {{ users.count._value | floor}}h {{ users.count._value | times: 67 | modulo: 60}}m
           {% else %}
             {{ rendered_value | append: "%" }}
           {% endif %}
     ;;
  }

#= "AVG"
#          THEN AVG(${age})
#        ELSE
#          MAX(${age})
#        END
  parameter: type_of_function {
    type: string
    label: "Function"
    allowed_value: {
      label: "Average Age"
      value: "AVG"
    }
    allowed_value: {
      label: "Highest Age"
      value: "MAX"
    }
    allowed_value: {
      label: "Lowest Age"
      value: "MIN"
    }
  }


  parameter: filter_date {
    type: date
  }
  dimension_group: filter_start_date {
    type: time
    timeframes: [raw, date, time]
# sql: TIMESTAMP_SUB((${filter_date}), INTERVAL 0 DAY);;
# sql: TIMESTAMP_SUB($conversation_sta, INTERVAL 0 DAY);;
    sql: {% parameter filter_date%} ;;
    html: {{ rendered_value | date: "%Y-%d-%m" }};;
  }

  dimension: is_selected_timeframe {
    type: yesno
    sql: ${conversation_start_date}= ${filter_start_date_date};;
  }

  dimension_group: conversation_start {
    label: "Exit Conversation Start"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      hour,
      minute10,
      hour_of_day,
      minute,
      time_of_day,
      minute5,
      second,
      microsecond,
      millisecond,
      day_of_week_index,
      day_of_week
    ]
    drill_fields: []
    sql: ${TABLE}.created_at ;;
    html: {{ rendered_value | date: "%Y-%d-%m" }};;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      events.count,
      orders.count,
      saralooker.count,
      sindhu.count,
      user_data.count
    ]
  }
}
