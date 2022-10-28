view: pdt_test {
  derived_table: {
    explore_source: order_items {
      column: state { field: users.state }
      column: count { field: users.count }
    }
    datagroup_trigger: mtrmisathelook_default_datagroup
  }
  dimension: state {
    description: ""
  }
  dimension: count {
    description: ""
    type: number
  }
}
