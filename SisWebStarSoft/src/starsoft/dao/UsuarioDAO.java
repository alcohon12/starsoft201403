package starsoft.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.CallableStatement;
import java.util.ArrayList;
import java.util.Collection;

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Usuario;
import starsoft.util.ConexionBD;

public class UsuarioDAO extends BaseDAO {
	public Usuario validar(String correo, String contrasena)
			throws DAOExcepcion, LoginExcepcion {
		Usuario vo = new Usuario();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_ValidarUsuario(?,?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
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
			this.cerrarCallable(stmt);
			this.cerrarConexion(con);
		}
		return vo;
	}
	
	public Collection<Usuario> obtener(int campo, String filtro)
			throws DAOExcepcion, LoginExcepcion {
		Collection<Usuario> lst = new ArrayList<Usuario>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_ListarUsuario(?,?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, campo);
			stmt.setString(2, filtro);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Usuario vo = new Usuario();
				vo.setId_Usuario(rs.getInt("id_Usuario"));
				vo.setNombre_Usuario(rs.getString("nombre_Usuario"));
				vo.setPaterno_Usuario(rs.getString("paterno_Usuario"));
				vo.setMaterno_Usuario(rs.getString("materno_Usuario"));
				vo.setNombre_Tipo_Usuario(rs.getString("Nombre_Tipo_Usuario"));
				vo.setCorreo_Usuario(rs.getString("correo_Usuario"));
				
				lst.add(vo);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return lst;
	}
}
