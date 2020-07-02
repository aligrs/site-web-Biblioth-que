<?php

session_start(); // On démarre la session AVANT toute chose
?>
<!DOCTYPE html>
<html>
<head>
<style>

ul {
  list-style-type: none;
  margin: 5;
  padding: 0;
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
  padding: 14px 35px;
  text-decoration: none;
}

li a:hover {
  background-color: red;
}
h1 {
  padding-left:390px;
}
h3.prenom{
  margin-top: 40px;
  padding-left: 470px;
}
</style>
</head>
<body>
	<header>
		<h1>
			MON COMPTE LECTEUR
		</h1>
		<h3 class="prenom">
			Bienvenue  <?php echo $_SESSION['prenom']; ?>   <?php echo $_SESSION['nom']; ?>
		</h3>

       </header>

<nav>
<ul>
  <li><a class="active" href="#home"></a></li>
  <li><a href="pret_etudiant.php">Prets</a></li>
  <li><a href="reservation_etudiant.php">Reservations</a></li>
  <li><a href="catalogue.php">catalogue</a></li>
  <li><a href="livres_disponibles.php">Livres disponibles</a></li>
  <li><a href="information_personnel.php">Infos Personnels</a></li>
  <li><a href="change_mdp.php">changer mot de passe</a></li>
   <li><a href="deconnexion.php">deconnexion</a></li>

</ul>
</nav>
</body>
</html>
