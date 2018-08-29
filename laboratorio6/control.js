let change = function(change)
{	
	let titulo = document.getElementById("titulo");
	if(change==1)
	{
		change=0;
		titulo.className="clicked";
	}
	else
	{
		change=1;
		titulo.className="default";

	}
		titulo.setAttribute("onClick","change("+change+")");
};

let dict = function(event,state)
{
	let palabra = document.getElementById("palabra");
	let result = document.getElementById("result");
	if(state==0)
	{
		state=1;
		let x = event.clientX;
		let y = event.clientY;
		result.className="show";
		result.style.top=x+"px"
		result.style.left=y+"px"
	}
	else
	{
		state=0;
		result.className="hidden";
	}
	palabra.setAttribute("onClick","dict(event,"+state+")");

};

function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}


 setInterval(function()
{
	let letters = '0123456789ABCDEF';
	let color = '#';
	for (let i = 0; i < 6; i++) {
    		color += letters[Math.floor(Math.random() * 16)];
  	}
	document.getElementById("psico").style.color=color;
}, 100);
