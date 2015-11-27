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
		<form class="form_pedido" name="descricaopedido" method="post" action="Bebida">
			<center>
				<div id="bebida">	
					<table id="tab_bebida">
						<tr>
							<td>
								<label>Coca-Cola 1,5 L R$6,00</label>
								<select name="coca_1e5">
									<option >0</option>
									<option value="qtdcoca1e5_1">1</option>
									<option value="qtdcoca1e5_2">2</option>
									<option value="qtdcoca1e5_3">3</option>
									<option value="qtdcoca1e5_4">4</option>
								</select>
							</td>
							<td>
								<label>Guarana 1,5 L R$6,00</label>
								<select name="guara_1e5">
									<option >0</option>
									<option value="qtdguara1e5_1">1</option>
									<option value="qtdguara1e5_2">2</option>
									<option value="qtdguara1e5_3">3</option>
									<option value="qtdguara1e5_4">4</option>
								</select><br/>
							</td>
						</tr>
						<tr>
							<td>
								<label>Coca-Cola 2 L R$7,00</label>
								<select name="coca_2">
									<option >0</option>
									<option value="qtdcoca2">1</option>
									<option value="qtdcoca2">2</option>
									<option value="qtdcoca2">3</option>
									<option value="qtdcoca2">4</option>
								</select>
							</td>
							<td>
								<label>Guarana 2 L R$7,00</label>
								<select name="guara_2">
									<option >0</option>
									<option value="guara2_1">1</option>
									<option value="guara2_2">2</option>
									<option value="guara2_3">3</option>
									<option value="guara2_4">4</option>
								</select>
							</td>
						</tr>
					
						<tr>
							<td>
								<label>Coca-Cola 3 L R$8,00</label>
								<select name="coca_3">
									<option >0</option>
									<option value="qtdcoca3">1</option>
									<option value="qtdcoca3">2</option>
									<option value="qtdcoca3">3</option>
									<option value="qtdcoca3">4</option>
								</select>
							</td>
							<td>
								<label>Guarana 3 L R$8,00</label>
								<select name="guara_3">
									<option >0</option>
									<option value="guara3_1">1</option>
									<option value="guara3_2">2</option>
									<option value="guara3_3">3</option>
									<option value="guara3_4"></option>
								</select>
							</td>
						</tr>
					</table>
				<br/><br/>
				<center>
					<input type="submit" value="Finalizar pedido"/>
				</center>
				<div class="sair"><a href="SessaoCliente">Sair</a></div>
				<br/><br/>
				</div>
			</center>
		</form>
	</body>
</html>