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
				vo.setId_Usuario(rs.getInt("id_Usuario"));
				vo.setNombre_Usuario(rs.getString("nombre_Usuario"));
				vo.setPaterno_Usuario(rs.getString("paterno_Usuario"));
				vo.setMaterno_Usuario(rs.getString("materno_Usuario"));
				vo.setId_Tipo_Usuario(rs.getInt("id_Tipo_Usuario"));
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
	
	public Collection<Usuario> obtenerUsuarioIdea(int idIdea)
			throws DAOExcepcion {
		Collection<Usuario> lst = new ArrayList<Usuario>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_ListarIdeaMiembro(?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, idIdea);
			
			rs = stmt.executeQuery();
			while (rs.next()) {
				Usuario vo = new Usuario();
				vo.setNombre_Usuario(rs.getString("nombre_Usuario"));
				vo.setPaterno_Usuario(rs.getString("paterno_Usuario"));
				vo.setMaterno_Usuario(rs.getString("materno_Usuario"));
				vo.setNombre_Tipo_Usuario(rs.getString("nombreTipoUsuario"));
				
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
	
	public Usuario obtener(int idUsuario)
			throws DAOExcepcion, LoginExcepcion {
		Usuario vo = new Usuario();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_ObtenerUsuario(?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, idUsuario);
			rs = stmt.executeQuery();
			if (rs.next()) {
				vo.setId_Usuario(rs.getInt("id_Usuario"));
				vo.setNombre_Usuario(rs.getString("nombre_Usuario"));
				vo.setPaterno_Usuario(rs.getString("paterno_Usuario"));
				vo.setMaterno_Usuario(rs.getString("materno_Usuario"));
				vo.setId_Genero(rs.getInt("id_Genero"));
				vo.setId_Tipo_Documento(rs.getInt("id_Genero"));
				vo.setNroDocumento(rs.getString("NroDocumento"));
				vo.setCorreo_Usuario(rs.getString("correo_Usuario"));
				vo.setCelular_Usuario(rs.getString("celular_Usuario"));
				vo.setPassword_Usuario(rs.getString("password_Usuario"));
				vo.setId_Tipo_Usuario(rs.getInt("id_Tipo_Usuario"));
				vo.setId_Centro_Informacion(rs.getInt("id_Centro_Informacion"));
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
	
	public Boolean insertar(Usuario vo) throws DAOExcepcion {
		String query = "CALL SP_InsertarUsuario(?,?,?,?,?,?,?,?,?,?,?);";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
		Boolean result = false;
		
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setString(1, vo.getNombre_Usuario());
			stmt.setString(2, vo.getPaterno_Usuario());
			stmt.setString(3, vo.getMaterno_Usuario());
			stmt.setInt(4, vo.getId_Genero());
			stmt.setInt(5, vo.getId_Tipo_Documento());
			stmt.setString(6, vo.getNroDocumento());
			stmt.setString(7, vo.getCorreo_Usuario());
			stmt.setString(8, vo.getCelular_Usuario());
			stmt.setString(9, vo.getPassword_Usuario());
			stmt.setInt(10, vo.getId_Tipo_Usuario());
			stmt.setInt(11, vo.getId_Centro_Informacion());

			int i = stmt.executeUpdate();
			if (i != 1) {
				throw new SQLException("No se pudo insertar");
			}
			
			result = true;
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return result;
	}
	
	public Boolean actualizar(Usuario vo) throws DAOExcepcion {
		String query = "CALL SP_ActualizarUsuario(?,?,?,?,?,?,?,?,?,?,?,?);";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
		Boolean result = false;
		
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, vo.getId_Usuario());
			stmt.setString(2, vo.getNombre_Usuario());
			stmt.setString(3, vo.getPaterno_Usuario());
			stmt.setString(4, vo.getMaterno_Usuario());
			stmt.setInt(5, vo.getId_Genero());
			stmt.setInt(6, vo.getId_Tipo_Documento());
			stmt.setString(7, vo.getNroDocumento());
			stmt.setString(8, vo.getCorreo_Usuario());
			stmt.setString(9, vo.getCelular_Usuario());
			stmt.setString(10, vo.getPassword_Usuario());
			stmt.setInt(11, vo.getId_Tipo_Usuario());
			stmt.setInt(12, vo.getId_Centro_Informacion());

			int i = stmt.executeUpdate();
			if (i != 1) {
				throw new SQLException("No se pudo actualizar");
			}
			
			result = true;
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return result;
	}
	
	public Boolean eliminar(int idUsuario) throws DAOExcepcion {
		String query = "CALL SP_EliminarUsuario(?);";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
		Boolean result = false;
		
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, idUsuario);

			int i = stmt.executeUpdate();
			if (i != 1) {
				throw new SQLException("No se pudo eliminar");
			}
			
			result = true;
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return result;
	}
}
