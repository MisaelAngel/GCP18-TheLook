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
      type: looker_grid
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
