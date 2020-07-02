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
h4.prix{
  padding-left: 570px;
}

</style>
</head>
<body>

<h4 class="prix">PRIX PAR DISCIPLINE</h4>

<table>
  <tr>
    <th>discipline</th>
    <th>prix (euro)</th>
    
  </tr>

<?php include 'connexion_personnel.php';

$req= $dbb->query('SELECT  Livre.discipline,SUM(Livre.prix) AS prix
FROM Livre
GROUP BY Livre.discipline') or die("Erreur suppression : " . $link->error);


while ($donnees = $req->fetch())

{?>
  <tr>

       <td> <?php echo $donnees['discipline']; ?> </td>

       <td> <?php echo $donnees['prix']; ?> </td>

       
      
   </tr>
<?php } ?>
</table>
</body>
</html>




