<?php 

session_start();
$nom=$_SESSION['nom'];
$prenom=$_SESSION['prenom'];
$identifiant=$_SESSION['id'];
include 'etudiant.php';
include 'connexion_etudiant.php';?>
 
 <!DOCTYPE html>
<html>
<style>
  h4.supp{
    padding-left: 530px;
    margin-top: 70px;
  }
  form.formul{
    padding-left: 540px;
  }
</style>
<body>

<h4 class ="supp">changement de mot de passe</h4>

  <form class="formul" < method="post">   
  <input type="password" name="a_mdp" placeholder="ancien mot de passe">
  <br>
   <input type="password" name="n_mdp" placeholder="nouveau mot de passe">
  <br>
   <input type="password" name="cn_mdp" placeholder="confirmation nouveau mot de passe">
  <br>
 <input type="submit"  name="envoi" value="Submit">
  </form> 
<?php 
  if (isset($_POST['envoi']))
  {
    extract($_POST);
    $q1=$db->query('SELECT mot_de_passe FROM Etudiant WHERE mot_de_passe="'.$a_mdp.'"') or die("Erreur suppression : " . $link->error);
   $d=$q1->fetch();
   
   if($d==true)
   {
    if($n_mdp==$cn_mdp)
    {
    $q2=$db->query('UPDATE Etudiant SET mot_de_passe="'.$n_mdp.'" WHERE nom="'.$nom .'" AND prenom="'.$prenom.'"');
    }

    else
    {
      echo "vous n avez pas bien confirmer le nouveau mot de passe";
    }
   }
   else{
    echo "mot de passe incorrecte";
   }
   
    

  }   
 
?>
</body>
</html>
