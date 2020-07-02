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
 h4.ajout_livre{
  padding-left: 600px;
 }
 form.formul{
  padding-left: 560px;
 }
</style>
<body>

<h4 class="ajout_livre">AJOUT LIVRE</h4>

  <form   class="formul" method="post">   
  <input type="text" name="titre" placeholder="titre">
  <br>
  <input type="text" name="cote" placeholder="cote">
  <br>
  <input type="text" name="code_barre" placeholder="code barre">
  <br>
   <input type="text" name=" nom_auteur" placeholder="nom de  auteur">
   <br>
   <input type="text" name=" prenom_auteur" placeholder="prenom de auteur">
   <br>
   <input type="text" name=" date_auteur" placeholder="date de naissance de auteur">
   <br>
  <input type="text" name="edition"placeholder="edition">
  <br>
  <input type="text" name=" discipline" placeholder="discipline">
   <br>
  <input type="text" name="prix"placeholder="prix">
  <br>

  <input type="submit"  name="envoi" value="Submit">
  
</form> 
<?php 
  if (isset($_POST['envoi']))
  {
    extract($_POST);
   if(!empty($titre) && !empty($code_barre) && !empty($cote) && !empty($nom_auteur) && !empty($edition) && ($prenom_auteur) && !empty($date_auteur) && !empty($discipline) && !empty($prix))
   {
   $verif= $dbb->query('SELECT titre
  FROM Livre
  WHERE code_barre="'.$code_barre. '" ') or die("Erreur suppression : " . $link->error);
   $res=$verif->fetch();
   if(!$res)
   {
     $q= $dbb->prepare("INSERT INTO Auteur(IdAuteur,nom,prenom,date_naissance)  VALUES(NULL,:nom,:prenom,:date_naissance) ") or 
     die("Erreur suppression : " . $link->error);
     $q->execute ([
           'nom'=>$nom_auteur,
           'prenom'=>$prenom_auteur,
           'date_naissance'=>$date_auteur
      ]);
      


$q1= $dbb->prepare("INSERT INTO Edition(IdEdition,nom_edition)   VALUES(NULL,:nom_edition) ") or die("Erreur suppression : " . $link->error);

      $q1->execute ([
           'nom_edition'=>$edition
           
      ]);

  $q2= $dbb->query('SELECT IdAuteur
  FROM Auteur
  WHERE nom="'.$nom_auteur . '" ') or die("Erreur suppression : " . $link->error);
  $result=$q2->fetch();
  $IdAuteur=$result['IdAuteur'];
  
  $q3= $dbb->query('SELECT IdEdition
  FROM Edition
  WHERE nom_edition="'.$edition . '" ') or die("Erreur suppression : " . $link->error);
  $result=$q3->fetch();
  $IdEdition=$result['IdEdition'];
  
  echo $IdEdition;
  echo $IdAuteur;

  $q= $dbb->prepare("INSERT INTO Livre(IdLivre,titre,cote,code_barre,num_personnel,num_auteur,num_edition,discipline,prix) VALUES(NULL,:titre,:cote,:code_barre,:num_personnel,:num_auteur,:num_edition,:discipline,:prix) ")or die("Erreur suppression : " . $link->error);
     echo "SALAM";
      $q->execute ([
           'titre'=>$titre,
           'cote'=>$cote,
           'code_barre'=>$code_barre,
           'num_personnel'=>$identifiant,
           'num_auteur'=>$IdAuteur,
           'num_edition'=>$IdEdition,
           'discipline' =>$discipline,
           'prix' =>$prix

      ]);
  }

  else
  {
    echo "ce code barre figure deja dans le catalogue";
  }

  }

  else
  {
    echo "veuillez completez tout les champs";
  }
}
?>
</body>
</html>
