$("#city").empty()
  .append("<%= escape_javascript(render(:partial => 'search/city.html.erb', object: @cities)) %>")