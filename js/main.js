const $chatInput = $('#chatInput');
const $chatSend = $('#chatSend');
const $chatMessages = $('#chatMessages');
const $gamesList = $('#gamesList');
const $participantsList = $('#participantsList');
const $noteInput = $('#noteInput');
var CURRENT_PLAYER;
//const CHAT_COLORS = ['#697196','#966988','#968E69','#699677'];
const CHAT_COLORS = ['#e50064','#954a97','#009ee3','#13a538','#0863b5','#fec600','#f39100','#e3001f'];
/*var chart_colors = new Map();
chart_colors.set('darkblueish', '#0863b5');
chart_colors.set('yellowish', '#fec600');
chart_colors.set('orangeish', '#f39100');
chart_colors.set('redish', '#e3001f');
chart_colors.set('deeppinkish', '#e50064');
chart_colors.set('violetish', '#954a97');
chart_colors.set('lightblueish', '#009ee3');
chart_colors.set('greenish', '#13a538');*/
const FAKE_chat_messages = ['Mauris dictum interdum odio, ac facilisis nunc dictum ut.', 'Vivamus interdum orci et semper aliquet.', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.', 'Vivamus interdum orci et semper aliquet.', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.', 'Vivamus interdum orci et semper aliquet.', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.', 'Vivamus interdum orci et semper aliquet.', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.', 'Vivamus interdum orci et semper aliquet.', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.', 'Vivamus interdum orci et semper aliquet.', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.', 'Vivamus interdum orci et semper aliquet.', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.', 'Vivamus interdum orci et semper aliquet.', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.'];
const FAKE_players = [
	{
		id : 1,
		pseudo : 'Falzen',
		level : '1',
		description : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo turpis, pulvinar et pulvinar eu, elementum quis erat. Donec faucibus elit vel porta tincidunt.'
	},
	{
		id : 2,
		pseudo : 'Freyggen',
		level : '2',
		description : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo turpis, pulvinar et pulvinar eu, elementum quis erat. Donec faucibus elit vel porta tincidunt. Mauris vulputate ornare purus, id aliquet odio malesuada eu.'
	},
	{
		id : 3,
		pseudo : 'Démonique',
		level : '3',
		description : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo turpis, pulvinar et pulvinar eu, elementum quis erat. Donec faucibus elit vel porta tincidunt. Mauris vulputate ornare purus, id aliquet odio malesuada eu. Aliquam tempor, mauris nec venenatis tincidunt, libero lacus feugiat elit, sit amet dictum erat dui id enim. Integer tempor velit vitae tortor fermentum dictum. Morbi condimentum euismod nibh sed pulvinar. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo turpis, pulvinar et pulvinar eu, elementum quis erat. Donec faucibus elit vel porta tincidunt. Mauris vulputate ornare purus, id aliquet odio malesuada eu. Aliquam tempor, mauris nec venenatis tincidunt, libero lacus feugiat elit, sit amet dictum erat dui id enim. Integer tempor velit vitae tortor fermentum dictum. Morbi condimentum euismod nibh sed pulvinar. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo turpis, pulvinar et pulvinar eu, elementum quis erat. Donec faucibus elit vel porta tincidunt. Mauris vulputate ornare purus, id aliquet odio malesuada eu. Aliquam tempor, mauris nec venenatis tincidunt, libero lacus feugiat elit, sit amet dictum erat dui id enim. Integer tempor velit vitae tortor fermentum dictum. Morbi condimentum euismod nibh sed pulvinar.'
	}
];
var d100_critical_fail_amount = 90;
var d100_critical_win_amount = 10;
//TODO chosenGameId should be in SESSION
var chosenGameId = null;
$(document).ready(function() {
	init();
});

