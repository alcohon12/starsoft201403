package starsoft.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Parametro;
import starsoft.util.ConexionBD;

public class ParametroDAO extends BaseDAO {
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
