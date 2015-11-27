<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Painel de controle de pedidos</title>
		<link rel="stylesheet" type="text/css" href="css/estilo.css">  
	    <script src="js/slideshow.js" type="text/javascript"></script>
	</head>
	<body id="subsistema">
		<header id="subsistemaheader"> 
	         <br><br>
	         <img src="imagens/logo_grd_c_sombra.png">   
	    </header>
		<div class="painel"> 
			 ${sessionScope.login}
			 <a href="SessaoCliente">Sair do sistema</a>
	    </div>
	</body>
</html>