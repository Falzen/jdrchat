$(document).ready(function() {
	$(document).on('click', '#pageContent', function(ev) {
		console.log('open');
		$(ev.currentTarget).addClass('is-open');
		ev.stopPropagation();
	}).on('click', '#login-page', function(ev) {
		$('#pageContent').removeClass('is-open');
	});
});

