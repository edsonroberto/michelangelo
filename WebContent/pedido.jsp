<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.pizza"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<center><h3 >Olá, ${sessionScope.login}, seja bem vindo! &nbspFaça seu pedido!</h3></center>
		<p id="descricaopedido">Preocupados com a satisfação dos nosso clientes, nossa pizzaria dispõe de dois modelos de pizzas<br/>
		que podem ser vendidas: as tradicionais e as customizadas.<br/>
		1. Tradicional: Sabores tradicionais da pizzaria, onde o cliente pode<br/>
		escolher a opção de um único sabor ou metade de um sabor e metade outro sabor.<br/>
		2. Customizado: O cliente tem a opção de pedir a pizza de acordo com seus ingredientes preferidos.
		</p>
		<br/><br/>
		<center><div class="escolha"></div>
		<form class="form_pedido" action="TipoPizza" name="descricaopedido" method="post">
		<label>Escolha seu tipo de pizza!</label><br/><br/>
			<input type="radio" name="radioTipoPizza" value="radioTradicional"/><label>Tradicional</label><br/>
					<input type="radio" name="radioTipoPizza" value="radioCustomizada"/><label>Customizada</label><br/>
						<input type="submit" value="Próximo" style="padding: 5px 7px";/><br/><br/>
				</form>
				</center>
		<div class="sairpedido"><a href="SessaoCliente">Sair</a></div>
	</body>
</html>