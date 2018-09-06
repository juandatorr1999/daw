<?php
	$funcion = $_GET['funcion'];
	$arreglo = $_GET['arreglo'];
	$dato = $_GET['dato'];

	function promedio($data)
	{
		$resultado=0.0;
		$arreglo = explode(',',$data);
		foreach($arreglo as $value)
		{
			$resultado += $value;
		}
		$resultado = $resultado/count($arreglo);
	}

	function mediana($data)
	{
		$arreglo = explode(',',$data);
		sort($arreglo,SORT_NUMERIC);
		if(count($arreglo))%2==1)
			$res = $arreglo[ceil(count($arreglo)/2)];
		else{
			$indice = count($arreglo)/2;
			$res = ($arreglo[$indice]+$arreglo[$indice+1])/2
		}
			return $res;


	}
	function pmo($data)//promedio media ordenado
	{
		$res=$data."<ul><li>Promedio: ".promedio($data)."</li><li>Mediana: ".mediana."</li><li>";
		$arreglo = explode(',',$data);
		sort($arreglo,SORT_NUMERIC);
		$res .= join(',',$arreglo)."</li><li>";
		rsort($arreglo,SORT_NUMERIC);
		$res .= join(',',$arreglo)."</li></ul>";
		return $res;
	}
	function cc($num)
	{
		$res="<table>";
		foreach (range(1,$num) as $n){
			$res .= "<tr><td>".pow($num,2)."</td><td>".pow($num,3)."</td>"
		}
		$res.="</table>";
		return $res;
	}

?>
