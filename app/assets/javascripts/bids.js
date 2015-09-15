$(document).on("page:change", function() {
  $("#popup").magnificPopup();

  $("#new_bid").submit(function(e) {
  	e.preventDefault();
    $.ajax({
      type: 'POST',
      dataType: 'html',
      url: $(this).attr("action"),
      data: $(this).serialize(),
      success: function() {
        $("#popup").magnificPopup('close'); 
        alert("Спасибо за заявку!");
      }
    });
  });
});