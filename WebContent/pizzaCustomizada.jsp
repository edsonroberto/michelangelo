<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.pizza"%>
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
	<% String selecionado = null; if(request != null && request.getParameter("saboresPizzas") != null)
	selecionado = request.getParameter("saboresPizzas"); ResultSet rs = null; %>

	<body id="subsistema">
		<header id="subsistemaheader">
			<br><br>
			<img src="imagens/logo_grd_c_sombra.png">
		</header><br/>
				<center><h3>${sessionScope.login}, escolha sua Pizza Customizada</h3></center>
				<form class="form_pedido" name="descricaopedido" method="post" action="PizzaCustomizada">
			<table id="tab_pedido" align=center cellpadding=10 cellspacing=10 >
				<tr>
					<td id="pizzacustomizada">
						<label>Tamanho:</label>
						<input type="radio" name="tamanhoPizzaCus" value="brotinho"/><label>Brotinho R$10,00</label>
						<input type="radio" name="tamanhoPizzaCus" value="normal"/><label>Normal R$15,00</label><br/>
						<label>Ingredientes:</label>
						<table id="tab_ing" align=center >
							<tr>
								<td>
									<input type="checkbox" name="ingTomate" id="ingTomate" value="tomate"/><label>Tomate R$1,50</label>
								</td>
								<td>
									<input type="checkbox" name="ingCebola" id="ingCebola" value="cebola"/><label>Cebola R$1,50</label>
								</td>
								<td>
									<input type="checkbox" name="ingMilho" id="ingMilho" value="milho"/><label>Milho R$1,50</label>
								</td>
								<td>
									<input type="checkbox" name="ingBrocolis" id="ingBrocolis" value="brocolis"/><label>Brócolis R$1,50</label>
								</td>
							</tr>
							<tr>
								<td>
									<input type="checkbox" name="ingQueijo" id="ingQueijo" value="queijo"/><label>Mussarela R$1,50</label>
								</td>
								<td>
									<input type="checkbox" name="ingAzeitona" id="ingAzeitona" value="azeitona"/><label>Azeitona R$1,00</label>
								</td>
								<td>
									<input type="checkbox" name="ingFrango" id="ingFrango" value="frango"/><label>Frango R$2,00</label>
								</td>
								<td>
									<input type="checkbox" name="ingCatupiry" id="ingCatupiry" value="catupiry"/><label>Catupiry R$1,50</label>
								</td>
							</tr>
							<tr>
								<td>
									<input type="checkbox" name="ingPresunto" id="ingPresunto" value="presunto"/><label>Presunto R$1,50</label>
								</td>
								<td>
									<input type="checkbox" name="ingBacon" id="ingBacon" value="bacon"/><label>Bacon R$2,00</label>
								</td>
								<td>
									<input type="checkbox" name="ingAtum" value="atum"/><label>Atum R$2,00</label>
								</td>
								<td>
									<input type="checkbox" name="ingPeperoni" id="ingPeperoni" value="peperoni"/><label>Pepperoni R$2,00</label>
								</td>
							</tr>
						</table>
						<br/><br/>
						<center><input type="submit" value="Adicionar ao carrinho!"/></center>
					<div class="sair"><a href="SessaoCliente">Sair</a></div>
					</td>
				</tr>
			</table>
			<br/><br/>
			<br/><br/>
		</form>
	</body>
</html>