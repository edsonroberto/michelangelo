<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.pizza"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Pizzaria Micchelangelo - Cardápio</title>
        
        <link rel="stylesheet" type="text/css" href="css/estilo.css"/>
         
        <script type="text/javascript"
				src="http://localhost:9000/checkout.js"
				data-button-text="Testar o checkout"
				data-customer-data="true"
				data-payment-methods= "credit_card"
				data-encrytion-key="ek_test_2Nt8dowH24F1P97ponyMkvaXuv1XxA"
				data-amount="1000" data-ui-color="eb560f">
			</script>
     </head>
     <%
     	String selecionado = null;
     	if(request != null && request.getParameter("combo") != null)
     		selecionado = request.getParameter("combo");
     	ResultSet rs = null;
     %>

     
    <body>
        <!--Cabeca do documento-->
        <header> 
            <br><br>
            <div id="cabecalho">
                <table class="logo">
                    <tr>
                        <td>
                            <img src="imagens/logo_grd_c_sombra.png"/>
                        </td>
                    </tr>
                </table>
            </div>
        </header>
        
        <!--Menu de navegacao-->
        <nav>
            <table class="menucaixa">
                <tr>
                    <td>
                         <ul class="menu">
                             <li><a href="home.jsp">Início</a></li>
                             <li><a href="cardapio.jsp">Cardápio</a></li>
                             <li><a href="login.jsp">Fazer pedido</a></li>
                             <li><a href="quemsomos.jsp">Quem somos</a></li>
                             <li><a href="contato.jsp">Contato</a></li>
                        </ul>
                    </td>    
                </tr>
            </table>   
 
            <br><br>
        </nav>
        <section id="cardapio">
        
        <table class="drop_cardapio">

			<tr>
        		<td>
        		<form id="comboo"  action="cardapio.jsp" method="post">	
				<select  name="combo" onchange="document.getElementById('comboo').submit();return true;">
					<option > Selecionar Pizza</option>
					  <%rs = pizza.getPizzas();
					  	while(rs.next()) {%>
					<option value="<%= rs.getString("id_pizza") %>"<%= rs.getString("id_pizza").equals(selecionado) ? " selected" : "" %>>
					<%=rs.getString("sabor_pizza") %> </option>
					<%}%>
					  		
				</select> 		
       		</form>
        		</td>
           	</tr>
       
        </table>
        	<div class="descricao">
        	<%
       		if(selecionado != null){
	       		rs = pizza.getPizzasById(selecionado);
				if(rs.next()) {
			%>
					<span class="descricaopizza"><%=rs.getString("descricao")%></span>
				<%}
			}%>
        	</div>
       		
        </section>
        <!--Rodape do site-->

        <footer>
            <table class="rodape">
                <tr>
                     <td class="direitos">
                         &copy; 2015 Grupo 1
                     </td>
                     <td>
                         <figure class="formas_pagamento">
                    
                        <img width="50" height="30" src="imagens/visa.png"/>
                        <img width="50" height="30" src="imagens/maestro.png"/>
                        <img width="30" height="30" src="imagens/american.png"/>
                        <img width="30" height="30" src="imagens/elo.png"/>
                 
                        </figure>
                     </td>
                </tr>
            </table>
        </footer>
    </body>
</html>