function generateChatMessages(msgs) {
	for(var i=0; i<msgs.length; i++) {
		$chatInput.val(msgs[i]);
		CURRENT_PLAYER = getRandomItemFromArray(FAKE_players);
		$chatSend.click();
		setPlayer();
	}
}
function generatePlayers(players) {
	for(var i=0; i<players.length; i++) {
		$participantsList.append(createPlayerDOM(players[i]));
	}
}
function createPlayerDOM(playerData) {
		/*
	id
pseudo
level
description
username
password
is_online
date_derniere_connexion
date_creation
*/
console.log(playerData.pseudo + ' : ', playerData.is_online);
	var onePlayerDOM = '<li class="one-participant ' + playerData.pseudo;
    if(playerData.is_online == 1) {
    	onePlayerDOM += ' is-online';
    } else {
    	onePlayerDOM += ' is-offline';
    }
	onePlayerDOM += '" style="background-color:' + CHAT_COLORS[playerData.id-1] + ';">';
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
function setPlayer() {
	CURRENT_PLAYER = {
		id : 1,
		pseudo : 'Falzen',
		level : '99'
	}
}
function fetchChatMessage() {
	var messageText = $chatInput.val().trim();
	if(messageText == '') {
		return;
	}
	var newChatMessageData = {
		type : 'chatmsg',
		who : CURRENT_PLAYER,
		message : {
			date : makeNiceDate(new Date()),
			text : messageText
		}
	};
	return newChatMessageData;
}

function writeChatMessages(data) {
	var allMessagesDOM = '';
	for(var i=0; i<data.length; i++) {
	    var newMessage = '<li style="color: ' + CHAT_COLORS[data[i].player_id-1] + ';" class="one-chat-message" title="' + data[i].date_creation + '">' +
	      '<span class="speaker-name">' + data[i].pseudo + ' : </span>' +
	      '<span class="speaker-text">' + data[i].msg_content + '</span>' +
	    '</li>';
	    allMessagesDOM += newMessage;
	}
    $chatMessages.append(allMessagesDOM);

}
function writeChatMessage(data) {

	if(!data) {
		flashChatInput();
		return;
	}

    var newMessage = '<li style="color: ' + CHAT_COLORS[data.who.id-1] + ';" class="one-chat-message ' + data.type + '" title="' + data.message.date + '">' +
      '<span class="speaker-name">' + data.who.pseudo + ' : </span>' +
      '<span class="speaker-text">' + data.message.text + '</span>' +
    '</li>';
    $chatMessages.append(newMessage);
    $chatInput.val('');
    scrollToChatBottom();
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
function setEventListeners() {
	
	$(document).on('click', 'li.one-game', function(ev) {
		var chosenGameId = ev.currentTarget.dataset.gameid;
		setCurrentGame(chosenGameId);
	})
	.on('click', '#chatSend', function(ev) {
		writeChatMessage(fetchChatMessage());
	})
	.on('keyup', '#chatInput', function(ev) {
		if(ev.keyCode == 13) {
			$chatSend.click();
		}
	})
	.on('click', '.one-tab-label', function(ev) {
		var clickedTabId = 'tab-' + ev.currentTarget.dataset.label;
		console.log('clickedTabId : ', clickedTabId);
		setCurrentTab(clickedTabId);
	})
	.on('mouseenter', 'li.one-participant.is-online', function(ev) {
		var otherPlayersHeight = ((FAKE_players.length-1)*45);
		ev.currentTarget.style.height = $('#tab-players').height() - otherPlayersHeight + 'px';
	})
	.on('mouseleave', 'li.one-participant.is-online', function(ev) {
		ev.currentTarget.scrollTop = 0;
		ev.currentTarget.style.height = '45px';
	})
	.on('click', '.one-roll-container', function(ev) {
		var clickedDie = this.dataset.val;
		var res = roll(clickedDie);
		var target = 'd'+clickedDie+'Label';
		writeDiceRollResultOnDice(target, res);
		
		var diceRollMsg = makeDiceRollMsg(res, clickedDie);
		var diceRollMsgObj = {
			type : 'diceroll',
			who : CURRENT_PLAYER,
			message : {
				date : makeNiceDate(new Date()),
				text : diceRollMsg
			}
		};
		writeChatMessage(diceRollMsgObj);
	})
	.on('blur', '#noteInput', function(ev) {
		updateNoteInput();
	});

	
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
			playerNotes = JSON.parse(resultat);
			setPlayerNotes(playerNotes);
		},
		error: function(resultat, statut, erreur) {
			console.log('getGames JS -> error');
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
	var notesId = $noteInput[0].dataset.noteid;
    $.ajax({
        type: 'POST',
        url: 'php/messagesManager.php',
        data: {
        	action: 'updateNoteInput',
        	nid: notesId,
        	notes: notes
        },
        success: function (resultat, statut, erreur) {
            console.log('updateNoteInput -> success');
			console.log('resultat : ', resultat);
			console.log('statut : ', statut);
			console.log('erreur : ', erreur);
        },
        error: function(resultat, statut, erreur) {
			console.log('updateNoteInput JS -> error');
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
				console.log(msg + ' crit fail. Ouch !');
				return msg + ' crit fail. Ouch !';
			} else if((res*100/dice) <= d100_critical_win_amount) {
				console.log(msg + 'crit win. GG !');
				return msg + ' crit win. GG !';
			}
		return msg;
		break;
	}
		return msg;
}
function setCurrentTab(tabid) {
	$('.one-tab-label').removeClass('is-selected');
	console.log('.label-'+tabid);
	$('.label-'+tabid).addClass('is-selected');
	$('.one-tab-window').removeClass('is-selected');
	$('#'+tabid).addClass('is-selected');
}

function init() {
	setPlayer();
	//generatePlayers(FAKE_players);
	getAllPlayers();
	setEventListeners();
	getGames();
	chosenGameId = 1;
	getMessagesByGameId(chosenGameId);
	getNotesByGameIdAndPlayerId(chosenGameId, CURRENT_PLAYER.id);
}


function getGames() {
	$.ajax({
		type: 'GET',
		url: 'php/gamesManager.php',
		data: {
			action: 'getAvailableGames'
		},
		success: function (resultat, statut, erreur) {
			allGames = JSON.parse(resultat);
			generateAvailableGames(allGames);
		},
		error: function(resultat, statut, erreur) {
			console.log('getGames JS -> error');
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
			console.log('resultat : ', resultat);
			gameMessages = JSON.parse(resultat);
			console.log('gameMessages : ', gameMessages);
			writeChatMessages(gameMessages);
		},
		error: function(resultat, statut, erreur) {
			console.log('getMessagesByGameId JS -> error');
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
			allPlayers = JSON.parse(resultat);
			generatePlayers(allPlayers);
		},
		error: function(resultat, statut, erreur) {
			console.log('getAllPlayers JS -> error');
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