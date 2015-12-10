module ApplicationHelper
  # change the default link renderer for will_paginate
  def will_paginate(collection_or_options = nil, options = {})
    require './lib/foundation_pagination_renderer'
    if collection_or_options.is_a? Hash
      options, collection_or_options = collection_or_options, nil
    end
    options = { class: 'pagination', inner_window: 3, outer_window: 2, renderer: FoundationPaginationRenderer, previous_label: '&laquo;'.html_safe, next_label: '&raquo;'.html_safe }.merge(options)
    super *[collection_or_options, options].compact
  end
end
