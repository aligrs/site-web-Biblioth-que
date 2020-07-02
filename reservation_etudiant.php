<?php 

session_start();
$nom=$_SESSION['nom'];
$prenom=$_SESSION['prenom'];
$numero_etudiant=$_SESSION['id'];
include 'etudiant.php';
include 'connexion_etudiant.php';?>
 
 <!DOCTYPE html>
<html>
<style>
h4.reservation{
  padding-left: 500px;
  margin-top: 50px;
}
form.formu{
  padding-left: 500px;
}

 </style>
<body>
<h4 class="reservation">RESERVATION DE LIVRES</h4>

  <form   class="formu" method="post">   
  <input type="text" name="titre" placeholder="titre">
  <br>
  <input type="text" name="cote" placeholder="cote">
  <br>
  <input type="text" name="code_barre" placeholder="code barre">
  <br>
   <input type="text" name="auteur" placeholder="auteur">
   <br>
  <input type="text" name="edition"placeholder="edition">
  <br>
  <input type="submit"  name="envoi" value="Submit">
  
</form> 
<?php 
  if (isset($_POST['envoi']))
  {
    extract($_POST);
    
     $req= $db->query('SELECT IdLivre
     FROM V_Livre_disponible
     WHERE code_barre="'. $code_barre .'" AND titre="'. $titre .'"  AND cote="'. $cote .'" AND nom_auteur="'. $auteur .'" 
     AND nom_edition="' .$edition . '" ') or die("Erreur suppression : " . $link->error);
     $donnees=$req->fetch();
     $IdLivre=$donnees['IdLivre'];
     /*echo $donnees['IdLivre'];
     $req1=$db->prepare('SELECT num_livre FROM Pret WHERE num_livre= "'.$IdLivre.'"');
     $req1->execute(array('num_livre'=>htmlspecialchars($IdLivre)));
     $result=$req1->rowCount();
     
     if($result==0)
     {*/
       $current = date("Y-m-d H:i:s");
       $unMoisPlusTard =date('Y-m-d H:i:s', strtotime("+1 month", strtotime($current)));
       $req2= $db->query(sprintf("INSERT INTO Pret VALUES (NULL,'%s','%s',%d,%d)",$current,$unMoisPlusTard,$numero_etudiant,$IdLivre));
    
     
  }   
 
?>
</body>
</html>
