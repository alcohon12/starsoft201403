package starsoft.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Reunion;
import starsoft.util.ConexionBD;

public class ReunionDAO extends BaseDAO  {
	public Collection<Reunion> obtener(Date FechaDesde, Date FechaHasta)
			throws DAOExcepcion, LoginExcepcion {
		Collection<Reunion> lst = new ArrayList<Reunion>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_ListarReunion(?,?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			java.sql.Date dFechaDesde = new java.sql.Date(FechaDesde.getTime());
			stmt.setDate(1, dFechaDesde);
			java.sql.Date dFechaHasta = new java.sql.Date(FechaHasta.getTime());
			stmt.setDate(2, dFechaHasta);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Reunion vo = new Reunion();
				vo.setId_Reunion(rs.getInt("id_Reunion"));
				vo.setId_Idea(rs.getInt("id_Idea"));
				vo.setTitulo_Idea(rs.getString("titulo_Idea"));
				vo.setObservacion_Reunion(rs.getString("observacion_Reunion"));
				vo.setNombre_Calificacion(rs.getString("nombre_Calificacion"));
				vo.setFecha_Reunion(rs.getDate("fecha_Reunion"));
				
				lst.add(vo);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarCallable(stmt);
			this.cerrarConexion(con);
		}
		return lst;
	}
	
	public Boolean insertar(Reunion vo) throws DAOExcepcion {
		String query = "CALL SP_InsertarReunion(?,?,?,?,?);";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
		Boolean result = false;
		
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, vo.getId_Idea());
			stmt.setString(2, vo.getObservacion_Reunion());
			stmt.setInt(3, vo.getId_Calificacion());
			stmt.setInt(4, vo.getId_Asesor());
			
			java.sql.Date dFechaReunion = new java.sql.Date(vo.getFecha_Reunion().getTime());
			stmt.setDate(5, dFechaReunion);

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
	
	public Boolean actualizar(Reunion vo) throws DAOExcepcion {
		String query = "CALL SP_ActualizarReunion(?,?,?,?,?,?);";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
		Boolean result = false;
		
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, vo.getId_Reunion());
			stmt.setInt(2, vo.getId_Idea());
			stmt.setString(3, vo.getObservacion_Reunion());
			stmt.setInt(4, vo.getId_Calificacion());
			stmt.setInt(5, vo.getId_Asesor());
			
			java.sql.Date dFechaReunion = new java.sql.Date(vo.getFecha_Reunion().getTime());
			stmt.setDate(6, dFechaReunion);

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
	
	public Reunion obtener(int idReunion)
			throws DAOExcepcion, LoginExcepcion {
		Reunion vo = new Reunion();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_ObtenerReunion(?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, idReunion);
			rs = stmt.executeQuery();
			if (rs.next()) {
				vo = new Reunion();
				vo.setId_Reunion(rs.getInt("id_Reunion"));
				vo.setId_Idea(rs.getInt("id_Idea"));
				vo.setId_Calificacion(rs.getInt("id_Calificacion"));
				vo.setObservacion_Reunion(rs.getString("observacion_Reunion"));
				vo.setNombre_Calificacion(rs.getString("nombre_Calificacion"));
				vo.setFecha_Reunion(rs.getDate("fecha_Reunion"));
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
	
	public Boolean eliminar(int idReunion) throws DAOExcepcion {
		String query = "CALL SP_EliminarReunion(?);";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
		Boolean result = false;
		
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, idReunion);

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
