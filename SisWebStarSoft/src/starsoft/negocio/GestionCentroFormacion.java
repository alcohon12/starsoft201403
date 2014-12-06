package starsoft.negocio;

import java.util.Collection;
import starsoft.dao.CentroInformacionDAO;
import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.CentroFormacion;
import starsoft.modelo.Respuesta;

import starsoft.dao.CentroPorCobranzasDAO;

public class GestionCentroFormacion {



	public Collection<CentroFormacion> Listar(String nombre)
			throws DAOExcepcion {
		CentroInformacionDAO dao = new CentroInformacionDAO();
		return dao.obtener(nombre);
	}

	public Respuesta validateData(CentroFormacion vo) throws DAOExcepcion {
		Respuesta beRespuesta = new Respuesta();
		CentroInformacionDAO dao = new CentroInformacionDAO();

		if (dao.validateExistNombre(vo.getNom_CentroFormacion())) {
			beRespuesta.setExisteError(true);
			beRespuesta
					.setMensajeError("Existe otro centro de formacion registrado con el mismo nombre.");

		} else if (dao.validateExistURL(vo.getUrl_CentroFormacion())) {
			beRespuesta.setExisteError(true);
			beRespuesta
					.setMensajeError("Existe otro centro de formacion registrado con el mismo URL.");

		}
		return beRespuesta;
	}

	public Respuesta validateEliminar(int id) throws DAOExcepcion {
		Respuesta beRespuesta = new Respuesta();
		CentroInformacionDAO dao = new CentroInformacionDAO();
		if (dao.validateExistUsuario(id)) {
			beRespuesta.setExisteError(true);
			beRespuesta
					.setMensajeError("Exiten usuarios asociados a este centro de formacion");

		}
		return beRespuesta;
	}

	public Respuesta insertar(CentroFormacion vo) throws DAOExcepcion {

		Respuesta beRespuesta = new Respuesta();

		try {
			beRespuesta = validateData(vo);
			if (!beRespuesta.getExisteError()) {
				CentroInformacionDAO dao = new CentroInformacionDAO();
				dao.insertar(vo);
				beRespuesta.setData(dao.obtenerUltimoCodigo());
				beRespuesta.setExisteError(false);
				beRespuesta.setMensajeError("Se registro correctamente.");
			}

		} catch (DAOExcepcion e) {
			beRespuesta.setExisteError(true);
			beRespuesta
					.setMensajeError("No se pudo insertar los datos. Contáctese con sistemas");
		}

		return beRespuesta;
	}

	public Respuesta actualizar(CentroFormacion vo) throws DAOExcepcion {
		Respuesta beRespuesta = new Respuesta();

		try {
		
				CentroInformacionDAO dao = new CentroInformacionDAO();
				dao.actualizar(vo);
				beRespuesta.setData(vo.getId_CentroFormacion());
				beRespuesta.setExisteError(false);
				beRespuesta.setMensajeError("Se modifico correctamente el registro.");


		} catch (DAOExcepcion e) {
			beRespuesta.setExisteError(true);
			beRespuesta
					.setMensajeError("No se pudo insertar los datos. Contáctese con sistemas");
		}

		return beRespuesta;

	}

	public CentroFormacion obtener(int id) throws DAOExcepcion {
		CentroInformacionDAO dao = new CentroInformacionDAO();
		return dao.obtener(id);
	}

	public Respuesta eliminar(int id) throws DAOExcepcion {
		Respuesta beRespuesta = new Respuesta();

		try {
			beRespuesta = validateEliminar(id);
			if (!beRespuesta.getExisteError()) {
				CentroInformacionDAO dao = new CentroInformacionDAO();
				dao.eliminar(id);

				beRespuesta.setExisteError(false);
				beRespuesta.setMensajeError("Se elimino correctamente.");
			}

		} catch (DAOExcepcion e) {
			beRespuesta.setExisteError(true);
			beRespuesta
					.setMensajeError("No se pudo insertar los datos. Contáctese con sistemas");
		}

		return beRespuesta;

	}
}
