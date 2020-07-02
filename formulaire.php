<?php

session_start(); // On démarre la session AVANT toute chose

?>
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
        padding: 7% 0 5% 0; 
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
  /*padding: 5px;
  border-radius: 5px;*/
}
#formsend
{
  background: red;
  width: 150px;
  padding: 3px;
  border-radius: 5px;
  font-size: 25px;
  color: white;
  font-weight: bold;
  margin: auto;
}
#formsend:hover
{
  cursor: pointer;
  text-transform: uppercase;
}
    </style>
  </head>
   <body>      
       <?php include 'connexion_etudiant.php'; 
       global $db ?>


        <!-- Formulaire pour se connecter -->
		<form  < method="post"> 	
			<p class="form_conex">Connexion <br>
			<input type="text" name="login" placeholder="votre identifiant" id="input " required><br />
			<input type="password" name="mdp" placeholder="Password"  id="input" required><br />
			<input type="submit" name="formsend" id="formsend"></p>
		</form>
		<?php include 'send.php'; 
		$_SESSION['id']=$result['Numero_etudiant'];
		$_SESSION['nom']=$result['nom'];
		$_SESSION['prenom']=$result['prenom'];
		$_SESSION['date_naissance']=$result['date_naissance'];?>

		        
		 
     
		
		
	</body> 

</html>
