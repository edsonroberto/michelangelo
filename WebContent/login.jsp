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
	    </header>
		<div class="login"> 
			 ${Mensagem} 
	         <form method="post" action="SessaoCliente">
	              <center>
	                   <br/><br/>
	                   <label>Usuário: </label><input type="text" required id="login" name="login"/><br/>
	                   <label>Senha: </label><input type="password" required id="senha" name="senha"/>
	                   <br/><a href="cadastro.jsp" class="letreiro">Cadastre-se Aqui!</a></br></br>
	                   <input type="submit" value="Entrar"/>
	              </center>
	         </form>
	    </div>
	</body>
</html>