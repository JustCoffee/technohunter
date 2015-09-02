#= require fotorama

$ ->
  $(document).on 'change', '#car_brand', (evt) ->
    if $("#car_brand option:selected").text() == "Other..."
      $("#other_brand").show()
      $("#other_model").show()
      $("#model").hide()
    else
      $("#other_brand").hide()
      $("#other_model").hide()
      $("#model").show()

    $.ajax 'update_marks',
      type: 'GET'
      dataType: 'script'
      data: {
        brand: $("#car_brand option:selected").text()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")


  $(document).on 'change', '#car_region', (evt) ->

    $.ajax 'update_cities',
      type: 'GET'
      dataType: 'script'
      data: {
        region: $("#car_region option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")
