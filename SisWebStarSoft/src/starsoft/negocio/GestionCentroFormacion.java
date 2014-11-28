package starsoft.negocio;
import java.util.Collection;
import starsoft.dao.CentroInformacionDAO;
import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.CentroFormacion;


import starsoft.dao.CentroPorCobranzasDAO;


public class GestionCentroFormacion {
	
	
	public Collection<CentroFormacion> obtener(String id_CentroFormacion, String nom_CentroFormacion, String ds_TipoCentroFormacion, String Ss_Pago)
		throws DAOExcepcion, LoginExcepcion {
		CentroPorCobranzasDAO dao = new CentroPorCobranzasDAO();
		return dao.obtener(id_CentroFormacion, nom_CentroFormacion, ds_TipoCentroFormacion, Ss_Pago);
	}
	
	public Collection<CentroFormacion> Listar(String nombre)
			throws DAOExcepcion, LoginExcepcion {
		CentroInformacionDAO dao = new CentroInformacionDAO();
			return dao.obtener(nombre);
		}
	
	public Boolean insertar(CentroFormacion vo)
			throws DAOExcepcion {
		CentroInformacionDAO dao = new CentroInformacionDAO();
		return dao.insertar(vo);
	}
	
	public Boolean actualizar(CentroFormacion vo)
			throws DAOExcepcion {
		CentroInformacionDAO dao = new CentroInformacionDAO();
		return dao.actualizar(vo);
	}
	
	public CentroFormacion obtener(int id)
			throws DAOExcepcion, LoginExcepcion {
		CentroInformacionDAO dao = new CentroInformacionDAO();
		return dao.obtener(id);
	}
	
	public Boolean eliminar(int id)
			throws DAOExcepcion {
		CentroInformacionDAO dao = new CentroInformacionDAO();
		return dao.eliminar(id);
	}
}
