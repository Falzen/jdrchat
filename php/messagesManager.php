<?php
session_start();

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

        case 'upsertNoteInput' :
            if(isset($_REQUEST["nid"]) && !empty($_REQUEST["nid"])
                && isset($_REQUEST["notes"]) && !empty($_REQUEST["notes"])
            ) {
                $nid = $_REQUEST["nid"];
                $notes = $_REQUEST["notes"];
                updateNotes($nid, $notes);
            } 
            else if(isset($_REQUEST["gid"]) && !empty($_REQUEST["gid"])
                && isset($_REQUEST["notes"]) && !empty($_REQUEST["notes"])
            ) {
                $gid = $_REQUEST["gid"];
                $uid = $_SESSION['current_user']->id;
                $notes = $_REQUEST["notes"];
                saveNotes($uid, $gid, $notes);
                
            } else {
                echo "ERROR messagesManager.php getMessagesByGameId(gameid) : gameid not received";
            }
        break;

        case 'saveMessage' :
            if(isset($_REQUEST["type"]) && !empty($_REQUEST["type"])
                && isset($_REQUEST["player_id"]) && !empty($_REQUEST["player_id"])
                && isset($_REQUEST["date_creation_db"]) && !empty($_REQUEST["date_creation_db"])
                && isset($_REQUEST["pseudo"]) && !empty($_REQUEST["pseudo"])
                && isset($_REQUEST["msg_content"]) && !empty($_REQUEST["msg_content"])) {
                $msgData = (object) [
                    'type' => $_REQUEST['type'],
                    'player_id' => $_REQUEST['player_id'],
                    'date_creation_db' => $_REQUEST['date_creation_db'],
                    'pseudo' => $_REQUEST['pseudo'],
                    'msg_content' => $_REQUEST['msg_content']
                ];
                // could be htmlspecialchars for msg_cotent to prevent imgs and gifs
                saveMessage($msgData);
            } else {
                echo "ERROR messagesManager.php getMessagesByGameId(gameid) : gameid not received";
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
    $query .= " ORDER BY";
        $query .= " chat_messages.date_creation ASC";
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
    $db = getConn();

    $thePlayerNotes = null;
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
            'id' => $row['id'],
            'html_content' => $row['html_content']
        ];
    }

    $db = null;
    echo json_encode($thePlayerNotes);

}


function updateNotes($nid, $notes) {
    $db = getConn();


    $stmt = $db->prepare("UPDATE player_notes SET html_content = ? WHERE id = ?");
    

    $stmt->bindParam(1, $notes);
    $stmt->bindParam(2, $nid);

    $stmt->execute();
    $db = null;

    echo "updateNotes réussie.";
}

function saveNotes($uid, $gid, $notes) {
    $db = getConn();
    $stmtInsert = $db->prepare("INSERT INTO player_notes (player_id, game_id, html_content) VALUES (?, ?, ?)");
    $stmtInsert->execute(array($uid, $gid, $notes));
    $db = null;
}

function saveMessage($data) {
    $db = getConn();
    $stmtInsert = $db->prepare("INSERT INTO chat_messages (player_id, jeu_id, msg_content) VALUES (?, ?, ?)");
    $stmtInsert->execute(array($data->player_id, $data->jeu_id, $data->msg_content));
    $db = null;
}
?>