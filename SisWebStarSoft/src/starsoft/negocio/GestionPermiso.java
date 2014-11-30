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
}
