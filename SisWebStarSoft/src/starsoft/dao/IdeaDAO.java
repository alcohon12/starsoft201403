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
import starsoft.modelo.Idea;
import starsoft.modelo.Usuario;
import starsoft.util.ConexionBD;

public class IdeaDAO extends BaseDAO {
	public Collection<Idea> listarIdea() throws DAOExcepcion, LoginExcepcion {
		Collection<Idea> lst = new ArrayList<Idea>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_ListarIdea();";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Idea vo = new Idea();
				vo.setId_Idea(rs.getInt("id_Idea"));
				vo.setTitulo_Idea(rs.getString("titulo_Idea"));
				vo.setDescripcion_Idea(rs.getString("descripcion_Idea"));
				vo.setPalabraClave1(rs.getString("palabrasClave1"));
				vo.setPalabraClave2(rs.getString("palabrasClave2"));
				vo.setPalabraClave3(rs.getString("palabrasClave3"));
				vo.setPalabraClave4(rs.getString("palabrasClave4"));
				vo.setExtensionArchivoIdea(rs
						.getString("extensionArchivo_Idea"));
				vo.setEstado_Idea(rs.getString("descripcion_Parametro"));
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
	
	public Collection<Idea> listarIdea(int idAsesor) throws DAOExcepcion {
		Collection<Idea> lst = new ArrayList<Idea>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_ListarIdeaAsesor(?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			
			stmt.setInt(1, idAsesor);
			
			rs = stmt.executeQuery();
			while (rs.next()) {
				Idea vo = new Idea();
				vo.setId_Idea(rs.getInt("id_Idea"));
				vo.setTitulo_Idea(rs.getString("titulo_Idea"));
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

	public Boolean insertar(Idea vo) throws DAOExcepcion {
		String query = "INSERT INTO idea(titulo_Idea, descripcion_Idea, palabrasClave1, palabrasClave2, palabrasClave3, palabrasClave4,"
				+ " extensionArchivo_Idea, id_Estado, id_Alumno, fecha_creacion) "
				+ " VALUES (?,?,?,?,?,?,?,?,?,?)";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
		Boolean result = false;

		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setString(1, vo.getTitulo_Idea());
			stmt.setString(2, vo.getDescripcion_Idea());
			stmt.setString(3, vo.getPalabraClave1());
			stmt.setString(4, vo.getPalabraClave2());
			stmt.setString(5, vo.getPalabraClave3());
			stmt.setString(6, vo.getPalabraClave4());
			stmt.setString(7, vo.getExtensionArchivoIdea());
			stmt.setInt(8, vo.getId_Estado());
			stmt.setInt(9, vo.getId_Alumno());

			java.sql.Date dFechaIdea = new java.sql.Date(vo.getFecha_creacion()
					.getTime());
			stmt.setDate(10, dFechaIdea);

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

	public Boolean actualizar(Idea vo) throws DAOExcepcion {
		String query = "UPDATE idea SET titulo_Idea=?,descripcion_Idea=?, "
				+ "palabrasClave1=?,palabrasClave2=?,palabrasClave3=?, "
				+ "palabrasClave4=?,extensionArchivo_Idea=?,fecha_modificacion=? "
				+ "WHERE id_Idea=?;";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
		Boolean result = false;

		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setString(1, vo.getTitulo_Idea());
			stmt.setString(2, vo.getDescripcion_Idea());
			stmt.setString(3, vo.getPalabraClave1());
			stmt.setString(4, vo.getPalabraClave2());
			stmt.setString(5, vo.getPalabraClave3());
			stmt.setString(6, vo.getPalabraClave4());
			stmt.setString(7, vo.getExtensionArchivoIdea());
			stmt.setInt(9, vo.getId_Idea());

			java.sql.Date dFechaMIdea = new java.sql.Date(vo
					.getFecha_modificacion().getTime());
			stmt.setDate(8, dFechaMIdea);

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

	public Idea obtener(int idIdea) throws DAOExcepcion, LoginExcepcion {
		Idea vo = new Idea();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "SELECT id_Idea, titulo_Idea, descripcion_Idea, palabrasClave1, palabrasClave2, "
					+ "palabrasClave3, palabrasClave4, extensionArchivo_Idea, id_Estado, id_Alumno, "
					+ "fecha_creacion, fecha_modificacion, fecha_aprobacion, id_Asesor FROM idea  WHERE id_Idea = ?;";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, idIdea);
			rs = stmt.executeQuery();
			if (rs.next()) {
				vo = new Idea();
				vo.setId_Idea(rs.getInt("id_Idea"));
				vo.setTitulo_Idea(rs.getString("id_Calificacion"));
				vo.setDescripcion_Idea(rs.getString("descripcion_Idea"));
				vo.setPalabraClave1(rs.getString("palabrasClave1"));
				vo.setPalabraClave2(rs.getString("palabrasClave1"));
				vo.setPalabraClave3(rs.getString("palabrasClave1"));
				vo.setPalabraClave4(rs.getString("palabrasClave1"));
				vo.setExtensionArchivoIdea(rs
						.getString("extensionArchivo_Idea"));
				vo.setId_Estado(rs.getInt("id_Estado"));
				vo.setId_Alumno(rs.getInt("id_Alumno"));
				vo.setFecha_creacion(rs.getDate("fecha_creacion"));
				vo.setFecha_modificacion(rs.getDate("fecha_modificacion"));
				vo.setFecha_aprobacion(rs.getDate("fecha_aprobacion"));
				vo.setId_Asesor(rs.getInt("id_Asesor"));
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

	public Boolean eliminar(int idIdea) throws DAOExcepcion {
		String query = "DELETE FROM idea  WHERE id_Idea = ?;";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
		Boolean result = false;

		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, idIdea);

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
