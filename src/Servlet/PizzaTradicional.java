package Servlet;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controle.Conexao;

/**
 * Servlet implementation class PizzaTradicional
 */
@WebServlet("/PizzaTradicional")
public class PizzaTradicional extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PizzaTradicional() {
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
		Connection conexao = null;
		try {
			conexao = Conexao.conectaBanco("micchelangelo");
			if (conexao != null) {
	     		PreparedStatement prep;
	     		ResultSet rs;
	     		
				String qtdSabores = request.getParameter ("qtdSabor");
				String tamanhoPizza = request.getParameter("tamanhoPizza");
				HttpSession sessao = request.getSession();
				String[] selecionado;
				CallableStatement cst=null,cst2=null;
				int aux=0;
				
				if (qtdSabores.equals("unicosabor")) {
					qtdSabores = "Inteira";
				} else if(qtdSabores.equals("doissabores")) {
					qtdSabores = "Meia";
				}
				
				if (tamanhoPizza.equals("brotinho")) {
					tamanhoPizza = "Brotinho";
				} else if (tamanhoPizza.equals("normal")) {
					tamanhoPizza = "Tradicional";
				}
				
				if(request != null && request.getParameter("saboresPizzas") != null) {
		     		selecionado = request.getParameterValues("saboresPizzas");
		     		request.getParameterValues("name do checkbox");
		     		// ele retorna dentro da string os values selecionados
		     		
		     		String sql = "select sabor_pizza from sabor where id_pizza IN (" + selecionado[0] + ", " + selecionado[1] + ");";

		     		prep = conexao.prepareStatement(sql);
		     		rs = prep.executeQuery();
		     		
		     		ArrayList<String> resps = new ArrayList<String>();
		     		while(rs.next()){
		     			resps.add(rs.getString("sabor_pizza"));
		     		}
		     		
		     		sql = "select * from pizza where sabor_pizza IN ('" + resps.get(0) + "','" + resps.get(1) + "')"
		     				+ " and tamanho_pizza = '" + tamanhoPizza + "' and qtdPizza = '" + qtdSabores + "'";
		     		
		     		
		     		prep = conexao.prepareStatement(sql);
		     		rs = prep.executeQuery();
		     		
		     		while(rs.next()){
		     			System.out.println("Pizza: " + rs.getString("id_pizza"));
			     		//pedido.id_pizza = System.out.println("Pizza: " + rs.getString("id_pizza"));
		     		}
		     	}
				
				int id = 15;
				if(qtdSabores=="Meia" && tamanhoPizza=="Brotinho"){
					aux=0;
				} else if(qtdSabores=="Inteira" && tamanhoPizza=="Brotinho"){
					aux=20;
				} else if(qtdSabores=="Meia" && tamanhoPizza=="Tradicional"){
					aux=40;
				} else if(qtdSabores=="Inteira" && tamanhoPizza=="Tradicional"){
					aux=60;
				}
				String sql = "select MAX(id_pedido)+1 as 'idPedido' from pedido;";

	     		prep = conexao.prepareStatement(sql);
	     		rs = prep.executeQuery();
	     		rs.next();
	     		int idpedido = rs.getInt("idPedido");
				cst2 = conexao.prepareCall("{call fazerPedido(" + idpedido 
																+ ",'renanvieira')}");
				cst2.execute();
				cst = conexao.prepareCall("{call adicionarPizzaNoCarrinho(" + idpedido +" , '" 
																		    + (id+aux) +"')}");
				cst.execute();
				
				response.sendRedirect("acompanhamento.jsp");
			}
			else {
				request.setAttribute("ErroCadastro", "Erro ao se conectar com o banco de dados!");
        		request.getRequestDispatcher("pizzaTradicional.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
