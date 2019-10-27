<?php
session_start();
if(isset($_REQUEST["action"]) && !empty($_REQUEST["action"])) {
    $action = $_REQUEST["action"];
    switch($action) {
        case "get" :
	        if(isset($_REQUEST["key"])) {
	            getSessionVariable($_REQUEST["key"]);
	        }
        break;
        case "set" :
	        if(isset($_REQUEST["key"]) && isset($_REQUEST["value"])) {
	            setSessionVariable($_REQUEST["key"], $_REQUEST["value"]);
	        }
        break;
    }
}
function setSessionVariable($k, $v) {
	$_SESSION[$k] = $v;
	echo true;
}
function getSessionVariable($k) {
	echo $_SESSION[$k];
}
?>
