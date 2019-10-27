<?php
session_start();
require_once("config.php"); 
if(isset($_REQUEST["action"]) && !empty($_REQUEST["action"])) {
    $action = $_REQUEST["action"];
    switch($action) {
        case "tryLogin" :
        if(
            isset($_REQUEST["usernameInput"]) 
            && !empty($_REQUEST["passwordInput"])
            && isset($_REQUEST["usernameInput"])
            && !empty($_REQUEST["passwordInput"])
            && isset($_REQUEST["pseudoInput"])
            && !empty($_REQUEST["pseudoInput"])
        ){
            $usernameInput = htmlspecialchars($_REQUEST['usernameInput']);
            $passwordInput = htmlspecialchars($_REQUEST['passwordInput']);
            $pseudoInput = htmlspecialchars($_REQUEST['pseudoInput']);
            tryLogin($usernameInput, $passwordInput, $pseudoInput);
        }
        break;
        case "trySignin" :
        if(
            isset($_REQUEST["usernameInput"]) 
            && !empty($_REQUEST["usernameInput"])
            && isset($_REQUEST["passwordInput"])
            && !empty($_REQUEST["passwordInput"])
            && isset($_REQUEST["pseudoInput"])
            && !empty($_REQUEST["pseudoInput"])
        ){
            $usernameInput = htmlspecialchars($_REQUEST['usernameInput']);
            $passwordInput = htmlspecialchars($_REQUEST['passwordInput']);
            $pseudoInput = htmlspecialchars($_REQUEST['pseudoInput']);
            trySignin($usernameInput, $passwordInput, $pseudoInput);
        }
        break;
        default:
        echo "nothing happened";
        break;
    }// end switch action
}// end if isset action
function trySignin($usernameInput, $passwordInput, $pseudoInput) {
    $FAKE_DESCRIPTION = 'TODO';
    $return = (object)[
        'code' => '',
        'data' => null
    ];
    $db = getConn();
    //check si pseudo déjà pris.
    $stmtCheck = $db->prepare("SELECT id, pseudo FROM players WHERE pseudo = ?");
    $stmtCheck->execute(array($pseudoInput));
    $userCheck = null;
    $rowCheck = $stmtCheck->fetch();
    if ($rowCheck != null) {
        $userCheck = (object)[
          'id' => $rowCheck['id'],
          'pseudo' => $rowCheck['pseudo']
        ];
        $return->code = 'PSEUDO_ALREADY_TAKEN';
        $return->data = $userCheck;
        echo json_encode($return);
        die();
    }
    // INSERT 
    $passwordInputHashed = md5($passwordInput);
    $levelOne = 1;
    $stmtInsert = $db->prepare("INSERT INTO players (username, password, pseudo, description, level) VALUES (?, ?, ?, ?, ?)");
    $stmtInsert->execute(array($usernameInput, $passwordInputHashed, $pseudoInput, $FAKE_DESCRIPTION, $levelOne));

    //get the inserted user back 
    //TODO l'insert SQL peut retourner les valeurs directement ???
    $qRetreive = "SELECT id, pseudo, level, description, username, is_online, date_derniere_connexion, date_creation";
    $qRetreive .= " FROM players WHERE username = ? AND password = ?";
    $stmtRetreive = $db->prepare($qRetreive);
    $stmtRetreive->bindParam(1, $usernameInput);
    $stmtRetreive->bindParam(2, $passwordInputHashed);
    $stmtRetreive->execute();
    $user = null;
    $rowRetreive = $stmtRetreive->fetch();
    if ($rowRetreive != null) {
      $user = (object)[
          'id' => $rowRetreive['id'],
          'pseudo' => $rowRetreive['pseudo'],
          'level' => $rowRetreive['level'],
          'description' => $rowRetreive['description'],
          'username' => $rowRetreive['username'],
          'is_online' => $rowRetreive['is_online'],
          'date_derniere_connexion' => $rowRetreive['date_derniere_connexion'],
          'date_creation' => $rowRetreive['date_creation']
      ];
    }
    if ($user != null) {
        $_SESSION['current_user'] = $user;
        updateLastConnectionDateAndSetOnline();
        $return->code = 'aaight';
        $return->data = $user;
    } else {
        $return->code = 'user inserted but not retreived... yeet.';
        $return->data = null;
    }
    // get generic chatroom id
    $chatroomRetreive = $db->prepare("SELECT id FROM jeu WHERE nom = ?");
    $chatroomRetreive->execute(array('Chatroom'));
    $chatroomId = $chatroomRetreive->fetch()['id'];
    // set link to the chatroom
    $chatroomSubscriptionInsert = $db->prepare("INSERT INTO jeuxplayersxref (player_id, is_mj, game_id) VALUES (?, ?, ?)");
    $chatroomSubscriptionInsert->execute(array(
        $_SESSION['current_user']->id, 
        0, 
        $chatroomId
    ));
    $chatroomSubscriptionInsert->execute();
    $db = null;
    echo json_encode($return);
}
function tryLogin($usernameInput, $passwordInput, $pseudoInput) {
    $return = (object)[
        'code' => '',
        'data' => null
    ];
    $passwordInputHashed = md5($passwordInput);
    $db = getConn();
    $query = "SELECT id, pseudo, level, description, username, is_online, date_derniere_connexion, date_creation";
    $query .= " FROM players WHERE username = ? AND password = ? AND pseudo = ?";
    $stmt = $db->prepare($query);
    $stmt->bindParam(1, $usernameInput);
    $stmt->bindParam(2, $passwordInputHashed);
    $stmt->bindParam(3, $pseudoInput);
    $stmt->execute();
    $user = null;
    $row = $stmt->fetch();
    if ($row != null) {
      $user = (object)[
          'id' => $row['id'],
          'pseudo' => $row['pseudo'],
          'level' => $row['level'],
          'description' => $row['description'],
          'username' => $row['username'],
          'is_online' => true,
          'date_derniere_connexion' => $row['date_derniere_connexion'],
          'date_creation' => $row['date_creation']
      ];
    }
    if ($user != null) {
        $_SESSION['current_user'] = $user;
        updateLastConnectionDateAndSetOnline();
        $return->code = 'aaight';
        $return->data = $user;
    } else {
        $return->code = 'nope';
        $return->data = null;
    }
    $db = null;
    echo json_encode($return);
}
function updateLastConnectionDateAndSetOnline() {
    $db = getConn();
    $uid = $_SESSION['current_user']->id;
    date_default_timezone_set('Europe/Paris');
    $now = time();
    $mydate = date('Y-m-d H:i:s', $now);
    $updateUser = "UPDATE players SET date_derniere_connexion = ?, is_online = '1' WHERE id = ?";
    $stmt = $db->prepare($updateUser);
    $stmt->bindParam(1, $mydate);
    $stmt->bindParam(2, $uid);
    $stmt->execute();
    $db = null;
}
function setOffline() {
    $db = getConn();
    $uid = $_SESSION['current_user']->id;
    $stmt = $db->prepare("UPDATE players SET is_online = '0' WHERE id = ?");
    $stmt->execute(array($uid, 0));
    $db = null;
}
?>
