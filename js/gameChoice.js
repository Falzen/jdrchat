const $gamesList = $('#gamesList');
$(document).ready(function() {
	init();
});
function init() {
	setEventListeners();
	setPlayer();
	getGamesByPlayerId(CURRENT_PLAYER.id);
	/* 
	TODO getAllPlayers() pour afficher la liste de tous joueurs
	et leur statut online ou offline au moment où on choisi un jeu.
	*/
	//getAllPlayers();
}
function setEventListeners() {
	$(document).on('click', 'li.one-game', function(ev) {
		var popupid = ev.currentTarget.dataset.popupid;
		var selectedGameId = ev.currentTarget.dataset.gameid;
		setServerSessionVar('current_gameid', selectedGameId);
		setGameMasterStatusByGameId(selectedGameId);
		closePopupById(popupid);
		doRedirectTo("index.php");

	});
}
function setServerSessionVar(key, val) {

	$.ajax({
        type: 'POST',
        url: 'php/sessionvariables.php',
        data: {
        	action: 'set',
        	key: key,
        	value: val
        },
        success: function (resultat, statut, erreur) {
            console.log('sessionvariables -> success');
        },
        error: function(resultat, statut, erreur) {
			console.log('%c sessionvariables JS -> error : ', 'color: tomato; font-size: 14px;');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);
        }
	});
}
function getServerSessionVar(key) {
	$.ajax({
		type: 'GET',
		url: 'php/sessionvariables.php',
		data: {
			action: 'set',
			key: key
		},
		success: function (resultat, statut, erreur) {
			console.log('getServerSessionVar -> success');
			if(resultat != 'null') {
				console.log(resultat);
			}
		},
		error: function(resultat, statut, erreur) {
			console.log('%c getServerSessionVar JS -> error : ', 'color: tomato; font-size: 14px;');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);
		}
	});
}
function setGameMasterStatusByGameId(selectedGameId) {
	$.ajax({
		type: 'GET',
		url: 'php/playersManager.php',
		data: {
			action: 'setGameMasterStatusByGameId',
			gid: selectedGameId
		},
		success: function (resultat, statut, erreur) {
			console.log('setGameMasterStatusByGameId -> success');
			console.log('resultat : ', resultat);
		},
		error: function(resultat, statut, erreur) {
			console.log('%c setGameMasterStatusByGameId JS -> error : ', 'color: tomato; font-size: 14px;');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);
		}
	});
}
function setPlayer(p) {
	var currentUserJson = $('#currentUserJson').text();
	CURRENT_PLAYER = JSON.parse(currentUserJson);
}
function closePopupById(popupid) {
	$('#'+popupid).removeClass('is-showing').addClass('is-hiding');
	$('#overlay').removeClass('is-showing').addClass('is-hiding');
}
function getGamesByPlayerId(pid) {

	$.ajax({
		type: 'GET',
		url: 'php/gamesManager.php',
		data: {
			action: 'getAvailableGames',
			playerid: pid
		},
		success: function (resultat, statut, erreur) {
			console.log('getGamesByPlayerId success ');
			if(resultat != 'null') {
				availableGames = JSON.parse(resultat);
				console.log('availableGames.length : ', availableGames.length);
				generateAvailableGames(availableGames);
			}
		},
		error: function(resultat, statut, erreur) {
			console.log('%c getGamesByPlayerId JS -> error : ', 'color: tomato; font-size: 14px;');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);
		}
	});
}
function generateAvailableGames(games) {
	for(var i=0; i<games.length; i++) {
		$gamesList.append(createGameListItemDOM(games[i]));
	}
}
function createGameListItemDOM(gameData) {
		var oneGameDOM = '<li class="one-game" data-gameid="' + gameData.id + '" data-popupid="gameChoicePopup">' +
			'<div class="game-name">' +
				'<h3 class="">' + gameData.nom + '</h3>' +
			  '</div>' +
			  '<div class="game-details">' +
				'<p class="description">' + gameData.description + '</p>' +
			  '</div>' +
		'</li>';
	return oneGameDOM;
}
function doRedirectTo(pagename) {
	setTimeout(function() {
		window.location.href = pagename;	
	}, 500);
}
