
<?php


if(isset ($_POST['formsend']))
{
	extract($_POST);

	if(!empty($login) && !empty($mdp))
	{
		$q1= $dbb->prepare("SELECT * FROM Personnel WHERE IdPersonnel =  :IdPersonnel");
		
		$q1->execute(['IdPersonnel'=> $login]);
		$res=$q1->fetch();
		var_dump($res);
	
		if($res== true)
		{
			if($res['mot_de_passe']==$mdp)
			{
				echo "mot de passe correcte";
				header('location:personnel.php');
			}
			else
			{
                echo "mot de passe incorrecte";
			}
		}
		else
		{
			echo "le compte portant l'identifiant". $login . "n'existe pas";
		}
    }

	else
	{
		echo "veuillez  completer l'ensemble des champs";
	}
}

?>
