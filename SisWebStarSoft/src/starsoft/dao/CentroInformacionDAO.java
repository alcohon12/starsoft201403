package starsoft.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.CentroFormacion;

import starsoft.util.ConexionBD;

public class CentroInformacionDAO  extends BaseDAO  {

	
	public Collection<CentroFormacion> obtener(String Nombre)
			throws DAOExcepcion, LoginExcepcion {
		Collection<CentroFormacion> lst = new ArrayList<CentroFormacion>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_ListarCentroInformacion(?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setString(1, Nombre);
			
			rs = stmt.executeQuery();
			while (rs.next()) {
				CentroFormacion vo = new CentroFormacion();
				vo.setId_CentroFormacion(rs.getInt("id_Centro_Informacion"));
				vo.setNom_CentroFormacion(rs.getString("nombre_Centro_Informacion"));
				vo.setId_TipoCentroFormacion(rs.getInt("id_Tipo_Centro"));
				vo.setDs_TipoCentroFormacion(rs.getString("descripcion_Parametro"));
				vo.setUrl_CentroFormacion(rs.getString("url_Centro_Informacion"));
				vo.setSs_Pago(rs.getDouble("monto_Pago"));
				
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
	
	
	public Boolean insertar(CentroFormacion vo) throws DAOExcepcion {
		String query = "CALL SP_InsertarCentroInformacion(?,?,?,?);";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
		Boolean result = false;
		
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setString(1, vo.getNom_CentroFormacion() );
			stmt.setInt(2, vo.getId_TipoCentroFormacion());
			stmt.setString(3, vo.getUrl_CentroFormacion() );
			stmt.setDouble(4, vo.getSs_Pago());
			
			
			

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
	

	public Boolean actualizar(CentroFormacion vo) throws DAOExcepcion {
		String query = "CALL SP_ActualizarCentroInformacion(?,?,?,?,?);";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
		Boolean result = false;
		
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setString(1, vo.getNom_CentroFormacion() );
			stmt.setInt(2, vo.getId_TipoCentroFormacion());
			stmt.setString(3, vo.getUrl_CentroFormacion() );
			stmt.setDouble(4, vo.getSs_Pago());
			stmt.setInt(5, vo.getId_CentroFormacion());
			
			
			

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
	public CentroFormacion obtener(int id) throws DAOExcepcion{
		
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		CentroFormacion vo = new CentroFormacion();
		try {
			String query = "CALL SP_ObtenerCentroInformacion(?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, id);
			
			
			rs = stmt.executeQuery();
			while (rs.next()) {
				
				vo.setId_CentroFormacion(rs.getInt("id_Centro_Informacion"));
				vo.setNom_CentroFormacion(rs.getString("nombre_Centro_Informacion"));
				vo.setId_TipoCentroFormacion(rs.getInt("id_Tipo_Centro"));
				vo.setDs_TipoCentroFormacion(rs.getString("descripcion_Parametro"));
				vo.setUrl_CentroFormacion(rs.getString("url_Centro_Informacion"));
				vo.setSs_Pago(rs.getDouble("monto_Pago"));
				
				
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
	
	public Boolean eliminar(int id) throws DAOExcepcion {
		String query = "CALL SP_EliminarCentroInformacion(?);";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
		Boolean result = false;
		
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, id);
		
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
	
	
}
