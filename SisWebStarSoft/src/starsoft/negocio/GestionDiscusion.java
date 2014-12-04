package starsoft.negocio;

import java.util.Collection;

import starsoft.dao.DiscusionDAO;
import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Discusion;

public class GestionDiscusion {
	public Collection<Discusion> listarDiscusion(int id_Idea)
			throws DAOExcepcion, LoginExcepcion {
		DiscusionDAO dao = new DiscusionDAO();
		return dao.listarDiscusion(id_Idea);
	}
	
	
	public int InsertarVotacionDiscusion(Discusion ds)
			throws DAOExcepcion, LoginExcepcion {
		DiscusionDAO dao = new DiscusionDAO();
		return dao.InsertarComentario(ds);
	}
}
