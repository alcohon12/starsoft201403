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

public class ParametrosDAO extends BaseDAO  {

	
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
	
}
