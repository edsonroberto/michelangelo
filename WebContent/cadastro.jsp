<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Cadastre-se no nosso site!</title>
		<link rel="stylesheet" type="text/css" href="css/estilo.css">  
	    <script src="js/slideshow.js" type="text/javascript"></script>
	    <script>
	    function formatar(mascara, documento){
	        var i = documento.value.length;
	        var saida = mascara.substring(0,1);
	        var texto = mascara.substring(i)
	
	        if (texto.substring(0,1) != saida){
	            documento.value += texto.substring(0,1);
	        }
	    }
	    </script>
	</head>
	<body id="subsistema">
		<header id="subsistemaheader"> 
	         <br><br>
	         <img src="imagens/logo_grd_c_sombra.png">   
	    </header>
	    
	    <section>
			<form action="Cliente" method="post" name="form" id="formCadastro">
	        <h3>Faça seu cadastro!</h3><br><br>
	        <label>${ErroUsuario }</label>
			<p>
	             <label>Usuário:</label>
	              <input type="text" required="true" id="usuario" name="usuario" maxlength="20" placeholder="Qual seu nome usuário ?" size="70"/>  
	              <br><br>
				  <label>Senha:</label>
	              <input type="password" required="true" id="senha" name="senha" maxlength="20" placeholder="" size="20"/>
	                            
	              <br><br>
	             
	              <label>Nome Completo:</label>
	              <input type="text" required="true" id="nome" name="nome" maxlength="50" size="70"/>  
	              <br><br>
				  <label>E-mail:</label>
	              <input type="email" required="true" id="email" name="email" maxlength="50" placeholder="" size="20"/>
	                            
	              <br><br>
	                             
	              <label>Telefone:</label>
	              <input type="text" required="true" maxlength="12" id="telefone" name="telefone" OnKeyPress="formatar('##-####-####', this)" placeholder=" (DDD)-Telefone" size="17"/>
	                            
	              <label>Celular:</label>
	              <input type="text" required="true" maxlength="13" id="celular" name="celular" OnKeyPress="formatar('##-#####-####', this)" placeholder=" (DDD)-Celular" size="17"/>
	              <br><br>
	
	              <label>Rua:</label>
	              <input type="text" required="true" maxlength="100" id="rua" name="rua" placeholder="" size="50"/>
	
	              <label>Número residência:</label>
	              <input type="text" required="true" id="numero" name="numero" maxlength="5" size="7"/>
	
	              <br><br>
	
	              <label>Complemento:</label>
	              <input type="text" id="complemento" name="complemento" maxlength="10" placeholder="" />
	
	              <label>Bairro:</label>
	              <input type="text" required="true" maxlength="100" id="bairro" name="bairro"/>
	                                                      
	              <label>CEP:</label>
	              <input type="text" required="true" id="cep" maxlength="9" name="cep" OnKeyPress="formatar('#####-###', this)" placeholder="" size="10"/>     
	              <br><br>
	              <input id="cadastroDoador" name="Cadastro" type="submit" value="Cadastrar"/>
	              <input id="limpar" name="Limpar" type="reset" value="Limpar"/>
	        </p>
	 		</form>     
	    </section>
	</body>
</html>