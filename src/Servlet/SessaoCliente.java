package Servlet;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mysql.jdbc.Connection;
import controle.Conexao;

/**
 * Servlet implementation class SessaoCliente
 */
@WebServlet("/SessaoCliente")
public class SessaoCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SessaoCliente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessao = request.getSession();
		sessao.removeAttribute("login");
		response.sendRedirect("login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		Connection conexao;
		try {
			conexao = (Connection) Conexao.conectaBanco("micchelangelo");
			if(conexao!=null) {
				String login = request.getParameter("login");
				String senha = request.getParameter("senha");
				Statement st;
				ResultSet rs;
				st = conexao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.TYPE_FORWARD_ONLY);
				rs = st.executeQuery("select *from cliente where login_usu='" + login + "' and senha_usu='" + senha + "'");
				if(rs.next()) {
					HttpSession sessao = request.getSession();
					sessao.setAttribute("login", login);
					response.sendRedirect("pedido.jsp");
					request.setAttribute("MensagemBoasVindas", "Olá " + login + " Seja Bem Vindo!");
				} 
				else {
					rs = st.executeQuery("select *from funcionario where login_func='" + login + "' and senha_func='" + senha + "'");
					if(rs.next()) {
						HttpSession sessao = request.getSession();
						sessao.setAttribute("login", login);
						response.sendRedirect("painel.jsp");
						request.setAttribute("MensagemBoasVindas", "Olá " + login + " Seja Bem Vindo!");
					}
					else {
						request.setAttribute("Mensagem", "Sua conta está inválida!");
						request.getRequestDispatcher("login.jsp").forward(request, response);
					}
				}
			}
			else {
				request.setAttribute("MensagemBanco", "Não foi possível se conectar ao banco de dados!");		
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}