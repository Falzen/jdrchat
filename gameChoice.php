<?php
  session_start();
  if (!isset( $_SESSION['current_user']) && $_SESSION['current_user'] == null) {
    header("Location: login.php");
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
<body id="logout-page">
  <!--[if IE]>
    <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
  <![endif]-->
<!--
<img src="img/ambiances/fireplace_gif.webp" alt="Relaxe" />
-->
<div id="currentUserJson" class="very-hidden">
  <?php
    if (isset( $_SESSION['current_user']) && $_SESSION['current_user'] !== null) {
      echo json_encode($_SESSION['current_user']);
    }
  ?>
</div>
<div id="overlay" class="is-hiding"></div>
<div id="gameChoicePopup" class="popup is-showing">
  <div class="popup-content">
    <ul id="gamesList">
      
    </ul>
  </div>
</div>
<div id="pageContainer">
  <a id="logoutLink" href="logout.php" title="logout">yeet</a>
  <div id="pageContent" class="welcome">
    <div id="mainContainer">
      <div id="mainContent">
      </div>
    </div>
  </div>
</div>
  <script src="js/vendor/modernizr-3.7.1.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script>window.jQuery || document.write('<script src="js/vendor/jquery-3.3.1.min.js"><\/script>')</script>
  <script src="js/plugins.js"></script>
  <script src="js/gameChoice.js"></script>
</body>
</html>
