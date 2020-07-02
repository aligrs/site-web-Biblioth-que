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

<h4 class ="supp">suppression livre</h4>

  <form class="formul" < method="post">   
  <input type="text" name="titre" placeholder="titre">
  <br>
   <input type="text" name="code_barre" placeholder="code barre">
  <br>
  <input type="text" name="auteur" placeholder="auteur">
  <br>
   <input type="text" name="edition" placeholder="edition">
  <br>
  <input type="submit"  name="envoi" value="Submit">
  </form> 
<?php 
  if (isset($_POST['envoi']))
  {
    extract($_POST);

    $q=$dbb->query('SELECT IdAuteur FROM Auteur WHERE nom="'.$auteur .'"') or die("Erreur suppression : " . $link->error);
    $donnee=$q->fetch();
    $id_auteur=$donnee['IdAuteur'];
    
    $q1=$dbb->query('SELECT IdEdition FROM Edition WHERE nom_edition="'.$edition .'"') or die("Erreur suppression : " . $link->error);
    $d=$q1->fetch();
    $id_edition=$d['IdEdition'];
    echo $id_edition;
    


    $q2=$dbb->query('SELECT IdLivre FROM Livre WHERE num_auteur="'.$id_auteur .'" AND num_edition="'.$id_edition.'" AND code_barre="'.$code_barre.'"') or die("Erreur suppression : " . $link->error);
    $base=$q2->fetch();
    $idlivre=$base['IdLivre'];
 
    
    $q3=$dbb->query('DELETE FROM Pret WHERE num_livre="'.$idlivre.'"') or die("Erreur suppression : " . $link->error);
    $q4=$dbb->query('DELETE FROM Livre WHERE IdLivre="'.$idlivre.'"') or die("Erreur suppression : " . $link->error);

    

  }   
 
?>
</body>
</html>
