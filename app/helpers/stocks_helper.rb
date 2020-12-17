module StocksHelper
  def sort_order(column, title)
    css_class = (column == sort_column) ? "sort_current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == 'asc') ? 'desc' : 'asc'
    link_to title, { sort: column, direction: direction }, class: "sort_header #{css_class}"
  end
end
