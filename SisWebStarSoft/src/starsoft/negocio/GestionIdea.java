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

	public Boolean insertar(Idea vo)
			throws DAOExcepcion {
		IdeaDAO dao = new IdeaDAO();
		return dao.insertar(vo);
	}
	
	public Boolean actualizar(Idea vo)
			throws DAOExcepcion {
		IdeaDAO dao = new IdeaDAO();
		return dao.actualizar(vo);
	}
	
	public Idea obtener(int idIdea)
			throws DAOExcepcion, LoginExcepcion {
		IdeaDAO dao = new IdeaDAO();
		return dao.obtener(idIdea);
	}
	
	public Boolean eliminar(int idIdea)
			throws DAOExcepcion {
		IdeaDAO dao = new IdeaDAO();
		return dao.eliminar(idIdea);
	}
}
