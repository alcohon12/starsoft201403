package starsoft.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Usuario;
import starsoft.util.ConexionBD;

public class UsuarioDAO extends BaseDAO {
	public Usuario validar(String correo, String contrasena)
			throws DAOExcepcion, LoginExcepcion {
		Usuario vo = new Usuario();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "SELECT nombre_Usuario,paterno_Usuario,materno_Usuario FROM usuario where correo_Usuario = ? AND password_Usuario = ?";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, correo);
			stmt.setString(2, contrasena);
			rs = stmt.executeQuery();
			if (rs.next()) {
				vo.setNombre_Usuario(rs.getString("nombre_Usuario"));
				vo.setPaterno_Usuario(rs.getString("paterno_Usuario"));
				vo.setMaterno_Usuario(rs.getString("materno_Usuario"));
			}
			else {
				throw new LoginExcepcion("No existe");
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return vo;
	}
}
