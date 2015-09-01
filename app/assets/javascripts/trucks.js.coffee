$ ->
  $(document).on 'change', '#truck_brand', (evt) ->

    if $("#truck_brand option:selected").text() == "Other..."
      $("#other_brand").show()
      $("#other_model").show()
      $("#model").hide()
    else
      $("#other_brand").hide()
      $("#other_model").hide()
      $("#model").show()

    $.ajax 'update_marks_truck',
      type: 'GET'
      dataType: 'script'
      data: {
        brand: $("#truck_brand option:selected").text()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

  $(document).on 'change', '#truck_region', (evt) ->

    $.ajax 'update_cities',
      type: 'GET'
      dataType: 'script'
      data: {
        region: $("#truck_region option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")