<?php
	$funcion = $_GET['funcion'];
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
		return $resultado;
	}

	function mediana($data)
	{
		$arreglo = explode(',',$data);
		sort($arreglo,SORT_NUMERIC);
		if(count($arreglo)%2==1)
			$res = $arreglo[ceil(count($arreglo)/2-1)];
		else{
			$indice = count($arreglo)/2;
			$res = ($arreglo[$indice]+$arreglo[$indice+1])/2;
		}
			return $res;
	} 

	function pmo($data)//promedio media ordenado
	{
		$res=$data."<ul><li>Promedio: ".promedio($data)."</li><li>Mediana: ".mediana($data)."</li><li>";
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
			$res .= "<tr><td>".pow($n,2)."</td><td>".pow($n,3)."</td>";
		}
		$res.="</table>";
		return $res;
	}

	function fibo($num)
	{
		if($num==1 || $num==0)
			return 1;
		return fibo($num-1)+fibo($num-2);
	}
	if($_GET['funcion']==="promedio")
		echo promedio($_GET['dato']);	
	if($_GET['funcion']==="mediana")
		echo mediana($_GET['dato']);	
	if($_GET['funcion']==="pmo")
		echo pmo($_GET['dato']);	
	if($_GET['funcion']==="cc")
		echo cc($_GET['dato']);	
	if($_GET['funcion']==="fibo")
		echo fibo($_GET['dato']);

?>
