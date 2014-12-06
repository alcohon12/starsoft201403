package starsoft.negocio;

import java.util.Collection;
import java.util.Date;

import starsoft.dao.IdeaReporteDAO;
import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Idea;

public class GestionIdeaReporte {
	
	
	public Collection<Idea> obtener(Date FechaDesde,Date FechaHasta,String idEstado,String titulo,String descripcion )
			throws DAOExcepcion, LoginExcepcion {
		IdeaReporteDAO dao = new IdeaReporteDAO();
		return dao.obtener(FechaDesde,FechaHasta,idEstado,titulo,descripcion);
	}

}
