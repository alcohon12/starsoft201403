package starsoft.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import starsoft.excepcion.DAOExcepcion;

import starsoft.modelo.Idea;
import starsoft.modelo.Usuario;
import starsoft.util.ConexionBD;

public class IdeaAprobarDAO  extends BaseDAO {
	
	
	public Boolean validateAsesor(int id_Alumno,int id_Asesor ) throws DAOExcepcion {
		Idea vo = new Idea();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Boolean res = false;
		try {
			String query = "select * from idea a where a.id_Alumno=? and a.id_Asesor=?;";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setInt(1, id_Alumno);
			stmt.setInt(2, id_Asesor);
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
	
	public Idea obtener(int id) throws DAOExcepcion {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Idea vo = new Idea();
		try {
			String query = "select a.titulo_Idea,a.descripcion_Idea,b.nombre_Usuario,b.id_Usuario   " ;
			query = query + " from idea a ,usuario b where a.id_Idea=? and a.id_Alumno=b.id_Usuario; ";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			
			while (rs.next()) {

				vo.setTitulo_Idea(rs.getString("titulo_Idea"));
				vo.setDescripcion_Idea(rs.getString("descripcion_Idea"));
				
				Usuario usu=new Usuario();
				usu.setNombre_Tipo_Usuario(rs.getString("nombre_Usuario"));
				usu.setId_Usuario(rs.getInt("id_Usuario"));
				vo.setAlumno(usu);
			

			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return vo;

	}
	
	
	public Boolean actualizar(Idea vo) throws DAOExcepcion {
		String query = "CALL SP_AprobarIdea(?,?,?;";
		System.err.println(query);
		Connection con = null;
		CallableStatement stmt = null;
		Boolean result = false;

		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareCall(query);
	
			stmt.setInt(1, vo.getId_Idea());
			stmt.setInt(1, vo.getId_Asesor());
			stmt.setInt(1, vo.getId_Estado());

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
