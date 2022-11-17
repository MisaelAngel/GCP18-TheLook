- dashboard: embed
  title: Embed
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  filters:

  elements:
    - name: lookembed
      title: Untitled Visualization
      model: mtrmisathelook
      explore: order_items
      type: looker_column
      fields: [order_items.id, order_items.sale_price]
      limit: 500
      dynamic_fields:
      - category: table_calculation
      expression: "${order_items.sale_price}*2"
      label: tc
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: tc
      _type_hint: number
      query_timezone: Asia/Kolkata
      show_view_names: false
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      table_theme: white
      limit_displayed_rows: false
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: 12
      rows_font_size: 12
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      defaults_version: 1


    - name: tileembed
      title: Untitled Visualization
      model: mtrmisathelook
      explore: order_items
      type: table
      fields: [order_items.id, order_items.sale_price]
      limit: 500
      dynamic_fields:
      - category: table_calculation
      expression: "${order_items.sale_price}*2"
      label: tc
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: tc
      _type_hint: number
      query_timezone: Asia/Kolkata


    - name: bar
      title: Untitled Visualization
      model: mtrmisathelook
      explore: order_items
      type: looker_column
      fields: [orders.count, orders.created_month]
      fill_fields: [orders.created_month]
      filters:
        orders.created_year: '2018'
      sorts: [orders.created_month desc]
      limit: 10
      dynamic_fields:
      - category: table_calculation
        expression: sum(${orders.count})
        label: tc
        value_format:
        value_format_name:
        _kind_hint: measure
        table_calculation: tc
        _type_hint: number
      query_timezone: Asia/Kolkata
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types:
        orders.count: line
      show_sql_query_menu_options: false
      show_totals: true
      show_row_totals: true
      show_row_numbers: false
      transpose: false
      truncate_text: true
      truncate_header: false
      size_to_fit: true
      table_theme: white
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: '12'
      rows_font_size: '12'
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hide_totals: false
      hide_row_totals: false
      defaults_version: 1
