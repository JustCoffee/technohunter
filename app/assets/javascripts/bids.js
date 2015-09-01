$(document).ready(function() {
	$("#popup").magnificPopup();

	$("#new_bid").submit(function() {
		$.ajax({
			type: "POST",
			dataType: 'script',
			url: "bids/create",
			data: $(this).serialize()
		}).done(function() {
			alert($(this).serialize());
		});
	});
});