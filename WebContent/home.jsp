<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bem vindo a Micchelangelo!</title>

        <link rel="stylesheet" type="text/css" href="css/estilo.css">  
        <script src="js/slideshow.js" type="text/javascript"></script> 
</head>
<body onLoad="slideA()">
        
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

        <!--Sessao de conteudo da pagina-->
        <section id="fundo">
            <h2>Venha experimentar nossas pizzas!</h2>
            <!--Slideshow das pizzas-->
            <div>
              
                <div id="container">
                    <a href="cardapio.jsp">
                        <img src="imagens/img1.jpg " id="img"/>
                    </a>
                    <div class="right_holder">
                        <img  onClick="slide(-1)" src="imagens/arrowright.png" class="right"/>
                    </div>
                    <div class="left_holder">
                        <img onClick="slide(1)" src="imagens/arrowleft.png" class="left"/>
                    </div>
                </div>
            </div>	

            <!--Banner de personalizar pizza-->
            <div id="container2">
                <figure class="foto2">
                    <a href="login.jsp">
                        <img src="imagens/moldura7.png "/>
                    </a>
                </figure>
            </div>

            <!--Banner de personalizar pizza-->
            <div id="container3">
                <figure class="foto3">
                    <a href="login.jsp">
                        <img src="imagens/moldura5.png "/>
                    </a>
                </figure>
            </div>

                        <!--Banner de personalizar pizza-->
            <div id="container4">
                <figure class="foto4">
                    <a href="login.jsp">
                        <img src=""/>
                    </a>
                </figure>
            </div>


            <div id="container5">

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