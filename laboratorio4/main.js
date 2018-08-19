var resultado =  document.getElementById("resultado");

let tabla = function (){
	let input = Number(prompt("Coloque el número"));
	var result = "";
	for(input;input;input--)
		result=result+"<tr><td>"+input+"</td>"+
			"<td>"+input**2+"</td>"+
			"<td>"+input**3+"</td></tr>";
	resultado.innerHTML = "<table>"+result+"</table>";
};

let guess = function(){
	let startT = Date.now();
	let input = Number(prompt("Adivine cuanto da la suma"));
	let sum = (Math.random()*10 + Math.random()*10)|0;
	if(sum==input)
		resultado.innerHTML = "Has acertado en ";
	else
		resultado.innerHTML = "No acertaste, la suma es " + sum + " en ";
	resultado.innerHTML = resultado.innerHTML + ((Date.now()-startT)/1000)+"s";
};

let generarArray = function (){
	let input = Math.abs(Number(document.getElementById("arraysize").value));
	var result = "<button onclick='analizararray("+input+")'>Analizar</button>";
	for(input;input;input--)
		result = "<input type=number id='array"+input+"'>"+result;
	resultado.innerHTML = result +"<div id='subresultado'></div>";

}

let analizararray = function(input){
	let neg = pos = zer = 0;
	for(input;input;input--){
		let val = document.getElementById("array"+input);
		if(val==0)
			zer = zer + 1;
		if(val>0)
			pos = pos + 1;
		else
			neg = neg + 1;
	}
	document.getElementById("subresultado").innerHTML = "Ceros: " + zer + " Positivos: " + pos +" Negativos: " + neg;

}

let matrix = function (){
	let M = Number(document.getElementById("columnas").value);
	let N = Number(document.getElementById("filas").value);
	var result = "";
	let i=0;
	for(i;i<N;i++){
		let j = 0;
		for(j;j<M;j++){
			result=result+"<input type='number' id='matriz"+i+"-"+j+"'>";}
		result = result+"<br>";}
	resultado.innerHTML = result+"<button onclick='calcular("+N+","+M+")'>Calcular</button><div id='subres'></div>";

}

let calcular = function(N,M){
	let i=0;
	var result = "";
	for(i;i<N;i++){
		let j=0;
		let sum=0;
		for(j;j<M;j++){
			sum = sum + Number(document.getElementById("matriz"+i+"-"+j).value);
		}
		result = result + "La suma de la fila " + i+" es "+ sum +"<br>";
	}
	document.getElementById("subres").innerHTML = result;
}

let palindromo = function(){
	let number = String(document.getElementById("palindromo").value);
	let len = number.length;
	let result = "";
	for(len;len;len--)
		result = result + number[len-1];
	resultado.innerHTML = result;

}

function fibonumber(n)
{
	this.termino = n;
	this.func = function(n){
		if(n==0) return 0;
		if(n==1) return 1;
		let a = new fibonumber(n-1);
		let b = new fibonumber(n-2)
		return Number(a.value+b.value);
	};
	this.value = this.func(n);
}

let generarFibo = function ()
{
	let n = Number(document.getElementById("fibot").value);
	let fibo = new fibonumber(n);
	resultado.innerHTML="<p>"+fibo.value+"</p>";
}
