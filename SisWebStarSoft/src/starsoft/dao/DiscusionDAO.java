package starsoft.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Discusion;
import starsoft.modelo.Idea;
import starsoft.util.ConexionBD;

public class DiscusionDAO extends BaseDAO {
	public Collection<Discusion> listarDiscusion(int id_Idea)
			throws DAOExcepcion, LoginExcepcion {
		Collection<Discusion> lst = new ArrayList<Discusion>();
		Connection con = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "CALL SP_ListarDiscusion(?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, id_Idea);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Discusion vo = new Discusion();
				vo.setId_Discusion(rs.getInt("id_Discucion"));
				vo.setComentario(rs.getString("comentario"));
				vo.setId_DiscusionPadre(rs.getInt("id_DiscucionPadre"));
				vo.setFecha_creacion(rs.getDate("fecha_creacion"));
				vo.setUsuario_Comentario(rs.getString("nombre_Usuario"));
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
	
	public int InsertarComentario(Discusion ds)
			throws DAOExcepcion, LoginExcepcion {
		Connection con = null;
		CallableStatement stmt = null;
		try {
			String query = "CALL SP_InsertarDiscusion(?,?,?,?);";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
			stmt.setInt(1, ds.getId_Idea());
			stmt.setInt(2, ds.getId_Usuario());
			stmt.setString(3, ds.getComentario());
			stmt.setInt(4, ds.getId_DiscusionPadre());
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
