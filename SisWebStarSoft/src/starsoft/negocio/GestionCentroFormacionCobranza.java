package starsoft.negocio;

import java.util.Collection;

import starsoft.dao.CentroInformacionDAO;
import starsoft.dao.CentroPorCobranzasDAO;
import starsoft.excepcion.DAOExcepcion;
import starsoft.modelo.CentroFormacionCobranza;;

public class GestionCentroFormacionCobranza {
	public Collection<CentroFormacionCobranza> obetner(int Mes)
			throws DAOExcepcion {
		CentroPorCobranzasDAO dao = new CentroPorCobranzasDAO();
		return dao.obtener(Mes);
	}
}
