<?php
include("Conex.php");

function estadisticas()
{
    echo "Zombies registrados: ".Conex::_query("SELECT COUNT(*) FROM zombies")[0][0];
    $zombiesEstado = Conex::_query("SELECT estados.nombre,COUNT(*) FROM zombies,estados WHERE estados.idEstado=zombies.idEstado GROUP BY estados.nombre");
    $res = "<table border=1>";
    foreach ($zombiesEstado as $cat)
    {
          $res .= "<tr><td>".$cat["nombre"]."</td><td>".$cat[1]."</td></tr>";
    }
    $res.="</table>";
    echo $res;
    echo "Zombies registrados no muertos: ". Conex::_query("SELECT COUNT(*) FROM zombies WHERE zombies.idEstado!=4")[0][0];
}
function listZom()
{
    $zombiesEstado = Conex::_query("SELECT zombies.idZombie, fecha,zombies.nombre, estados.nombre FROM zombies,estados WHERE estados.idEstado=zombies.idEstado ORDER BY fecha ASC");
    $res = "<table border=1>";
    foreach ($zombiesEstado as $cat)
    {
          $res .= "<tr><td>".$cat[2]."</td><td>".$cat[1]."</td><td>".$cat["nombre"]."</td><td>".$cat[0]."</td><td><a href='index.php?action=editar&id=".$cat[0]."'>Editar</a>
<a href='index.php?action=elimina&id=".$cat[0]."'>Eliminar</a>
</td></tr>";
    }
    $res.="</table>";
    echo $res;
}

function select()
{
    $zombiesEstado = Conex::_query("SELECT * FROM estados");
    $res = "";
    foreach ($zombiesEstado as $cat)
    {
          $res .= "<option value='".$cat['idEstado']."'>".$cat['nombre']."</option>";
    }
    return $res;
}

function filtraZombies($idEstado)
{
  $zombiesEstado = Conex::_query("SELECT zombies.idZombie, fecha,zombies.nombre, estados.nombre FROM zombies,estados WHERE estados.idEstado=zombies.idEstado AND zombies.idEstado=:estado  ORDER BY fecha ASC",array(":estado"=>intval($idEstado)));
    $res = "<table border=1>";
    foreach ($zombiesEstado as $cat)
    {
          $res .= "<tr><td>".$cat[2]."</td><td>".$cat[1]."</td><td>".$cat["nombre"]."</td><td>".$cat[0]."</td><td><a href='index.php?action=editar&id=".$cat[0]."'>Editar</a>
<a href='index.php?action=elimina&id=".$cat[0]."'>Eliminar</a>
</td></tr>";
    }
    $res.="</table>";
    echo "<h1>Se encontraron</h1>".Conex::_query("SELECT FOUND_ROWS()")[0][0];
    echo $res;  
}

function getZombie($idZom)
{
    $zombie = Conex::_query("SELECT * FROM zombies WHERE idZombie=:idZombie",array(":idZombie"=>intval($idZom)));
    $form = "<form method='POST' action='index.php?action=update&id=".$zombie[0][0]."'> 
            <input name='nombre' value=".$zombie[0]['nombre'].">
            <select name='idEstado'>".select().
            "</select><input type=submit>";
    echo $form;
}
function editaZombie($idZom,$idEstado,$nombre)
{
 Conex::_query("UPDATE zombies SET idEstado=:idEstado, nombre=:nombre WHERE idZombie=:idZombie ",array(":idEstado"=>intval($idEstado),":nombre"=>$nombre,":idZombie"=>intval($idZom)));
}
function elimina($idZom)
{
 Conex::_query("DELETE FROM zombies  WHERE idZombie=:idZombie ",array(":idZombie"=>intval($idZom)));
}
 //estadisticas()
  //listZom()
 // select();
 //filtraZombies(2);
//editaZombie(1,1,"Juana");
//getZombie(1);
?>