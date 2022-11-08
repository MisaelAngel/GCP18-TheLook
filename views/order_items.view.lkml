view: order_items {
  sql_table_name: demo_db.order_items  ;;
  drill_fields: [id]
  set: asknicely_drill_fields_set {
    fields: [order_id]
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: program_medical_progress__first_oymr_relative_weight_change {
    type: number
    sql: ROUND(${returned_week_of_year},2) ;;
    group_label: "Program Medical Progress"
    group_item_label: "First Oymr Relative Weight Change"
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
  measure: total_nps_responses {
    hidden: yes
    type: count
    filters: [sale_price: ">=0,NOT NULL", returned_date: "NOT NULL"]
  }
  measure: promoters_count {
    description: "Number of NPS scores equal to 9 or 10"
    view_label: "Survey Questions"
    group_label: "NPS"
    type: count
    filters: [sale_price: ">=9,NOT NULL", returned_date: "NOT NULL"]
  }
  measure: detractors_count {
    description: "Number of NPS scores less 6"
    view_label: "Survey Questions"
    group_label: "NPS"
    type: count
    filters: [sale_price: "<=6 AND >=0,NOT NULL", returned_date: "NOT NULL"]
  }

}
