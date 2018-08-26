
let determinante = function()
{
	let a = Number(document.getElementById("aa").value);
	let b = Number(document.getElementById("bb").value);
	let c = Number(document.getElementById("cc").value);
	return b*b-4*a*c;
};

let resultado = function()
{
	let a = Number(document.getElementById("aa").value);
	let b = Number(document.getElementById("bb").value);
	let c = Number(document.getElementById("cc").value);
	res = document.getElementById("result");
	if(determinante()<0 || a==0) 
		res.innerHTML="<p> No tiene raíces reales o a =0</p>";
	else{
		let sqrt = Math.sqrt(determinante())/(2*a);
		let first = -1*b/(2*a);
		let x1 = first+sqrt;
		let x2 = first-sqrt;
		res.innerHTML="X0 = " +x1+ " <br> X1 = "+ x2;
	}
}
