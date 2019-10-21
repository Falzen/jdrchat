<?php
	function getConn() {
		try {
			//$db = new PDO('mysql:host=localhost;dbname=jdr;charset=utf8', 'root', '');
			$db = new PDO('mysql:host=db5000202677.hosting-data.io;dbname=dbs197639;charset=utf8', 'dbu158846', 'Printf!2501');
			$db->setAttribute(PDO::ATTR_CASE, PDO::CASE_LOWER); // always lower case.
			$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // errors will trigger exceptions.
			$db->exec('SET NAMES utf8');
			return $db;
		}
		catch(Exception $e){
			echo 'Une erreur est survenue.';
			die('Erreur : ' . $e->getMessage());
		}
	}
?>