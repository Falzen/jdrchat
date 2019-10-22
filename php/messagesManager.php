<?php

require_once("config.php"); 

if(isset($_REQUEST["action"]) && !empty($_REQUEST["action"])) {
    $action = $_REQUEST["action"];
    switch($action) {

        case "getMessagesByGameId" :
                if(isset($_REQUEST["gameid"]) && !empty($_REQUEST["gameid"])) {
                    $gameid = $_REQUEST["gameid"];
                    getMessagesByGameId($gameid);
                } else {
                    echo "ERROR messagesManager.php getMessagesByGameId(gameid) : gameid not received";
                }
        break;

        case "getNotesByGameIdAndPlayerId" :
                if(isset($_REQUEST["playerid"]) && !empty($_REQUEST["playerid"])
                    && isset($_REQUEST["gameid"]) && !empty($_REQUEST["gameid"])) {
                    $playerid = $_REQUEST["playerid"];
                    $gameid = $_REQUEST["gameid"];
                    getNotesByGameIdAndPlayerId($gameid, $playerid);
                } else {
                    echo "ERROR messagesManager.php getNotesByGameIdAndPlayerId($gameid, $playerid) : something not received";
                }
        break;

        default:
        echo "nothing happened";
        break;

    }// end switch action
}// end if isset action


function getMessagesByGameId($gameid) {
    $db = getConn();
    $allMessages = [];
    
    $query = "SELECT chat_messages.id as msg_id,";
        $query .= " chat_messages.player_id as msg_playerid,";
        $query .= " chat_messages.jeu_id as msg_gameid,";
        $query .= " chat_messages.date_creation as msg_date,";
        $query .= " chat_messages.msg_content as msg_content,";
        $query .= " players.pseudo as pseudo,";
        $query .= " jeuxplayersxref.player_id as player_id,";
        $query .= " jeuxplayersxref.jeu_id";
    $query .= " FROM";
        $query .= " chat_messages, players, jeuxplayersxref"; 
    $query .= " WHERE";
        $query .= " chat_messages.jeu_id = ?";
        $query .= " AND jeuxplayersxref.player_id = chat_messages.player_id";
        $query .= " AND players.id = chat_messages.player_id";
        $query .= " AND jeuxplayersxref.jeu_id = chat_messages.jeu_id";
 	$stmt = $db->prepare($query);
    $stmt->bindParam(1, $gameid);
	$stmt->execute();

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $oneMessage = (object) [
            'id' => $row['msg_id'],
            'player_id' => $row['msg_playerid'],
            'jeu_id' => $row['msg_gameid'],
            'date_creation' => $row['msg_date'],
            'msg_content' => $row['msg_content'],
            'player_id' => $row['player_id'],
            'pseudo' => $row['pseudo']
        ];
        array_push($allMessages, $oneMessage);
    }

    $db = null;
    echo json_encode($allMessages);
}


function getNotesByGameIdAndPlayerId($gameid, $playerid) {
    $query = "SELECT id,";
        $query .= " html_content,";
        $query .= " player_id,";
        $query .= " game_id";
    $query .= " FROM";
        $query .= " player_notes"; 
    $query .= " WHERE";
        $query .= " player_id = ?";
        $query .= " AND game_id = ?";


    $stmt = $db->prepare($query);
    $stmt->bindParam(1, $playerid);
    $stmt->bindParam(2, $gameid);
    $stmt->execute();

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $thePlayerNotes = (object) [
            'html_content' => $row['html_content']
        ];
    }

    $db = null;
    echo json_encode($thePlayerNotes);

}

?>