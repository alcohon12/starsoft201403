package starsoft.negocio;

import java.util.Collection;

import starsoft.dao.MensajeDAO;
import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Mensaje;

public class GestionMensaje {
	public Collection<Mensaje> obtener(int idTabla)
			throws DAOExcepcion, LoginExcepcion {
		MensajeDAO dao = new MensajeDAO();
		return dao.obtener(idTabla);
	}

	public Collection<Mensaje> Listar()
			throws DAOExcepcion, LoginExcepcion {
			MensajeDAO dao = new MensajeDAO();
			return dao.listar();
		}
	
	public int Registrar(Mensaje obj)
			throws DAOExcepcion {
			MensajeDAO dao = new MensajeDAO();
			return dao.RegistrarMensaje(obj);
		}
}
