package starsoft.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
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
}
