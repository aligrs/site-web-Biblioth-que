<?php

session_start(); // On démarre la session AVANT toute chose



if(isset ($_POST['formsend']))
{
	extract($_POST);

	if(!empty($login) && !empty($mdp))
	{
		$q= $db->prepare("SELECT * FROM Etudiant WHERE Numero_etudiant =  :Numero_etudiant");
		
		$q->execute(['Numero_etudiant'=> $login]);
		$result=$q->fetch();
		
	
		if($result == true)
		{
			if($result['mot_de_passe']==$mdp)
			{
				echo "mot de passe correcte";
				header('location:etudiant.php');
			}
			else
			{
                echo "<script>alert(\"mot de passe incorrecte\");</script>";
			}
		}
		else
		{
			echo "le compte portant l'identifiant " . $login .  " n'existe pas";
		}
    }

	else
	{
		echo "veuillez  completer l'ensemble des champs";
	}
}

?>
