package starsoft.negocio;

import java.util.Collection;
import java.util.Date;

import starsoft.dao.ReunionDAO;
import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Reunion;

public class GestionReunion {
	public Collection<Reunion> obtener(Date FechaDesde, Date FechaHasta)
			throws DAOExcepcion, LoginExcepcion {
		ReunionDAO dao = new ReunionDAO();
		return dao.obtener(FechaDesde, FechaHasta);
	}
	
	public Boolean insertar(Reunion vo)
			throws DAOExcepcion {
		ReunionDAO dao = new ReunionDAO();
		return dao.insertar(vo);
	}
	
	public Boolean actualizar(Reunion vo)
			throws DAOExcepcion {
		ReunionDAO dao = new ReunionDAO();
		return dao.actualizar(vo);
	}
	
	public Reunion obtener(int idReunion)
			throws DAOExcepcion, LoginExcepcion {
		ReunionDAO dao = new ReunionDAO();
		return dao.obtener(idReunion);
	}
	
	public Boolean eliminar(int idReunion)
			throws DAOExcepcion {
		ReunionDAO dao = new ReunionDAO();
		return dao.eliminar(idReunion);
	}
}
