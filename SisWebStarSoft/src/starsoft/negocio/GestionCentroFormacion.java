package starsoft.negocio;
import java.util.Collection;

import starsoft.dao.IdeaDAO;
import starsoft.dao.ReunionDAO;
import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.CentroFormacion;
import starsoft.modelo.Idea;
import starsoft.dao.CentroPorCobranzasDAO;


public class GestionCentroFormacion {
	
	
	public Collection<CentroFormacion> obtener(String id_CentroFormacion, String nom_CentroFormacion, String ds_TipoCentroFormacion, String Ss_Pago)
		throws DAOExcepcion, LoginExcepcion {
		CentroPorCobranzasDAO dao = new CentroPorCobranzasDAO();
		return dao.obtener(id_CentroFormacion, nom_CentroFormacion, ds_TipoCentroFormacion, Ss_Pago);
	}
	

}
