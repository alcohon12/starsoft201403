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
import starsoft.util.ConexionBD;


public class CentroPorCobranzasDAO extends BaseDAO  {
	public Collection<CentroFormacion> obtener(String id_CentroFormacion, String nom_CentroFormacion, String ds_TipoCentroFormacion, String Ss_Pago)
			throws DAOExcepcion, LoginExcepcion {
		Collection<CentroFormacion> lst = new ArrayList<CentroFormacion>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_ListarCentroPorCobranza(?,?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				CentroFormacion vo = new CentroFormacion();
				vo.setId_CentroFormacion(rs.getInt("id_CentroFormacion"));
				vo.setDs_TipoCentroFormacion(rs.getString("nom_CentroFormacion"));
				vo.setDs_TipoCentroFormacion(rs.getString("ds_TipoCentroFormacion"));
				vo.setSs_Pago(rs.getDouble("ss_Pago"));
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
