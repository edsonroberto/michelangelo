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
		<script>
		function show2sabores(value){
			if(value == 'unicosabor'){
				document.forms.descricaopedido.saboresPizzas[1].style.display = 'none';
				document.getElementById('lblSabor').innerHTML="Sabor:";
			} else if(value == 'doissabores'){
				document.forms.descricaopedido.saboresPizzas[1].style.display = 'inline-block';
				document.getElementById('lblSabor').innerHTML="Sabores:";
			}
		}
		</script>
	</head>
	<% String selecionado = null; if(request != null && request.getParameter("saboresPizzas") != null)
	selecionado = request.getParameter("saboresPizzas"); ResultSet rs = null; %>

	<body id="subsistema">
		<header id="subsistemaheader">
			<br><br>
			<img src="imagens/logo_grd_c_sombra.png">
		</header><br/>
			<center><h3>${sessionScope.login}, escolha sua Pizza Tradicional</h3></center>
		<form class="form_pedido" name="descricaopedido" method="post" action="PizzaTradicional">
			<table id="tab_pedido" align=center cellpadding=10 cellspacing=10 >
				<tr>
					<td id="pizzacomum">
						<label>Tipo de pizza:</label>
							<input type="radio" name="qtdSabor" value="unicosabor" onchange="show2sabores(this.value);" /><label>Único sabor</label>
							<input type="radio" name="qtdSabor" value="doissabores" onchange="show2sabores(this.value);" /><label>Dois sabores</label><br/>
						<label>Tamanho:</label>
							<input type="radio" name="tamanhoPizza" value="brotinho"/><label>Brotinho</label>
							<input type="radio" name="tamanhoPizza" value="normal"/><label>Normal</label><br/>
						<label id="lblSabor">Sabor:</label>
						<select name="saboresPizzas" style="width:150px " >
							<option>Sabores<option/>
							<%rs = pizza.getPizzas();
							while(rs.next()) {%>
							<option value="<%= rs.getString("id_pizza") %>"<%= rs.getString("id_pizza").equals(selecionado) ? " selected" : "" %>><%=rs.getString("sabor_pizza") %> </option>
							<%}%>
						</select>
						<select name="saboresPizzas" style="width:150px " >
							<option>Sabores<option/>
							<%rs = pizza.getPizzas();
							while(rs.next()) {%>
							<option value="<%= rs.getString("id_pizza") %>"<%= rs.getString("id_pizza").equals(selecionado) ? " selected" : "" %>><%=rs.getString("sabor_pizza") %> </option>
							<%}%>
						</select>
						<label>Valor: R$ <%
						if(selecionado != null){
						rs = pizza.getPizzasById(selecionado);
						if(rs.next()) {
						%>
						<span class="valorpizza"><%=rs.getString("valor_pizza")%></span>
						<%} }%> </label>
						<br/><br/>
						
						<input type="submit" value="Adicionar ao carrinho!" />
						<div class="sair"><a href="SessaoCliente">Sair</a></div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>