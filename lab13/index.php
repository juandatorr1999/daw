<?php
session_start();

if(isset($_POST['email']) && isset($_POST['pass']))
{
	if(strtolower($_POST['email'])=="a01209675@itesm.mx" && $_POST['pass']=="nomegustaphp")
	{
		$_SESSION['user']="Etan Imanol Castro Aldrete";
		header("Location: index.php");
	}
	else
	{
		$error="Datos incorrectos A01209675@itesm.mx pass:nomegustaphp";
		include("_login.html");
	}

}
else
{
	if(!isset($_SESSION['user']))
	{
		include("_login.html");
	}
	else
	{
		if(isset($_FILES['file']['name']))
		{
			$dir_subida = 'imgs/';
			$fichero_subido = $dir_subida . basename($_FILES['file']['name']);
			if(move_uploaded_file($_FILES['file']['tmp_name'], $fichero_subido))
			header("Location: index.php");
		}
		else
		{
		$imagenes = glob("imgs/*.*");
		include("_dash.html");
		}
		
	}
}


?>
