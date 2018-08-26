let password = function(){
	let color = "red";
	let msg = "Mala seguridad usa carácteres alpanúmericos y especiales";
	var input = String(document.getElementById("pass1").value);
	seguridad = 0;
	let array = ["[0-9]","[a-z]","[A-Z]","[#|%|&|!|=|+|-|.|:|;|,]"];
	let a = 1;
	let bar=0;
	for(a;a<=4;a++){
		var regex = new RegExp(array[a-1],'g');
		let res = input.match(regex);
		if(res)
			bar = bar + res.length*a*a
	}
	if(bar>25 && bar<75){
		color = "orange";
		msg = "Ya casi";}
	else if(bar>75){
		color = "green";
		msg = "Excelente :)";}
	document.getElementById("bar").style="width:"+bar+"%;background-color:"+color+";";
	document.getElementById("msg").innerHTML=msg;
	password2();
};

let password2 = function(){
	if(document.getElementById("pass1").value===document.getElementById("pass2").value){
		document.getElementById("msg2").innerHTML="Coinciden las contraseñas :)";
	}
	else{
		document.getElementById("msg2").innerHTML="No coinciden las contraseñas :(";
	}
}

