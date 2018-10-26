<?php
include("Utils.php");
$accion = $_GET['action'];

echo "<ul>
  <li><a href='index.php'>Home</a></li>
  <li><a href='index.php?action=listaFiltrado'>Lista por filtro de estado</a></li>
  <li><a href='index.php?action=lista'>Listado general</a></li>
</ul>";


    if(!isset( $_GET['action']) || $accion=="index")
    {
        echo "<h1>Estadisticas</h1>";
        estadisticas();
    }
    if(isset( $_GET['action']))
    {
         if($accion=="lista")
        {
            listZom();
        }
         if($accion=="listaFiltrado")
        {
            echo "<form method=POST action='index.php?action=listaFiltrado'>
                 <select name='idEstado'>".
                 select().
                 "</select>
                 <input type='submit'>
            ";
            if(isset($_POST["idEstado"]))
                echo filtraZombies($_POST["idEstado"]);
        }
    }
    if($accion=="editar" && $_GET["id"])
    {
        getZombie($_GET["id"]);
    }
      if($accion=="elimina" && $_GET["id"])
    {
        elimina($_GET["id"]);
        header("Location: index.php?action=lista");
    }
    
    if($accion=="update" && isset($_GET["id"]) && isset($_POST["nombre"]) && isset($_POST["idEstado"]))
    {
        editaZombie($_GET["id"],$_POST["idEstado"],$_POST["nombre"]);
        header("Location: index.php?action=editar&id=".$_GET["id"]);
    }
?>