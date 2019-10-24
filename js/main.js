const $chatInput = $('#chatInput');
const $chatSend = $('#chatSend');
const $chatMessages = $('#chatMessages');
const $gamesList = $('#gamesList');
const $participantsList = $('#participantsList');
const $noteInput = $('#noteInput');
var CURRENT_PLAYER;
//const CHAT_COLORS = ['#697196','#966988','#968E69','#699677'];
// const CHAT_COLORS = ['#e50064','#954a97','#009ee3','#13a538','#0863b5','#fec600','#f39100','#e3001f'];
const CHAT_COLORS = ['#3cb44b', '#ffe119', '#4363d8', '#911eb4', '#46f0f0', '#f032e6', '#bcf60c', '#fabebe', '#008080', '#e6beff', '#aaffc3'];

/*
var chart_colors = new Map();
chart_colors.set('darkblueish', '#0863b5');
chart_colors.set('yellowish', '#fec600');
chart_colors.set('orangeish', '#f39100');
chart_colors.set('redish', '#e3001f');
chart_colors.set('deeppinkish', '#e50064');
chart_colors.set('violetish', '#954a97');
chart_colors.set('lightblueish', '#009ee3');
chart_colors.set('greenish', '#13a538');
*/

var all_players = [];
var current_game_players = [];
var chosenGameId = null;
var last_chat_refresh_date = null;
var chatRefreshingClock = null;

var d100_critical_fail_amount = 90;
var d100_critical_win_amount = 10;
//TODO chosenGameId should be in SESSION
$(document).ready(function() {
	init();
});

function generatePlayers(players) {
	for(var i=0; i<players.length; i++) {
		$participantsList.append(createPlayerDOM(players[i]));
	}
}
function createPlayerDOM(playerData) {

	var onePlayerDOM = '<li class="one-participant ' + playerData.pseudo;
    if(playerData.is_mj == 1) {
		onePlayerDOM += ' is-mj'
    }
    if(playerData.is_online == 1) {
    	onePlayerDOM += ' is-online"';
    	onePlayerDOM += ' style="background-color:' + CHAT_COLORS[playerData.id-1] + ';"';
    } else {
    	onePlayerDOM += ' is-offline"';
    }
	
	onePlayerDOM += '>';
	  onePlayerDOM += '<div class="participant">';
	    onePlayerDOM += '<p class="pseudo">' + playerData.pseudo;
        if(playerData.is_online == 0) {
    		onePlayerDOM += ' (offline)';
    	}
    	if(CURRENT_PLAYER.id == playerData.id) {
    		onePlayerDOM += ' (you)';
    	}
     	onePlayerDOM += '</p>';
	    onePlayerDOM += '<div class="details">';
	      onePlayerDOM += '<div class="details-content">';
	        onePlayerDOM += '<p class="level">Niveau ' + playerData.level + '</p>';
	        onePlayerDOM += '<ul class="skills">';
	          onePlayerDOM += '<li class="one-skill">skill a</li>';
	          onePlayerDOM += '<li class="one-skill">skill b</li>';
	        onePlayerDOM += '</ul>';
	        onePlayerDOM += '<p class="description">' + playerData.description + '</p>';
	      onePlayerDOM += '</div><br/>';
	    onePlayerDOM += '</div>';
	  onePlayerDOM += '</div>';
	onePlayerDOM += '</li>';
	return onePlayerDOM;
}

function generateAvailableGames(games) {
for(var i=0; i<games.length; i++) {
		$gamesList.append(createGameListItemDOM(games[i]));
	}
}
function createGameListItemDOM(gameData) {
		var oneGameDOM = '<li class="one-game" data-gameid="' + gameData.id + '">' +
			'<div class="game-name">' +
	            '<span class="">Jeu test 02</span>' +
	          '</div>' +
	          '<div class="game-details">' +
				'<span class="">Regles : ' + gameData.regles + '</span><br />' +
				'<span class="">Description : ' + gameData.description + '</span>' +
	          '</div>' +
      	'</li>';
	return oneGameDOM;
}

/*
TODO chuis une grosse feignasse
on affiche une variable de $_SESSION dans la vue (hyper bien cachée)
et on la récupère en la ciblant en JS. 
Niveau de sécurité : "indien" :((
*/
function setPlayer(p) {
	var currentUserJson = $('#currentUserJson').text();
	CURRENT_PLAYER = JSON.parse(currentUserJson);
}

