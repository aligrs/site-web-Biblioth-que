<?php

session_start(); // On démarre la session AVANT toute chose
?>
<!DOCTYPE html>
<html>
<head>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 9;
  padding-right: px;
  overflow: hidden;
  background-color: blue;
}

li {
  float: left;
}

li a {
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: red;
}
h1.mcp{
  padding-left: 440px;
}
h2.identité{
  padding-left: 490px;
}
</style>
</head>
<body>
  <header>
    <h1 class="mcp">
      MON COMPTE PERSONNEL
    </h1>
    <h2 class="identité">
       Bienvenue <?php echo $_SESSION['prenom']; ?>   <?php echo $_SESSION['nom']; ?>
    </h2>

       </header>

<nav>
<ul>
 
  <li><a href="achats.php">achats</a></li>
  <li><a href="ajouter_livres.php">+livre</a></li>
  <li><a href="suppression_livre.php">-livre</a></li>
  <li><a href="catalogue_p.php">catalogue</a></li>
  <li><a href="livres_disponibles_p.php">livres dispos</a></li>
  <li><a href="livres_en_prets_p.php">livres en prets</a></li>
  <li><a href="prix_livres.php">prix</a></li>
  <li><a href="sup_etudiant.php">-etudiant</a></li>
  <li><a href="changer_mdp_p.php">changer mot de passe</a></li>
  <li><a href="information_personnel_p.php">Info Personnels</a></li>
  <li><a href="deconnexion.php">deconnexion</a></li>

</ul>
</nav>
</body>
</html>
