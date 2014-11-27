package starsoft.negocio;

import java.util.Collection;

import starsoft.dao.IdeaDAO;
import starsoft.dao.UsuarioDAO;
import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Idea;

public class GestionIdea {
	public Collection<Idea> listarIdea()
			throws DAOExcepcion, LoginExcepcion {
		IdeaDAO dao = new IdeaDAO();
		return dao.listarIdea();
	}
}
