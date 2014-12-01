package starsoft.negocio;

import java.util.Collection;

import starsoft.dao.UsuarioDAO;
import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Usuario;

public class GestionUsuario {
	public Usuario validar(String correo, String contrasena)
			throws DAOExcepcion, LoginExcepcion {
		UsuarioDAO dao = new UsuarioDAO();
		return dao.validar(correo, contrasena);
	}
	
	public Collection<Usuario> obtener(int campo, String filtro)
			throws DAOExcepcion, LoginExcepcion {
		UsuarioDAO dao = new UsuarioDAO();
		return dao.obtener(campo, filtro);
	}
	
	public Usuario obtener(int idUsuario)
			throws DAOExcepcion, LoginExcepcion {
		UsuarioDAO dao = new UsuarioDAO();
		return dao.obtener(idUsuario);
	}
}
