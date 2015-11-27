	var imagecount = 1;
	var total = 5;

	function slide(x){

		var image = document.getElementById('img');
		imagecount = imagecount + x;
		if(imagecount > total){ imagecount = 1;}
		if(imagecount < 1){imagecount = total;}
		image.src="imagens/img" + imagecount + ".jpg";
	}

	window.setInterval( 	function slideA(){

		var image = document.getElementById('img');
		imagecount = imagecount + 1;
		if(imagecount > total){ imagecount = 1;}
		if(imagecount < 1){imagecount = total;}
		image.src="imagens/img" + imagecount + ".jpg";
		},5000 ); 
