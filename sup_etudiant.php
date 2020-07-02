<?php 

session_start();
$nom=$_SESSION['nom'];
$prenom=$_SESSION['prenom'];
$identifiant=$_SESSION['id'];
include 'personnel.php';
include 'connexion_personnel.php';?>
 
 <!DOCTYPE html>
<html>
<style>
  h4.supp{
    padding-left: 560px;
    margin-top: 70px;
  }
  form.formul{
    padding-left: 540px;
  }
</style>
<body>

<h4 class ="supp">supprimer un etudiant</h4>

  <form class="formul" < method="post">   
  <input type="text" name="nom_etudiant" placeholder="nom">
  <br>
  <input type="text" name="prenom_etudiant" placeholder="prenom">
  <br>
  <input type="submit"  name="envoi" value="Submit">
  </form> 
<?php 
  if (isset($_POST['envoi']))
  {
    extract($_POST);

    $q=$dbb->query('SELECT Numero_etudiant FROM Etudiant WHERE nom="'.$nom_etudiant .'" AND prenom="' .$prenom_etudiant.'"') or die("Erreur suppression : " . $link->error);
    $donnee=$q->fetch();
    $Numero_etudiant=$donnee['Numero_etudiant'];
    
    $q1=$dbb->query('DELETE FROM Pret WHERE num_etudiant="'.$Numero_etudiant.'"') or die("Erreur suppression : " . $link->error);

    $req= $dbb->prepare("DELETE FROM Etudiant
    WHERE nom = :nom AND prenom = :prenom") or die("Erreur suppression : " . $link->error);
    $req->execute(['nom'=> $nom_etudiant,
    'prenom' => $prenom_etudiant]);

  }   
 
?>
</body>
</html>
