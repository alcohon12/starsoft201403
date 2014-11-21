package starsoft.negocio;

import starsoft.dao.UsuarioDAO;
import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Usuario;

public class GestionUsuario {
	public Usuario validarUsuario(String correo, String contrasena)
			throws DAOExcepcion, LoginExcepcion {
		UsuarioDAO dao = new UsuarioDAO();
		return dao.validar(correo, contrasena);
	}
}
