<?php
include("autoloader.php");
$pattern=strtolower($_GET['pattern']);
$words=array();
$res=Conex::_query("SELECT nombre FROM tech");
foreach($res as $sub)
{
	$words[]=$sub['nombre'];
}

$response="";
$size=0;
for($i=0; $i<count($words); $i++)
{
   $pos=stripos(strtolower($words[$i]),$pattern);
   if(!($pos===false))
   {
     $size++;
     $word=$words[$i];
     $response.="<option value=\"$word\">$word</option>";
   }
}
if($size>0)
  echo "<select id=\"list\" size=$size>$response</select>";
?>
