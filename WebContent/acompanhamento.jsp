<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Bem vindo ao sistema de pedidos!</title>
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
		<script src="js/slideshow.js" type="text/javascript"></script>
	</head>
	<body id="subsistema">
		<header id="subsistemaheader">
			<br><br>
			<img src="imagens/logo_grd_c_sombra.png">
		</header><br/>
		<center><h1>Faça seu pedido!</h1></center>
		<label>Olá ${sessionScope.login} Seja Bem Vindo!</label>
        <a href="SessaoCliente">Sair do sistema</a>
		<form class="form_pedido" name="descricaopedido" method="post" action="Acompanhamento">
			<center>
				<div id="bebida">
				<label>Bebida acompanha?</label>
					<input type="radio" name="acompanhamento" value="bebidasim"/><label>Sim</label>
					<input type="radio" name="acompanhamento" value="bebidanao"/><label>Não</label><br/>	
				<br/><br/>
				<center>
					<input type="submit" value="Próximo"/>
				</center>
				<br/><br/>
				</div>
			</center>
		</form>
	</body>
</html>