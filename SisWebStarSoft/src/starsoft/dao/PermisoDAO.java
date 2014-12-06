package starsoft.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Idea;
import starsoft.modelo.Permiso;
import starsoft.util.ConexionBD;

public class PermisoDAO extends BaseDAO {
	public Collection<Permiso> listarPermiso(int id_Usuario)
			throws DAOExcepcion, LoginExcepcion {
		Collection<Permiso> lst = new ArrayList<Permiso>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_ListarPermiso(?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, id_Usuario);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Permiso vo = new Permiso();
				vo.setId_Permiso(rs.getInt("id_Permiso"));
				vo.setId_Idea(rs.getInt("id_Idea"));
				vo.setVotacion_Permiso(rs.getInt("votacion_Permiso"));
				vo.setTitulo_Idea(rs.getString("titulo_Idea"));
				vo.setDescripcion_Idea(rs.getString("descripcion_Idea"));
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
	
	public int ActualizarVotacionPermiso(Permiso obj)
			throws DAOExcepcion, LoginExcepcion {
		Connection con = null;
		CallableStatement stmt = null;
		try {
			String query = "CALL SP_ActualizarVotacionPermiso(?,?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, obj.getId_Permiso());
			stmt.setInt(2, obj.getVotacion_Permiso());
			return stmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
	}
	public Collection<Permiso> listarPermisoPorIdea(int id_Idea)
			throws DAOExcepcion, LoginExcepcion {
		Collection<Permiso> lst = new ArrayList<Permiso>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "SELECT p.id_Permiso, p.id_Idea, p.id_Usuario, u.nombre_Usuario FROM permiso as p "
					+ "INNER JOIN usuario as u ON u.id_Usuario = p.id_Usuario WHERE p.id_Idea = ?;";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, id_Idea);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Permiso vo = new Permiso();
				vo.setId_Permiso(rs.getInt("id_Permiso"));
				vo.setId_Idea(rs.getInt("id_Idea"));
				vo.setId_Usuario(rs.getInt("id_Usuario"));
				vo.setNombre_usuario(rs.getString("nombre_Usuario"));
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
	public Boolean insertar(int id_Usuario, int id_Idea) throws DAOExcepcion {
		String query = "INSERT INTO permiso(id_Idea, id_Usuario, votacion_Permiso, fecha_creacion) "
				+ " VALUES (?,?,0,NOW())";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
		Boolean result = false;

		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, id_Idea);
			stmt.setInt(2, id_Usuario);

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
	public int quitarTodo(int id_Idea)
			throws DAOExcepcion, LoginExcepcion {
		Connection con = null;
		CallableStatement stmt = null;
		try {
			String query = "DELETE FROM permiso where id_Idea = ?;";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, id_Idea);
			return stmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
	}
}
