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
import starsoft.util.ConexionBD;

public class IdeaDAO extends BaseDAO {
	public Collection<Idea> listarIdea()
			throws DAOExcepcion, LoginExcepcion {
		Collection<Idea> lst = new ArrayList<Idea>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_ListarIdea();";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
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
				vo.setExtensionArchivoIdea(rs.getString("extensionArchivo_Idea"));
				vo.setEstado_Idea(rs.getString("descripcion_Parametro"));
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
}
