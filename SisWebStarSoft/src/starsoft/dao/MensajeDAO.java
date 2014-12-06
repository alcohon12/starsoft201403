package starsoft.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Mensaje;
import starsoft.util.ConexionBD;

	public class MensajeDAO extends BaseDAO {
		
		public Collection<Mensaje> listar()
				throws DAOExcepcion, LoginExcepcion {
			Collection<Mensaje> lst = new ArrayList<Mensaje>();
			Connection con = null;
			CallableStatement stmt = null;
			ResultSet rs = null;
			try {
				String query = "SELECT idMensaje, mensaje, id_Estado_Mensaje, fecha_Expiracion, "
						+ "fecha_Creacion, Usuario_id_Usuario FROM mensaje WHERE 1;";
				con = ConexionBD.obtenerConexion();
				stmt = con.prepareCall(query);
				rs = stmt.executeQuery();
				while (rs.next()) {
					Mensaje vo = new Mensaje();
					vo.setIdMensaje(rs.getInt("idMensaje"));
					vo.setDsMensaje(rs.getString("dsMensaje"));
					vo.setIdEstado(rs.getInt("idEstado"));
					vo.setdsEstado(rs.getString("dsEstado"));
					vo.setFeExpiracion(rs.getDate("fecha_Expiracion"));
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
		
		public int RegistrarMensaje(Mensaje obj)
				throws DAOExcepcion {

			int Res = 0;
			Connection con = null;
			CallableStatement stmt = null;
			ResultSet rs = null;
			try {
				String query = "call sp_RegistroMensaje(?, ?, ?)";
				con = ConexionBD.obtenerConexion();
				stmt = con.prepareCall(query);
				stmt.setString(1, obj.getDsMensaje());
				stmt.setInt(2, obj.getIdEstado());
				stmt.setString(3, obj.getFecha_ExpiracionString());
				Res = stmt.executeUpdate();
			} catch (SQLException e) {
				System.err.println(e.getMessage());
				throw new DAOExcepcion(e.getMessage());
			} finally {
				this.cerrarResultSet(rs);
				this.cerrarStatement(stmt);
				this.cerrarConexion(con);
			}
			return Res;
		}

		public Collection<Mensaje> obtener(int idTabla)
				throws DAOExcepcion, LoginExcepcion {
			Collection<Mensaje> lst = new ArrayList<Mensaje>();
			Connection con = null;
			CallableStatement stmt = null;
			ResultSet rs = null;
			try {
				String query = "CALL SP_ListarMensaje(?);";
				con = ConexionBD.obtenerConexion();
				stmt = con.prepareCall(query);
				stmt.setInt(1, idTabla);
				rs = stmt.executeQuery();
				while (rs.next()) {
					Mensaje vo = new Mensaje();
					vo.setIdMensaje(rs.getInt("idMensaje"));
					vo.setDsMensaje(rs.getString("dsMensaje"));
					
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
