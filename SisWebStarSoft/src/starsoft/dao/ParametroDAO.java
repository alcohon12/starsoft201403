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
import starsoft.modelo.Parametro;
import starsoft.util.ConexionBD;

public class ParametroDAO extends BaseDAO {

	public Collection<Parametro> listar()
			throws DAOExcepcion, LoginExcepcion {
		Collection<Parametro> lst = new ArrayList<Parametro>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "SELECT id_Parametro, descripcion_Parametro, id_Tabla, nombre_Tabla, "
					+ "fecha_Creacion, fecha_Modificacion FROM parametro WHERE 1;";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Parametro vo = new Parametro();
				vo.setId_Parametro(rs.getInt("id_Parametro"));
				vo.setDescripcion_Parametro(rs.getString("descripcion_Parametro"));
				vo.setId_Tabla(rs.getInt("id_Tabla"));
				vo.setNombre_Tabla(rs.getString("nombre_Tabla"));
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
	
	
	public Collection<Parametro> obtenerMnt(int idtabla)
			throws DAOExcepcion, LoginExcepcion {
		Collection<Parametro> lst = new ArrayList<Parametro>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_Parametros(?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, idtabla);
			
			rs = stmt.executeQuery();
			while (rs.next()) {
				Parametro vo = new Parametro();
				vo.setId_Parametro(rs.getInt("id_Parametro"));
				vo.setDescripcion_Parametro(rs.getString("descripcion_Parametro"));
				vo.setNombre_Tabla(rs.getString("nombre_Tabla"));
									
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
	
	public Boolean insertar(Parametro vo) throws DAOExcepcion {
		String query = "CALL SP_InsertarParametro(?,?,?);";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
		Boolean result = false;
		
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setString(1, vo.getDescripcion_Parametro() );
			stmt.setInt(2, vo.getId_Tabla());
			stmt.setString(3, vo.getNombre_Tabla());
	
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
	
	public Collection<Parametro> obtener(int idTabla)
			throws DAOExcepcion, LoginExcepcion {
		Collection<Parametro> lst = new ArrayList<Parametro>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_ListarParametro(?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, idTabla);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Parametro vo = new Parametro();
				vo.setId_Parametro(rs.getInt("id_Parametro"));
				vo.setDescripcion_Parametro(rs.getString("descripcion_Parametro"));
				
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
