package starsoft.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import starsoft.excepcion.DAOExcepcion;
import starsoft.modelo.Idea;
import starsoft.util.ConexionBD;

public class IdeaReporteDAO extends BaseDAO {
	
	public Collection<Idea> obtener(Date FechaDesde,Date FechaHasta,String idEstado,String titulo,String descripcion )
			throws DAOExcepcion {
		Collection<Idea> lst = new ArrayList<Idea>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL sp_Listar_IdeasReporte(?,?,?,?,?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			java.sql.Date dFechaDesde = new java.sql.Date(FechaDesde.getTime());
			stmt.setDate(1, dFechaDesde);
			java.sql.Date dFechaHasta = new java.sql.Date(FechaHasta.getTime());
			stmt.setDate(2, dFechaHasta);
			
			stmt.setString(3, idEstado);
			stmt.setString(4, titulo);
			stmt.setString(5, descripcion);
			/*
			 * a.id_Idea,a.titulo_Idea,a.descripcion_Idea,
a.palabrasClave1,a.palabrasClave2,a.palabrasClave3,a.palabrasClave4,
a.fecha_creacion,b.nombre_Usuario
			 * */
			 
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
				vo.setFecha_creacion(rs.getDate("fecha_creacion"));
				vo.setEstudiante(rs.getString("nombre_Usuario"));
			
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

}
