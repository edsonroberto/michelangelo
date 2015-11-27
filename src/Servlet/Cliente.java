package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import controle.Conexao;

/**
 * Servlet implementation class Cliente
 */
@WebServlet("/Cliente")
public class Cliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cliente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection resposta;
		CallableStatement cst = null;
		try {
			resposta = Conexao.conectaBanco("micchelangelo");
        	if(resposta!=null) {
        		String user = request.getParameter("usuario"); 
	            String pass = request.getParameter("senha");
	            String name = request.getParameter("nome");
	            String email = request.getParameter("email");
	            String tel = request.getParameter("telefone"); 
	            String cel = request.getParameter("celular");
	            String rua = request.getParameter("rua");
	            String number = request.getParameter("numero");
	            String compl = request.getParameter("complemento");
	            String neigh = request.getParameter("bairro");
	            String cep = request.getParameter("cep");
	            Statement st;
	            ResultSet rs;
	            st = resposta.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.TYPE_FORWARD_ONLY);
	            rs = st.executeQuery("select *from cliente where login_usu='" + user + "'");
	            if(!rs.next()) {									
	            	cst = resposta.prepareCall("{call cadastrarUsuario('" + user + "', "
																	+ "'" + pass + "',"
																	+ "'" + name + "',"
																	+ "'" + email + "',"
																	+ "'" + tel + "',"
																	+ "'" + cel + "',"
																	+ "'" + rua + "',"
																	+ "'" + number + "',"
																	+ "'" + compl + "',"
																	+ "'" + neigh + "',"
																	+ "'" + cep + "')}");
	            	cst.execute();
	            	response.sendRedirect("login.jsp");
	            }
	            else {
	            	request.setAttribute("ErroUsuario", "Erro! Nome de Usuário já existente!");
	            	request.getRequestDispatcher("cadastro.jsp").forward(request, response);
	            }
	        } 
        	else {
        		request.setAttribute("ErroCadastro", "Falha no cadastro");
        		request.getRequestDispatcher("cadastro.jsp").forward(request, response);
        	} 
        } catch (SQLException e) {
			e.printStackTrace();
		}
	}
}