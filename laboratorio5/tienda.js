function producto(nombre,precio,cantidaddesc) {
	this.nombre=nombre;
	this.precio=precio;
	this.cantidaddesc=cantidaddesc;
};

function catalogo()
{
	this.objects = new Set();
	this.add = function(obj){
		this.objects.add(obj);
	};
};

let cotizacion = function()
{
	let result = document.getElementById("result");
	let preresult="";
	let i=0;
	for(i;i<productos.length;i++)
	{
		if(cat.objects.has(productos[i]))
		{
			preresult=preresult+"<tr><td>"+productos[i].nombre+" Precio: "+ productos[i].precio +"dll. 50% de descuento desde " + productos[i].cantidaddesc+" Unidades</td><td>"+"<input value=1 type=number min=1 oninput='agregar("+i+")' id='prod"+i+"'></td></tr>";
		}
	}
	result.innerHTML = "<table>"+preresult+"</table>";
	calcular();
}

let agregar = function(id)
{
	cantidad[id]=document.getElementById("prod"+id).value;
	calcular();
}

let calcular = function()
{
	result = document.getElementById("precio");
	preresult = "";
	total = 0;
	let i=0;
	for(i;i<cantidad.length;i++)
	{
		if(cantidad[i]>0)
		{
			let pretotal=productos[i].precio*cantidad[i];
			if(cantidad[i]>=productos[i].cantidaddesc)
				pretotal=pretotal*0.5;
			preresult=preresult+"<tr><td>"+pretotal+" DLL</td><tr>";
			total = total+pretotal;
		}
	}
	result.innerHTML = "<table>"+preresult+"<tr><td>Total sin impuestos: "+total+ "</td><td>Con impuestos(IVA): "+total*1.16+"</td></tr></table>";
}

var cat = new catalogo();
var productos = [new producto("Fisher 75",700,10),new producto("Minelabs gtx",650,7), new producto("Garret",800,5)] ;
var cantidad = [0,0,0];



let select = function(id,idProducto,state){
	let image = document.getElementById(String(id));
	if(state==false){
		state = true;
		cat.add(productos[idProducto]);
		image.className="card-img-top hover";
		image.setAttribute("onClick","select("+id+","+idProducto+","+state+")");
		cantidad[idProducto]=1;
	}
	else{		
		state = false;
		cat.objects.delete(productos[idProducto]);
		image.className="card-img-top";
		image.setAttribute("onClick","select("+id+","+idProducto+","+state+")");
		cantidad[idProducto]=0;
	}
	cotizacion(cat,productos,cantidad);
}
