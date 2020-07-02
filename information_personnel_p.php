<?php

session_start(); // On démarre la session AVANT toute chose
$nom=$_SESSION['nom'];
$prenom=$_SESSION['prenom'];
$numero_etudiant=$_SESSION['id'];
$date_naissance=$_SESSION['date_naissance'];
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

h4.info_p{
  padding-left: 530px
}
</style>
</head>
<body>

<h4 class="info_p">INFORMATIONS PERSONNELS</h4>

<table>
  <tr>
    <th>Numero Etudiant</th>
    <th>Nom</th>
    <th>Prenom</th>
    <th>date de naissance</th>
    
  </tr>

<?php include 'connexion_personnel.php';?>

      <td> <?php echo $numero_etudiant; ?> </td>
       
       <td> <?php echo $nom; ?> </td>

       <td> <?php echo $prenom; ?> </td>

       <td> <?php echo $date_naissance; ?> </td>

       
   </tr>

</table>
</body>
</html>
