package starsoft.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Idea;
import starsoft.modelo.Permiso;
import starsoft.modelo.Usuario;
import starsoft.negocio.GestionIdea;
import starsoft.negocio.GestionPermiso;

/**
 * Servlet implementation class BusquedaIdeaDiscusionServlet
 */
@WebServlet("/BusquedaIdeaDiscusionServlet")
public class BusquedaIdeaDiscusionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusquedaIdeaDiscusionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		HttpSession session = request.getSession();
		Usuario vo = (Usuario)session.getAttribute("USUARIO_ACTUAL");
		
		Collection<Permiso> lst = new ArrayList<Permiso>();		
		GestionPermiso negocio = new GestionPermiso();
		try {
			lst = negocio.listarPermiso(vo.getId_Usuario());
		} catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE", "Hubo un error al procesar la operación: " + e.getMessage());	
		} catch (LoginExcepcion e) {			
			request.setAttribute("MENSAJE", "Usuario y/o clave incorrectos");
		}		
		
		request.setAttribute("LISTADO_IDEAS_DISCUSION", lst);
		RequestDispatcher rd = request.getRequestDispatcher("InvitacionIdea.jsp");
		rd.forward(request, response);
		
	}

}
