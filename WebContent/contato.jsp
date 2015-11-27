<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
        <link rel="stylesheet" type="text/css" href="css/estilo.css">  
        <script src="js/slideshow.js" type="text/javascript"></script> 
</head>
<body>
        <!--Cabeca do documento-->
        <header> 
            <br><br>
            <div id="cabecalho">
                <table class="logo">
                    <tr>
                        <td>
                            <img src="imagens/logo_grd_c_sombra.png">
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
	
         <section id="pergaminho"> 
            <center style="margin-top:60px;">
                	<h3><b> Para dúvidas, comentários, entre em contato conosco:</b></h3>
                	                	
                	<label>Telefone : (11) 3444 - 2999</label><br/>
                	
                	<label>Endereço: Av. Saudades, </label><br/><label> 1635 - Centro, Limeira - SP, 13480-070</label>
                	
                	<img src="imagens/restaurante.jpg">
           </center>
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