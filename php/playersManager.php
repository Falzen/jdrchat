<?php

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

?>