$("#truck_model").empty()
  .append("<%= escape_javascript(render(:partial => 'cars/mark.html.erb', object: @marks)) %>")