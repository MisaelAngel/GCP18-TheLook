view: test_derived_table {
  derived_table: {
    indexes: ["user.id"]
    sql:
    SELECT
      users.id  AS `users_id`,
      users.state  AS `users_state`
    FROM demo_db.users  AS users
    WHERE (users.state ) LIKE '%{% parameter like_param %}%'
    GROUP BY
      1,
      2
    ORDER BY
      users.id
  ;;
  datagroup_trigger: mtrmisathelook_default_datagroup
  }

  dimension: user_id {
    type: string
    label: "ID Of User"
    primary_key: yes
    sql: ${TABLE}.users_id ;;
  }

  dimension: user_state {
    label: "State Of User"
    type: string
    sql: ${TABLE}.users_state ;;
  }

  parameter: like_param {
    label: "Parameter To Filter On LIKE Clause"
    type: unquoted
  }
}
