package starsoft.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConexionBD {
	
	public static Connection obtenerConexion() throws SQLException {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/starsoft",
					"root", "root");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	
	
	public static Connection obtenerConexionPool() throws SQLException {

		Connection con = null;
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource datasource = (DataSource) envContext
					.lookup("jdbc/trastienda");
			con = datasource.getConnection();

		} catch (NamingException ex) {
			System.out.println(ex.getMessage());
			throw new SQLException("No se pudo encontrar el DataSource.");
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
			throw new SQLException("No se pudo obtener una conexi�n.");
		}
		return con;
	}

	
	
	
}
