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

        case "getAvailableGames" :
    	$currentPlayerId = 1; //TODO getfrom SESSION
        getGamesByPlayerId($currentPlayerId);
        break;

        default:
        echo "nothing happened";
        break;

    }// end switch action
}// end if isset action


function getGamesByPlayerId($pid) {
    $db = getConn();
    $allGames = [];
    
    $query = "SELECT id, nom, description, regles FROM jeu WHERE id IN (SELECT game_id FROM jeuxplayersxref WHERE player_id = ?)";
    $stmt = $db->prepare($query);
    $stmt->bindParam(1, $pid);
    $stmt->execute();

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $oneGame = (object) [
            'id' => $row['id'],
            'nom' => $row['nom'],
            'regles' => $row['regles'],
            'description' => $row['description']
        ];
        array_push($allGames, $oneGame);
    }

    $db = null;
    echo json_encode($allGames);
}

?>