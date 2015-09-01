$("#brand").empty()
  .append("<%= escape_javascript(render(:partial => 'search/brand.html.erb', object: @brands)) %>")