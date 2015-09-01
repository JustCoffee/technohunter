$ ->
  $(document).on 'change', '#equip_brand', (evt) ->
    if $("#equip_brand option:selected").text() == "Other..."
      $("#other_brand").show()
      $("#other_model").show()
      $("#model").hide()
    else
      $("#other_brand").hide()
      $("#other_model").hide()
      $("#model").show()

    $.ajax 'update_marks_equip',
      type: 'GET'
      dataType: 'script'
      data: {
        brand: $("#equip_brand option:selected").text()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")