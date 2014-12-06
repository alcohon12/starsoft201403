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
import starsoft.modelo.CentroFormacion;
import starsoft.modelo.Respuesta;
import starsoft.util.ConexionBD;

public class CentroInformacionDAO extends BaseDAO {

	public Boolean validateExistUsuario(int id) throws DAOExcepcion {
		CentroFormacion vo = new CentroFormacion();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Boolean res = false;
		try {
			String query = "select * from usuario a where a.id_Centro_Informacion=?";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				res = true;
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return res;
	}
	
	
	public Boolean validateExistNombre(String ds) throws DAOExcepcion {
		CentroFormacion vo = new CentroFormacion();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Boolean res = false;
		try {
			String query = "select nombre_Centro_Informacion from centro_informacion where nombre_Centro_Informacion=?";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, ds);
			rs = stmt.executeQuery();
			if (rs.next()) {
				res = true;
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return res;
	}

	public Boolean validateExistURL(String ds) throws DAOExcepcion {
		CentroFormacion vo = new CentroFormacion();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Boolean res = false;
		try {
			String query = "select url_Centro_Informacion from centro_informacion where url_Centro_Informacion=?";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, ds);
			rs = stmt.executeQuery();
			if (rs.next()) {
				res = true;
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return res;
	}

	public Collection<CentroFormacion> obtener(String Nombre)
			throws DAOExcepcion {
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
				vo.setNom_CentroFormacion(rs
						.getString("nombre_Centro_Informacion"));
				vo.setId_TipoCentroFormacion(rs.getInt("id_Tipo_Centro"));
				vo.setDs_TipoCentroFormacion(rs
						.getString("descripcion_Parametro"));
				vo.setUrl_CentroFormacion(rs
						.getString("url_Centro_Informacion"));
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

	
	public int obtenerUltimoCodigo() throws DAOExcepcion {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int id = 0;
		try {
			String query = "select max(a.id_Centro_Informacion) as id_Centro_Informacion from centro_informacion a";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
	
			rs = stmt.executeQuery();
			if (rs.next()) {
				id=rs.getInt("id_Centro_Informacion");
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return id;
	}

	
	
	public int insertar(CentroFormacion vo) throws DAOExcepcion {
		String query = "CALL SP_InsertarCentroInformacion(?,?,?,?);";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
	
		int idCentroFormacion= 0;
		
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setString(1, vo.getNom_CentroFormacion());
			stmt.setInt(2, vo.getId_TipoCentroFormacion());
			stmt.setString(3, vo.getUrl_CentroFormacion());
			stmt.setDouble(4, vo.getSs_Pago());
			
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
		return idCentroFormacion;
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
			stmt.setString(1, vo.getNom_CentroFormacion());
			stmt.setInt(2, vo.getId_TipoCentroFormacion());
			stmt.setString(3, vo.getUrl_CentroFormacion());
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

	public CentroFormacion obtener(int id) throws DAOExcepcion {

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
				vo.setNom_CentroFormacion(rs
						.getString("nombre_Centro_Informacion"));
				vo.setId_TipoCentroFormacion(rs.getInt("id_Tipo_Centro"));
				vo.setDs_TipoCentroFormacion(rs
						.getString("descripcion_Parametro"));
				vo.setUrl_CentroFormacion(rs
						.getString("url_Centro_Informacion"));
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
