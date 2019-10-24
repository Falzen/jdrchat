$(document).ready(function() {
	$(document).on('mousedown', '#signin,#login', function(ev) {
		openingBook();
		ev.stopPropagation();
	}).on('mouseup', '#signin,#login', function(ev) {
		openBook();
		ev.stopPropagation();
	}).on('mousedown', 'html', function(ev) {
		closeBook();
		ev.stopPropagation();
	}).on('focus', '#inputUsername', function(ev) {
		$('#inputUsername').removeClass('input-error');
		ev.stopPropagation();
	}).on('focus', '#inputPassword', function(ev) {
		$('#inputPassword').removeClass('input-error');
		ev.stopPropagation();
	});
	$('#signin').mousedown(function(ev) {
		if($('#pageContent').hasClass('is-open')) {
			$('#signin').addClass('watched').removeClass('not-watched');
			$('#login').addClass('not-watched').removeClass('watched');
		}
	});
	$('#login').mousedown(function(ev) {
		if($('#pageContent').hasClass('is-open')) {
			$('#login').addClass('watched').removeClass('not-watched');
			$('#signin').addClass('not-watched').removeClass('watched');
		}
	});


	$('button#login-btn').on('click', function() {
		var usernameInput = $('#login-inputUsername').val().trim();
		var passwordInput = $('#login-inputPassword').val().trim();
		var pseudoInput = $('#login-inputPseudo').val().trim();
		if(usernameInput != '' && passwordInput != ''&& pseudoInput != '') {
			tryLogin(usernameInput, passwordInput, pseudoInput);
		}
	});
	$('button#signin-btn').on('click', function() {
		var usernameInput = $('#signin-inputUsername').val().trim();
		var passwordInput = $('#signin-inputPassword').val().trim();
		var pseudoInput = $('#signin-inputPseudo').val().trim();
		if(usernameInput != '' && passwordInput != '' && pseudoInput != '') {
			trySignin(usernameInput, passwordInput, pseudoInput);
		}
	});
});
function openingBook() {
	$('#pageContent').addClass('is-opening');
}
function openBook() {
	$('#pageContent').addClass('is-open');
}
function closeBook() {
	$('#pageContent').removeClass('is-open is-opening');
}
function hideEverything() {
	$('section').addClass('fade');
}
function tryLogin(usernameInput, passwordInput, pseudoInput) {
	$.ajax({
        type: 'POST',
        url: 'php/loginManager.php',
        data: {
        	action: 'tryLogin',
        	usernameInput: usernameInput,
        	passwordInput: passwordInput,
        	pseudoInput: pseudoInput
        },
        success: function (resultat, statut, erreur) {
            console.log('tryLogin -> success');
            var res = JSON.parse(resultat);
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);
        	if(res.code == 'nope') {
        		doErrorLogin();
        	} 
        	else if(res.code = 'aaight') {
        		doRedirectToWelcome();
        	}
        },
        error: function(resultat, statut, erreur) {
			console.log('%c tryLogin JS -> error : ', 'color: tomato; font-size: 14px;');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);

        }
	});
}

function trySignin(usernameInput, passwordInput, pseudoInput) {
	$.ajax({
        type: 'POST',
        url: 'php/loginManager.php',
        data: {
        	action: 'trySignin',
        	usernameInput: usernameInput,
        	passwordInput: passwordInput,
        	pseudoInput: pseudoInput
        },
        success: function (resultat, statut, erreur) {
            console.log('trySignin -> success');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);
            var res = JSON.parse(resultat);
			console.log('res : ', res);
        	if(res.code == 'PSEUDO_ALREADY_TAKEN') {
        		alert('PSEUDO_ALREADY_TAKEN');
        		doErrorSignin();
        	} 
        	else if(res.code = 'aaight') {
        		doRedirectToWelcome();
        	}
        },
        error: function(resultat, statut, erreur) {
			console.log('%c trySignin JS -> error : ', 'color: tomato; font-size: 14px;');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);

        }
	});
}

function doErrorLogin() {
	$('#login-inputUsername').val('').addClass('input-error');
	$('#login-inputPassword').val('').addClass('input-error');
}
function doErrorSignin() {
	$('#signin-inputUsername').val('').addClass('input-error');
	$('#signin-inputPassword').val('').addClass('input-error');
	$('#signin-inputPseudo').val('').addClass('input-error');
}
function doRedirectToWelcome() {
	// $('#inputUsername').val('');
	// $('#inputPassword').val('');
	setTimeout(function() {
		closeBook();
	}, 200);
	setTimeout(function() {
		hideEverything();	
	}, 500);
	setTimeout(function() {
		//alert('nav');
		window.location.href = "index.php";	
	}, 1800);
}