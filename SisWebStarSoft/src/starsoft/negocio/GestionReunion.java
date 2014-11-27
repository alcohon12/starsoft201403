package starsoft.negocio;

import java.util.Collection;

import starsoft.dao.ReunionDAO;
import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Reunion;

public class GestionReunion {
	public Collection<Reunion> obtener(String FechaDesde, String FechaHasta)
			throws DAOExcepcion, LoginExcepcion {
		ReunionDAO dao = new ReunionDAO();
		return dao.obtener(FechaDesde, FechaHasta);
	}
	
	public Reunion insertar(Reunion vo)
			throws DAOExcepcion {
		ReunionDAO dao = new ReunionDAO();
		return dao.insertar(vo);
	}
}
