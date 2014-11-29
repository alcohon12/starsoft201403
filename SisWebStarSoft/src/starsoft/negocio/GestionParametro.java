package starsoft.negocio;

import java.util.Collection;

import starsoft.dao.CentroInformacionDAO;
import starsoft.dao.ParametroDAO;
import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Parametro;

public class GestionParametro {
	public Collection<Parametro> obtener(int idTabla)
			throws DAOExcepcion, LoginExcepcion {
		ParametroDAO dao = new ParametroDAO();
		return dao.obtener(idTabla);
	}

	public Collection<Parametro> Listar()
			throws DAOExcepcion, LoginExcepcion {
			ParametroDAO dao = new ParametroDAO();
			return dao.listar();
		}
	
}
