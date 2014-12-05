function AgregarVotacion(pCodigoUsuario)
{
	document.getElementById("txtVotacion").value=pCodigoUsuario;
	/*if(pCodigoUsuario == "1"){
		document.getElementById("ImgStar1").src = "img/Iconos/Star.png";
		document.getElementById("ImgStar2").src = "img/Iconos/StarD.png";
		document.getElementById("ImgStar3").src = "img/Iconos/StarD.png";
		document.getElementById("ImgStar4").src = "img/Iconos/StarD.png";
		document.getElementById("ImgStar5").src = "img/Iconos/StarD.png";
	}else if(pCodigoUsuario == "2"){
		document.getElementById("ImgStar1").src = "img/Iconos/Star.png";
		document.getElementById("ImgStar2").src = "img/Iconos/Star.png";
		document.getElementById("ImgStar3").src = "img/Iconos/StarD.png";
		document.getElementById("ImgStar4").src = "img/Iconos/StarD.png";
		document.getElementById("ImgStar5").src = "img/Iconos/StarD.png";
	}else if(pCodigoUsuario == "3"){
		document.getElementById("ImgStar1").src = "img/Iconos/Star.png";
		document.getElementById("ImgStar2").src = "img/Iconos/Star.png";
		document.getElementById("ImgStar3").src = "img/Iconos/Star.png";
		document.getElementById("ImgStar4").src = "img/Iconos/StarD.png";
		document.getElementById("ImgStar5").src = "img/Iconos/StarD.png";
	}else if(pCodigoUsuario == "4"){
		document.getElementById("ImgStar1").src = "img/Iconos/Star.png";
		document.getElementById("ImgStar2").src = "img/Iconos/Star.png";
		document.getElementById("ImgStar3").src = "img/Iconos/Star.png";
		document.getElementById("ImgStar4").src = "img/Iconos/Star.png";
		document.getElementById("ImgStar5").src = "img/Iconos/StarD.png";
	}else if(pCodigoUsuario == "5"){
		document.getElementById("ImgStar1").src = "img/Iconos/Star.png";
		document.getElementById("ImgStar2").src = "img/Iconos/Star.png";
		document.getElementById("ImgStar3").src = "img/Iconos/Star.png";
		document.getElementById("ImgStar4").src = "img/Iconos/Star.png";
		document.getElementById("ImgStar5").src = "img/Iconos/Star.png";
	}*/
	//document.frmDiscusionIdea.funcion.value='';
    document.forms['frmDiscusionIdea'].action = 'RegistroVotacionServlet'; 
    document.forms['frmDiscusionIdea'].submit();
}

function GuargarComentario() {
	if (event.which == 13 && document.getElementById("txtComent").value.trim() != '') {
			document.forms['frmDiscusionIdea'].action = 'RegistroDiscusionServlet'; 
		    document.forms['frmDiscusionIdea'].submit();
    }
}

function GuargarRespuesta(padre,caja) {
	document.getElementById("txtRespuesta").value = document.getElementById(caja).value;
	if (event.which == 13 && document.getElementById("txtRespuesta").value.trim() != '') {
			document.getElementById("txtPadre").value = padre;
			document.forms['frmDiscusionIdea'].action = 'RegistroRespuestaServlet'; 
		    document.forms['frmDiscusionIdea'].submit();
    }
}