function fetchChatMessage() {
	var messageText = $chatInput.val().trim();
	if(messageText == '') {
		return;
	}
	var newChatMessageData = makePlayerMessageObject('chatmsg', messageText);
	return newChatMessageData;
}

function writeChatMessages(data, shouldSave) {
	
	if(shouldSave == null || shouldSave == 'undefined') {
		shouldSave = false;
	}
	// no check for data!=null cause always a list (at least empty)
	if(!data[0]) {
		flashChatInput();
		return;
	}
	var allMessagesDOM = '';
	for(var i=0; i<data.length; i++) {
	    var newMessage = '<li style="color: ' + CHAT_COLORS[data[i].player_id-1] + ';" class="one-chat-message ' + data[i].type + ' ' + data[i].pseudo + '" data-when="' + data[i].when + '" title="' + data[i].date_creation + '">' +
	      '<span class="speaker-name">' + data[i].pseudo + ' : </span>' +
	      '<span class="speaker-text">' + data[i].msg_content + '</span>' +
	    '</li>';
	    allMessagesDOM += newMessage;
	}
    $chatMessages.append(allMessagesDOM);

    if(shouldSave) {
    	saveNewMessage(data);
    }
    $chatInput.val('');
    scrollToChatBottom();

}


function saveNewMessage(data) {
	console.log('data:  ', data);
    $.ajax({
        type: 'POST',
        url: 'php/messagesManager.php',
        data: {
        	action: 'saveMessage',
			type : data[0].type,
			player_id : data[0].player_id,
			game_id : data[0].game_id,
			pseudo : data[0].pseudo,
			date_creation : data[0].date_creation,
			msg_content : data[0].msg_content
        	
        },
        success: function (resultat, statut, erreur) {
            console.log('updateNoteInput -> success');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);

        },
        error: function(resultat, statut, erreur) {
			console.log('%c updateNoteInput JS -> error : ', 'color: tomato; font-size: 14px;');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);

        }
    });
}

function flashChatInput() {
	$chatInput.css('box-shadow', '0 0 5px 0px red inset');
	setTimeout(function() {
		$chatInput.css('box-shadow', '0 0 5px 0px transparent inset');
	}, 200);
}
function scrollToChatBottom() {
    $chatMessages.animate({
        scrollTop: $chatMessages.get(0).scrollHeight
    }, 300);
}
function makeNiceDate(ts) {
	var twoDigitMonth = (ts.getMonth()+1).length === 1 ? '0' + ts.getMonth()+1 : ts.getMonth()+1;
	var niceDate = ts.getDate() + "/" + twoDigitMonth + "/" + ts.getFullYear();
	return niceDate;
}
function setCurrentGame(gameid) {

}
function closeAllPlayersInfo() {
	$('li.one-participant').removeClass('is-open').scrollTop(0);
}
var msgsToSendAfterRefresh = null;
function setEventListeners() {
	
	$(document).on('click', 'li.one-game', function(ev) {
	})
	.on('click', '#chatSend', function(ev) {
		var newMsgList = [];
		newMsgList.push(fetchChatMessage());
		msgsToSendAfterRefresh = newMsgList;

		/*
		avant d'afficher, on récupère les messages manqués
		le message saisi est envoyé en callback au refresh
		*/
		refreshChat(msgsToSendAfterRefresh);
		
	})
	.on('keyup', '#chatInput', function(ev) {
		if(ev.keyCode == 13) {
			$chatSend.click();
		}
	})
	.on('click', '.one-tab-label', function(ev) {
		var clickedTabId = 'tab-' + ev.currentTarget.dataset.label;
		setCurrentTab(clickedTabId);
	})
	.on('click', 'li.one-participant.is-online:not(.is-open)', function(ev) {
		closeAllPlayersInfo();
		var otherPlayersHeight = ((current_game_players.length-1)*45);
		ev.currentTarget.style.height = $('#tab-players').height() - otherPlayersHeight + 'px';
		$(ev.currentTarget).addClass('is-open');
	})
	.on('click', 'li.one-participant.is-online.is-open', function(ev) {
		ev.currentTarget.scrollTop = 0;
		ev.currentTarget.style.height = '45px';
		ev.currentTarget.classList.remove('is-open');
	})
	.on('click', '.one-roll-container', function(ev) {
		var clickedDie = this.dataset.val;
		var res = roll(clickedDie);
		var target = 'd'+clickedDie+'Label';
		writeDiceRollResultOnDice(target, res);
		
		var diceRollMsg = makeDiceRollMsg(res, clickedDie);
		var diceRollMsgObj = makePlayerMessageObject('diceroll', diceRollMsg);
		writeChatMessages([diceRollMsgObj], true);
	})
	.on('blur', '#noteInput', function(ev) {
		updateNoteInput();
	})
	.on('click', '#refreshChat_TEMP', function() {
		// TODO delete me quand refresh auto
		refreshChat();
	});	
}

