$("#model_search").empty()
  .append("<%= escape_javascript(render(:partial => 'cars/mark.html.erb', object: @marks)) %>")