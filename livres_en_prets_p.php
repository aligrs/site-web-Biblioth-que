<?php

session_start(); // On démarre la session AVANT toute chose
$nom=$_SESSION['nom'];
$prenom=$_SESSION['prenom'];
include 'personnel.php';?>
<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 50px;
}
h4.livres_prets{
  padding-left: 580px;
  margin-top: 25px;
}

</style>
</head>
<body>

<h4 class="livres_prets">LIVRES EN PRETS</h4>

<table>
  <tr>
    <th>titre</th>
    <th>cote</th>
    <th>Code barre</th>
    <th>auteur</th>
    <th>edition</th>
    <th>discipline</th>
  </tr>

<?php include 'connexion_personnel.php';

$req= $dbb->query('SELECT *
	FROM V_Livre_en_pret') or die("Erreur suppression : " . $link->error);

while ($donnees = $req->fetch())

{?>
  <tr>

       <td> <?php echo $donnees['titre']; ?> </td>

       <td> <?php echo $donnees['cote']; ?> </td>

       <td> <?php echo $donnees['code_barre']; ?> </td>

       <td> <?php echo $donnees['nom_auteur']; ?> </td>

       <td> <?php echo $donnees['nom_edition']; ?> </td>

       
       <td> <?php echo $donnees['discipline']; ?> </td>

      
   </tr>
<?php } ?>
</table>
</body>
</html>




