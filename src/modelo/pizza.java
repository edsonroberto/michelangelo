package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import controle.Conexao;

public class pizza extends Conexao{	
	static private PreparedStatement pst=null;
	
	public static ResultSet getPizzas() {
		ResultSet rs=null;
		try {
			String sql = "SELECT * FROM sabor";
			pst=conectaBanco("micchelangelo").prepareStatement(sql);
			rs=pst.executeQuery();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return rs;
	}
	public static ResultSet getPizzasById(String id){
		ResultSet rs=null;
		try {
			String sql = "SELECT * FROM sabor where id_pizza = " + id;
			pst=conectaBanco("micchelangelo").prepareStatement(sql);
			rs=pst.executeQuery();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return rs;
	}
}
