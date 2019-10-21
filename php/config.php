<?php
	function getConn() {
		try {
			$db = new PDO('mysql:host=localhost;dbname=jdr;charset=utf8', 'root', '');
			//$db = new PDO('mysql:host=db762956775.hosting-data.io;dbname=db762956775;charset=utf8', 'dbo762956775', 'epingler1Pingouin!');			$db->setAttribute(PDO::ATTR_CASE, PDO::CASE_LOWER); // always lower case.
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