function refreshChat(newestMsgs) {
	$.ajax({
		type: 'GET',
		url: 'php/messagesManager.php',
		data: {
			action: 'refreshMessagesByGameIdAndMinDate',
			when: last_chat_refresh_date,
			gameid: chosenGameId
		},
		success: function (resultat, statut, erreur) {
			console.log('refreshMessagesByGameIdAndMinDate success');
			console.log('resultat : ', resultat);
			newMessages = JSON.parse(resultat);
			writeChatMessages(newMessages);
			updateLastChatRefreshDate();

			// si on vient de saisir un message, on l'affiche APRES les derniers récupérés
			if(newestMsgs) {
				writeChatMessages(newestMsgs, true);
			}

		},
		error: function(resultat, statut, erreur) {
			console.log('%c refreshMessagesByGameIdAndMinDate JS -> error : ', 'color: tomato; font-size: 14px;');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);
		}
	});
}

function updateLastChatRefreshDate() {
	console.log('updating date to right now');
	var dateNow = new Date();
	var year = dateNow.getFullYear();
	var month = (dateNow.getMonth()+1);
	var day = dateNow.getDate();
	var hours = dateNow.getHours()<10 ? '0'+dateNow.getHours() : dateNow.getHours();
	var minutes = dateNow.getMinutes()<10 ? '0'+dateNow.getMinutes() : dateNow.getMinutes();
	var seconds = dateNow.getSeconds()<10 ? '0'+dateNow.getSeconds() : dateNow.getSeconds();
	last_chat_refresh_date =  year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
}

function makePlayerMessageObject(msgType, msgContent) {
	var dateNow = new Date();
	var dateForSqlQuery = dateNow.getDate()  + "-" + (dateNow.getMonth()+1) + "-" + dateNow.getFullYear() + " " + dateNow.getHours() + ":" + dateNow.getMinutes() + ":" + dateNow.getSeconds();

	return {
		type : msgType,
		player_id : CURRENT_PLAYER.id,
		game_id : chosenGameId,
		date_creation : makeNiceDate(dateNow),
		when : dateForSqlQuery,
		pseudo : CURRENT_PLAYER.pseudo,
		msg_content : msgContent
	};
}

function getNotesByGameIdAndPlayerId(gid, pid) {
	$.ajax({
		type: 'GET',
		url: 'php/messagesManager.php',
		data: {
			action: 'getNotesByGameIdAndPlayerId',
			playerid: pid,
			gameid: gid
		},
		success: function (resultat, statut, erreur) {
			console.log('getNotesByGameIdAndPlayerId success ');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);
			if(resultat != 'null') {
				playerNotes = JSON.parse(resultat);
				setPlayerNotes(playerNotes);
			}
		},
		error: function(resultat, statut, erreur) {
			console.log('%c getGames JS -> error : ', 'color: tomato; font-size: 14px;');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);
		}
	});
}


function setPlayerNotes(notes) {
	$noteInput[0].dataset.noteid = notes.id;
	$noteInput.html(notes.html_content);
}

function updateNoteInput() {
	var notes = $noteInput.html();
	var notesId = $noteInput[0].dataset.no
	var gameid = chosenGameId;
    $.ajax({
        type: 'POST',
        url: 'php/messagesManager.php',
        data: {
        	action: 'upsertNoteInput',
        	nid: notesId,
        	gid: gameid,
        	notes: notes
        },
        success: function (resultat, statut, erreur) {
            console.log('updateNoteInput -> success');
        },
        error: function(resultat, statut, erreur) {
			console.log('%c updateNoteInput JS -> error : ', 'color: tomato; font-size: 14px;');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);

        }
    });
}


