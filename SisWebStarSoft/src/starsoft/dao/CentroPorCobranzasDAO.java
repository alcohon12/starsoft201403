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
import starsoft.modelo.CentroFormacionCobranza;
import starsoft.util.ConexionBD;


public class CentroPorCobranzasDAO extends BaseDAO  {
	public Collection<CentroFormacionCobranza> obtener(int Mes)
			throws DAOExcepcion {
		Collection<CentroFormacionCobranza> lst = new ArrayList<CentroFormacionCobranza>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_CentroFormacion_Pagos(?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, Mes);

			rs = stmt.executeQuery();
			while (rs.next()) {
				CentroFormacionCobranza vo = new CentroFormacionCobranza();
				vo.setCentro_formacion(rs.getString("nombre"));
				vo.setTipo(rs.getString("Tipo"));
				vo.setMonto(rs.getDouble("monto_pago"));
				vo.setNro_Ideas(rs.getInt("cantidad"));
				vo.setPago(rs.getDouble("Pago"));
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
