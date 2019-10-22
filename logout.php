<?php
  session_start();
  //session_destroy();
  if (isset($_SESSION['current_user'])) {
    session_destroy();
    echo '<p>Yeet.</p>';
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

<body id="logout-page">
  <!--[if IE]>
    <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
  <![endif]-->
<!--

<img src="img/ambiances/fireplace_gif.webp" alt="Relaxe" />
-->
<div id="pageContainer">
  <div id="pageContent">
    <a href="login.php" title="" style="display: block;margin-top: 40vh;margin-left: 50vw;">
      <img src="img/ambiances/fireplace_gif.webp" alt="Relaxe" />
    </a>
  </div>
</div>

</body>

</html>
