<?php
session_start();
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
        <link rel="stylesheet" href="css/login.css">

        <meta name="theme-color" content="#fafafa">
    </head>

    <body>

        <div id="pageContainer">
            <a id="logoutLink" href="logout.php" title="logout">yeet</a>

            <div id="pageContent">

                <section id="signin">
                  <div class="front">
                    <h1>Exister</h1>
                        <input class="login-signin-input" type="text" id="signin-inputUsername" placeholder="login" required>
                        <input class="login-signin-input" type="password" id="signin-inputPassword" placeholder="password" required>
                        <input class="login-signin-input" type="pseudo" id="signin-inputPseudo" placeholder="pseudo" required>
                        <button id="signin-btn">Exister</button>
                   
                  </div>

                  <div class="back">
                    <img class="cover" src="img/cover.png" alt="The Chatroom">
                  </div>

                    
                </section>

                <section id="login">
                  <div class="front">
                    <h1>Incarner</h1>
                        <input class="login-signin-input" value="test" type="text" id="login-inputUsername" placeholder="login" required>
                        <input class="login-signin-input" value="test" type="password" id="login-inputPassword" placeholder="password" required>
                        <input class="login-signin-input" value="test" type="password" id="login-inputPseudo" placeholder="pseudo" required>
                        <button id="login-btn">Incarner</button>
                   
                  </div>

                  <div class="back">
                    <img class="cover" src="img/cover.png" alt="The Chatroom">
                  </div>
                </section>
            </div>
        </div>


  <script src="js/vendor/modernizr-3.7.1.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script>window.jQuery || document.write('<script src="js/vendor/jquery-3.3.1.min.js"><\/script>')</script>
  <script src="js/plugins.js"></script>
  <script src="js/login.js"></script>
    </body>

    </html>