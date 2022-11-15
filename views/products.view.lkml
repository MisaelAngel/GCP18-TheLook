view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  filter: category_filter {
    type: string
    suggest_explore: products
    suggest_dimension: products.category
  }

  filter: brand_filter {
    type: string
    suggest_explore: products
    suggest_dimension: products.brand
  }

  filter: inventory_items_id_filter {
    type: string
    suggest_explore: products
    suggest_dimension: products.brand
  }


  dimension: category_comparison {
    type: string
    sql:
        {% condition category_filter %}
        ${category}
        {% endcondition %}
        OR
        {% condition brand_filter %}
        ${brand}
        {% endcondition %}
      ;;
  }

  filter: users_first_name_filter {
    type: string
    suggest_explore: order_items
    suggest_dimension: users.first_name
  }

  dimension: user_comparison {
    type: string
    sql:
        {% condition users_first_name_filter %}
        users.first_name
        {% endcondition %}
        OR
        {% condition brand_filter%}
        ${brand}
        {% endcondition %}
      ;;
  }




  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
