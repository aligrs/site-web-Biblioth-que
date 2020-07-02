<?php

session_start();
// On démarre la session AVANT toute chose
$identifiant=$_SESSION['id'];
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
h4.catalogue{
  padding-left: 600px;
  margin-top: 30px;
}


</style>
</head>
<body>

<h4 class="catalogue" >CATALOGUE</h4>

<table>
  <tr>
    <th>titre</th>
    <th>cote</th>
    <th>Code barre</th>
    <th>auteur</th>
    <th>edition</th>
    <th>discipline</th>
    

  </tr>

<?php include 'connexion_personnel.php';-
$req= $dbb->query('SELECT Livre.titre,Livre.cote,Livre.code_barre,Auteur.nom,Edition.nom_edition,Livre.discipline
  FROM Livre,Auteur,Edition
  WHERE Livre.num_auteur=Auteur.IdAuteur AND Livre.num_edition=Edition.IdEdition') or die("Erreur suppression : " . $link->error);
  while ($donnees = $req->fetch())

{?>
  <tr>

       <td> <?php echo $donnees['titre']; ?> </td>

       <td> <?php echo $donnees['cote']; ?> </td>

       <td> <?php echo $donnees['code_barre']; ?> </td>

       <td> <?php echo $donnees['nom']; ?> </td>

       <td> <?php echo $donnees['nom_edition']; ?> </td>

       
       <td> <?php echo $donnees['discipline']; ?> </td>

      
   </tr>
<?php } ?>
</table>
</body>
</html>