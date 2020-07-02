<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="connexion.css" type="text/css" > 
    <title>
      Connexion
    </title>
    <style type="text/css">
      .form_conex
      {
        font-size: 40px;
        color: white;
      }
      .form_conex
      {
        margin: 1% 30% 10% 30%; 
        padding: 5% 0 5% 0; 
        background-color: #002E6C; 
        text-align: center;
        border-style: solid; 
        border-width: 3px; 
        border-color: red;
        border-radius: 50px 25px 50px 12px;
      }

body
{
  color:vert;
  background-color:#EFFBF2;
}
#input
{
  padding: 5px;
  border-radius: 5px;
}
#sub
{
  background: red;
  width: 150px;
  padding: 5px;
  border-radius: 5px;
  font-size: 25px;
  color: white;
  font-weight: bold;
  margin: auto;
}
#sub:hover
{
  cursor: pointer;
  text-transform: uppercase;
}
    </style>
  </head>
<body>



<form < method="post"> 
  <p class="form_conex">Inscription<br>
  <input type="text" name="numero_etudiant" placeholder="votre  identifiant"  id="input">
  <br>
  <input type="text" name="nom" placeholder="votre nom" id="input">
  <br>
  <input type="text" name="prenom" placeholder="votre prenom" id="input">
  <br>
  <input type="date" name="date_de_naissance" placeholder="votre date de naissance" id="input">
  <br>
  <input type="password" name="mot_de_passe"placeholder="votre mot de passe" id="input">
  <br>

  <input type="password" name="cmot_de_passe"placeholder="votre mot de passe" id="input">
  <br>

  <input type="submit"  name ="valide" value="Submit" id="sub">
  
</form> 

<?php 
 if (isset($_POST['valide']))
  {
   extract($_POST);

   if(!empty($numero_etudiant)  && !empty($nom) && !empty($prenom) && !empty($date_de_naissance) && !empty($mot_de_passe) && !empty($cmot_de_passe))
   {
    if($mot_de_passe ==$cmot_de_passe)
    {
      include  'connexion_etudiant.php';
      global $db;
      $q= $db->prepare("INSERT INTO Etudiant(Numero_etudiant,nom,prenom,date_naissance,mot_de_passe) VALUES(:Numero_etudiant,:nom,:prenom,:date_naissance,:mot_de_passe) ");
      $q->execute ([
           'Numero_etudiant'=>$numero_etudiant,
           'nom'=>$nom,
           'prenom'=>$prenom,
           'date_naissance'=>$date_de_naissance,
           'mot_de_passe'=>$mot_de_passe]);
      session_start(); // On dé
      header('location:index.php');
      }
      else
      {
        echo "veuillez confirmer le mot de passe";
      }

    }


   
   
   else
   {
    echo "les champs ne sont pas tous remplies";
   }
 }

  
?>



</body>
</html>
