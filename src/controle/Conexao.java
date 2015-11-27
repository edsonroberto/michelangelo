package controle;

import javax.swing.JOptionPane;

import java.sql.*;


public class Conexao {	
	static Connection conn=null;
	static String url = "jdbc:mysql://localhost:3306/";
	static String usuario = "root";
	static String senha = "admin";
	public Statement st;
	public ResultSet rs;
	
	
	public static Connection conectaBanco(String banco) throws SQLException{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				conn = DriverManager.getConnection(url+banco, usuario, senha);
			} catch(SQLException ex) {
				System.out.println("Caminho, usuario ou senha incorretos!");
			}
		} catch(ClassNotFoundException e) {
			System.out.println("Driver não encontrado!");
		}
		return conn;
	}
	
	public void ExecutaSql(String sql) {
		try{
			st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.TYPE_FORWARD_ONLY);
			rs = st.executeQuery(sql);
		}catch (SQLException e){
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "ERRO:" + e);
		}
	}
}
