# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'change', '#region', (evt) ->

    $.ajax
      url: '../update_cities'
      type: 'GET'
      dataType: 'script'
      data: {
        region_id: $("#region option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

  $(document).on 'change', '#auto_type', (evt) ->

	    $.ajax 
	      url: '../search/update_brands'
	      type: 'GET'
	      dataType: 'script'
	      data: {
	        type_id: $("#auto_type option:selected").val()
	      }
	      error: (jqXHR, textStatus, errorThrown) ->
	        console.log("AJAX Error: #{textStatus}")
	      success: (data, textStatus, jqXHR) ->
	        console.log("Dynamic country select OK!")

  $(document).on 'change', '#brand', (evt) ->

	    if $("#car_brand option:selected").text() == "Other"
	      $("#other_brand_search").show()
	      $("#other_model_search").show()
	      $("#model").hide()
	    else
	      $("#other_brand_search").hide()
	      $("#other_model_search").hide()
	      $("#model").show()

	    $.ajax
	      url: '../search/update_marks_search'
	      type: 'GET'
	      dataType: 'script'
	      data: {
	        brand: $("#brand option:selected").val()
	        type_id: $("#auto_type option:selected").val()
	      }
	      error: (jqXHR, textStatus, errorThrown) ->
	        console.log("AJAX Error: #{textStatus}")
	      success: (data, textStatus, jqXHR) ->
	        console.log("Dynamic country select OK!")
