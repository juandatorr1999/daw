<?php
error_reporting(0);
  if (isset($_POST["usuario"])) {
        $usuario =  htmlspecialchars($_POST["usuario"]);
    }
    
    if (isset($_POST["password1"])) {
        $pass1 =  htmlspecialchars($_POST["password1"]);
    }
    if (isset($_POST["password2"])) {
        $pass2 =  htmlspecialchars($_POST["password2"]);
    }
     if (isset($_POST["mail"])) {
        $mail =  htmlspecialchars($_POST["mail"]);
    }
 
    if(isset($mail)&&isset($pass2)&&isset($pass1)&&isset($usuario))
    {
    	if ($usuario!=""&&$pass2 == $pass1&& filter_var($mail,FILTER_VALIDATE_EMAIL)) {
        	include("_exito.html");
   	 } else if ($pass1!=$pass2)
    	{
	    $error="Las contraseñas no son iguales";
             include("_register.html");
    	}    
   	 else if(!filter_var($mail, FILTER_VALIDATE_EMAIL)){
		    $error="Mail no válido";
             	include("_register.html");
	 }
	 else if($usuario==""){
		 $error="Falto poner usuario";
             	include("_register.html");
	 }
	 else if($mail==""){
		 $error="Falto poner email";
             	include("_register.html");
	 }
	 else if($pass1==""){
		 $error="La contraseña no puede ser nula";
             	include("_register.html");
	 }
	 }
    else
    {
             include("_register.html");
    }

?>
