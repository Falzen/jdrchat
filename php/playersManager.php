<?php
session_start();
require_once("config.php"); 
if(isset($_REQUEST["action"]) && !empty($_REQUEST["action"])) {
    $action = $_REQUEST["action"];
    switch($action) {
        case "createNewMap" :
        $newMap = json_decode($_REQUEST["content"]);
        createNewMap($newMap);
        break;
        case "getAllPlayers" :
            getAllPlayers();
        break;
        case "getPlayersByGameId" :
        if(isset($_REQUEST["gid"]) && !empty($_REQUEST["gid"])) {
            getPlayersByGameId($_REQUEST["gid"]);
        }
        break;
        case "setGameMasterStatusByGameId" :
        if(isset($_REQUEST["gid"]) && !empty($_REQUEST["gid"])) {
            setGameMasterStatusByGameId($_REQUEST["gid"]);
        }
        break;
        default:
        echo "nothing happened";
        break;
    }// end switch action
}// end if isset action
function getAllPlayers() {
    $db = getConn();
    $allPlayers = [];

    $query = "SELECT id, pseudo, level, description, is_online, date_derniere_connexion, date_creation FROM players";
 	$stmt = $db->prepare($query);
	$stmt->execute();
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $onePlayer = (object) [
            'id' => $row['id'],
            'pseudo' => $row['pseudo'],
            'level' => $row['level'],
            'description' => $row['description'],
            'is_online' => $row['is_online'],
            'date_derniere_connexion' => $row['date_derniere_connexion'],
            'date_creation' => $row['date_creation']
        ];
        array_push($allPlayers, $onePlayer);
    }
    $db = null;
    echo json_encode($allPlayers);
}
function setGameMasterStatusByGameId($gid) {
    $db = getConn();
    $uid = $_SESSION['current_user']->id;
    $onePlayer = null;
    $query = "SELECT p.id as id, p.pseudo as pseudo, p.level as level, p.description as description, p.is_online as is_online, p.date_derniere_connexion as date_derniere_connexion, p.date_creation as date_creation, xref.is_mj as is_mj FROM players as p, jeuxplayersxref as xref WHERE p.id = ? AND xref.player_id = p.id AND xref.game_id = ?";
    $stmt = $db->prepare($query);
    $stmt->execute(array($uid, $gid));

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $onePlayer = (object) [
            'id' => $row['id'],
            'pseudo' => $row['pseudo'],
            'level' => $row['level'],
            'description' => $row['description'],
            'is_online' => $row['is_online'],
            'is_mj' => $row['is_mj'],
            'date_derniere_connexion' => $row['date_derniere_connexion'],
            'date_creation' => $row['date_creation']
        ];
    }
    $_SESSION['current_user'] = $onePlayer;
    $db = null;
    echo json_encode($onePlayer);
}
function getPlayersByGameId($gid) {
    $db = getConn();
    $playersOfGame = [];
    $query = "SELECT";
    $query .= " p.id as id,";
    $query .= " p.pseudo as pseudo,";
    $query .= " p.level as level,";
    $query .= " p.description as description,";
    $query .= " p.is_online as is_online,";
    $query .= " p.date_derniere_connexion as date_derniere_connexion,";
    $query .= " p.date_creation as date_creation,";
    $query .= " xref.is_mj as is_mj";
    $query .= " FROM";
    $query .= " players AS p";
    $query .= " INNER JOIN jeuxplayersxref AS xref ";
    $query .= " ON p.id = xref.player_id";
    $query .= " AND xref.game_id = ?";
    $query .= " ORDER BY p.is_online ASC";
    $stmt = $db->prepare($query);
    $stmt->bindParam(1, $gid);
    $stmt->execute();
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $onePlayer = (object) [
            'id' => $row['id'],
            'pseudo' => $row['pseudo'],
            'level' => $row['level'],
            'description' => $row['description'],
            'is_online' => $row['is_online'],
            'is_mj' => $row['is_mj'],
            'date_derniere_connexion' => $row['date_derniere_connexion'],
            'date_creation' => $row['date_creation']
        ];
        array_push($playersOfGame, $onePlayer);
    }
    $db = null;
    echo json_encode($playersOfGame);
}
?>