function makeDiceRollMsg(res, dice) {
	var msg = 'd'+dice+'&nbsp;&nbsp; -->  &nbsp;&nbsp;\''+res+'\'';
	switch(dice) {
		//case '4':break;case '6':break;case '12':break;case '20':break;
		case '100':
			if((res*100/dice) >= d100_critical_fail_amount) {
				return msg + ' crit fail. Ouch !';
			} else if((res*100/dice) <= d100_critical_win_amount) {
				return msg + ' crit win. GG !';
			}
		return msg;
		break;
	}
	return msg;
}
function setCurrentTab(tabid) {
	$('.one-tab-label').removeClass('is-selected');
	$('.label-'+tabid).addClass('is-selected');
	$('.one-tab-window').removeClass('is-selected');
	$('#'+tabid).addClass('is-selected');
}

function init() {
updateLastChatRefreshDate();
	setPlayer();
	getGames();
	
	/* 
	TODO chosenGameId devrait etre choisi depuis la page :
	niiiiice popup avant le chat ? 
	*/
	chosenGameId = 1;
	startChatRefreshingClock();
	

	/* 
	TODO getAllPlayers() pour afficher la liste de tous joueurs
	et leur statut online ou offline au moment où on choisi un jeu.
	*/
	//getAllPlayers();
	

	getPlayersByGameId();
	getMessagesByGameId(chosenGameId);
	getNotesByGameIdAndPlayerId(chosenGameId, CURRENT_PLAYER.id);
	setEventListeners();

	showPage();
}
function startChatRefreshingClock() {
	chatRefreshingClock = setInterval(function() {
		refreshChat();
	}, 5000);
}

function showPage() {
	$('.welcome').css('opacity', 1);
}
function getGames() {
	$.ajax({
		type: 'GET',
		url: 'php/gamesManager.php',
		data: {
			action: 'getAvailableGames'
		},
		success: function (resultat, statut, erreur) {
			console.log('getGames success');
			allGames = JSON.parse(resultat);
			generateAvailableGames(allGames);
		},
		error: function(resultat, statut, erreur) {
			console.log('%c getGames JS -> error : ', 'color: tomato; font-size: 14px;');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);
		}
	});
}

function getMessagesByGameId() {
	$.ajax({
		type: 'GET',
		url: 'php/messagesManager.php',
		data: {
			action: 'getMessagesByGameId',
			gameid: chosenGameId
		},
		success: function (resultat, statut, erreur) {
			console.log('getMessagesByGameId success');
			gameMessages = JSON.parse(resultat);
			writeChatMessages(gameMessages);
		},
		error: function(resultat, statut, erreur) {
			console.log('%c getMessagesByGameId JS -> error : ', 'color: tomato;');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);			
		}
	});
}

function getAllPlayers() {
	$.ajax({
		type: 'GET',
		url: 'php/playersManager.php',
		data: {
			action: 'getAllPlayers'
		},
		success: function (resultat, statut, erreur) {
			all_players = JSON.parse(resultat);
			
		},
		error: function(resultat, statut, erreur) {
			console.log('%c getAllPlayers JS -> error : ', 'color: tomato; font-size: 14px;');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);

		}
	});
}
function getPlayersByGameId() {
		$.ajax({
		type: 'GET',
		url: 'php/playersManager.php',
		data: {
			action: 'getPlayersByGameId',
			gid: chosenGameId
		},
		success: function (resultat, statut, erreur) {
			console.log('getPlayersByGameId success');
			current_game_players = JSON.parse(resultat);
			generatePlayers(current_game_players);
		},
		error: function(resultat, statut, erreur) {
			console.log('%c getAllPlayers JS -> error : ', 'color: tomato; font-size: 14px;');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);

		}
	});
}












function roll(max) {
	return getRandomInt(1, max);
}
function writeDiceRollResultOnDice(where, what) {
	document.getElementById(where).innerHTML = what;
}




function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

function getRandomItemFromArray(items) {  
  return items[Math.floor(Math.random()*items.length)];     
}