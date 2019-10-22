<?php
session_start();
//session_destroy();
require_once("php/config.php"); 

  if (isset($_SESSION['current_user'])) {
  	echo 'You is already logged in, bitch ! YEET the fuck out !';
  } else {
  }





?>
<!doctype html>
<html class="no-js" lang="">

<head>
  <meta charset="utf-8">
  <title></title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="manifest" href="site.webmanifest">
  <link rel="apple-touch-icon" href="icon.png">
  <!-- Place favicon.ico in the root directory -->
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/main.css">

  <meta name="theme-color" content="#fafafa">
</head>

<body id="login-page">
  <!--[if IE]>
    <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
  <![endif]-->
<!--

<img src="img/ambiances/fireplace_gif.webp" alt="Relaxe" />
-->
<div id="pageContainer">
  <div id="pageContent">

	<form action="" method="post">
	    <input type="text" name="username" placeholder="login" required>
	    <input type="password" name="password" placeholder="password" required>
	    <input type="submit" value="Exister">
	</form>
<?php
if (!empty($_POST)) {
    if (isset($_POST['username']) && isset($_POST['password'])) {

    	$passwordInputHashed = md5($_POST['password']);
    	$db = getConn();
        $query = "SELECT * FROM players WHERE username = ? AND password = ?";
     	$stmt = $db->prepare($query);
        $stmt->bindParam(1, $_POST['username']);
        $stmt->bindParam(2, $passwordInputHashed);
        $stmt->execute();
        $user = null;
    	$row = $stmt->fetch();
    	if($row != null) {
	        $user = (object) [
	            'id' => $row['id'],
	            'pseudo' => $row['pseudo'],
	            'level' => $row['level'],
	            'description' => $row['description'],
	            'username' => $row['username'],
	            'is_online' => $row['is_online'],
	            'date_derniere_connexion' => $row['date_derniere_connexion'],
	            'date_creation' => $row['date_creation']
	        ];
	    }
    	if($user != null) {
    		$_SESSION['current_user'] = $user;
			date_default_timezone_set('Europe/Paris');
		    $now = time();
			$mydate = date('Y-m-d H:i:s', $now);

			//$mydate = date('Y-m-d H:i:s', $ts);
	        $updateUser = "UPDATE players SET date_derniere_connexion = ? WHERE id = ?";
     		$stmt = $db->prepare($updateUser);

	        $stmt->bindParam(1, $mydate);
	        $stmt->bindParam(2, $_SESSION['current_user']->id);
     		$stmt->execute();
    		$db = null;
			header("Location: index.php");
    	}
    	else {
    		echo '<p class="login-yeet">yeet</p>';
    	}
    }
}
?>


  </div>
</div>


  <script src="js/vendor/modernizr-3.7.1.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script>window.jQuery || document.write('<script src="js/vendor/jquery-3.3.1.min.js"><\/script>')</script>
  <script src="js/plugins.js"></script>
  <script src="js/login.js"></script>


</body>

</html>
