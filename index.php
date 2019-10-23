<?php
session_start();
  if (isset( $_SESSION['current_user']) && $_SESSION['current_user'] !== null) {
      //TODO cette page devrait être une simple landing page sans contenu.
      // dans ce if, on redirige vers qqchose comme main_chat.php (actuellement cette page)
      echo 'bienvenue '. $_SESSION['current_user']->pseudo;
  } else {
      // go créer un compte noob ! YEET!!!
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

<body>
  <!--[if IE]>
    <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
  <![endif]-->
<!--

<img src="img/ambiances/fireplace_gif.webp" alt="Relaxe" />
-->
<div id="pageContainer">
  <a id="logoutLink" href="logout.php" title="logout">yeet</a>
  <div id="pageContent" class="welcome">
    <section id="menu">
      <div id="tabsContainer">
        <ul id="tabLabels">
          <li class="one-tab-label label-tab-players is-selected" data-label="players">Joueurs</li>
          <li class="one-tab-label label-tab-inventory" data-label="inventory">Inventaire</li>
          <li class="one-tab-label label-tab-notes" data-label="notes">Notes</li>
        </ul>
        <div id="tabsContent">
          <div class="one-tab-window is-selected" id="tab-players">
            <div class="tab-content">
              <ul id="participantsList">
              </ul>
            </div>
          </div>
          <div class="one-tab-window" id="tab-inventory">
            <div class="tab-content"></div>
          </div>
          <div class="one-tab-window" id="tab-notes">
            <div class="tab-content">
              <div id="noteInput" class="scroll-style-1" data-noteid="" contenteditable="true"></div>
              <!--img src="img/ambiances/fireplace_gif.webp" alt="Relaxe" /-->
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="action">
      <div id="chatContainer">
        <div id="chatContent">
          <ul id="chatMessages" class="scroll-style-1" style="background-image:url(img/ambiances/fireplace_gif.webp);">
          </ul>
          <div id="chatActions">
            <input type="text" id="chatInput" />
            <button id="chatSend">&nbsp;</button>
          </div>

          <div id="rolls-container">

            <div class="one-roll-container" data-val="4" id="d4">
              <span class="dice-name">/ 4</span>
              <p><label id="d4Label">&nbsp;&nbsp;</label><br/></p>
            </div>
            <br/>

            <div class="one-roll-container" data-val="6" id="d6">
              <span class="dice-name">/ 6</span>
              <p><label id="d6Label">&nbsp;&nbsp;</label><br/></p>
            </div>
            <br/>

            <div class="one-roll-container" data-val="12" id="d12">
              <span class="dice-name">/ 12</span>
              <p><label id="d12Label">&nbsp;&nbsp;</label><br/></p>
            </div>
            <br/>

            <div class="one-roll-container" data-val="20" id="d20">
              <span class="dice-name">/ 20</span>
              <p><label id="d20Label">&nbsp;&nbsp;</label><br/></p>
            </div>
            <br/>

            <div class="one-roll-container" data-val="100" id="d100">
              <span class="dice-name">/ 100</span>
              <p><label id="d100Label">&nbsp;&nbsp;</label><br/></p>
            </div>
            <br/>

          </div><!-- end #rolls-container -->
        </div>
      </div>

    </section>



  </div>
</div>


  <script src="js/vendor/modernizr-3.7.1.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script>window.jQuery || document.write('<script src="js/vendor/jquery-3.3.1.min.js"><\/script>')</script>
  <script src="js/plugins.js"></script>
  <script src="js/main.js"></script>


</body>

</html>
