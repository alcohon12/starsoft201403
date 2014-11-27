package starsoft.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Reunion;
import starsoft.util.ConexionBD;

public class ReunionDAO extends BaseDAO  {
	public Collection<Reunion> obtener(String FechaDesde, String FechaHasta)
			throws DAOExcepcion, LoginExcepcion {
		Collection<Reunion> lst = new ArrayList<Reunion>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_ListarReunion(?,?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setString(1, FechaDesde);
			stmt.setString(2, FechaHasta);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Reunion vo = new Reunion();
				vo.setId_Reunion(rs.getInt("id_Reunion"));
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
	
	public Reunion insertar(Reunion vo) throws DAOExcepcion {
		String query = "CALL SP_InsertarReunion(?,?,?,?);";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setString(1, vo.getObservacion_Reunion());
			stmt.setInt(2, vo.getId_Calificacion());
			stmt.setInt(3, vo.getId_Asesor());
			stmt.setString(4, vo.getFecha_Reunion_String());

			int i = stmt.executeUpdate();
			if (i != 1) {
				throw new SQLException("No se pudo insertar");
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return vo;
	}
}
