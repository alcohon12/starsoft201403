package starsoft.negocio;

import java.util.Collection;

import starsoft.dao.PermisoDAO;
import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Permiso;

public class GestionPermiso {
	public Collection<Permiso> listarPermiso(int id_Usuario)
			throws DAOExcepcion, LoginExcepcion {
		PermisoDAO dao = new PermisoDAO();
		return dao.listarPermiso(id_Usuario);
	}
	public int ActualizarVotacionPermiso(Permiso obj)
			throws DAOExcepcion, LoginExcepcion {
		PermisoDAO dao = new PermisoDAO();
		return dao.ActualizarVotacionPermiso(obj);
	}
	public Boolean insertar(String id_Usuario, int id_Idea)
			throws DAOExcepcion, LoginExcepcion {
		PermisoDAO dao = new PermisoDAO();
		return dao.insertar(Integer.parseInt(id_Usuario), id_Idea);
	}
	public int quitarTodo(int id_Idea)
			throws DAOExcepcion, LoginExcepcion {
		PermisoDAO dao = new PermisoDAO();
		return dao.quitarTodo(id_Idea);
	}
	public Collection<Permiso> listarPermisoPorIdea(int id_Idea)
			throws DAOExcepcion, LoginExcepcion {
		PermisoDAO dao = new PermisoDAO();
		return dao.listarPermisoPorIdea(id_Idea);
	}
}
