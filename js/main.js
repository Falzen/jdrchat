

$(document).ready(function() {
	setEventListeners();
	    scrollToLastMessage();
});


function setCurrentTab(tabid) {
	$('.one-tab-label').removeClass('is-selected');
	console.log('.label-'+tabid);
	$('.label-'+tabid).addClass('is-selected');
	$('.one-tab-window').removeClass('is-selected');
	$('#'+tabid).addClass('is-selected');
}

function setEventListeners() {
	$('.one-tab-label').click(function(ev) {
		var clickedTabId = 'tab-' + ev.currentTarget.dataset.label;
		console.log('clickedTabId : ', clickedTabId);
		setCurrentTab(clickedTabId);
	});

	$('#chatSend').click(function() {
		var userinput = $('#chatInput').val();
		writeInChat(userinput);
		$('#chatInput').val('');
	    scrollToLastMessage();
	});
	}
	function scrollToLastMessage() {
		$('#chatMessages').animate({
			scrollTop: $('#chatMessages').get(0).scrollHeight
		}, 500);
	}
	function writeInChat(msg) {
	var msgDom = '<li class="one-chat-message message-container">' +
              '<div class="message-content">You : ' + msg + '</div>' +
            '</li>';
	$('#chatMessages').append(msgDom);
}