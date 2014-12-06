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
import starsoft.modelo.Discusion;
import starsoft.modelo.Permiso;
import starsoft.modelo.Usuario;
import starsoft.negocio.GestionDiscusion;
import starsoft.negocio.GestionPermiso;

/**
 * Servlet implementation class ListarDiscusionServlet
 */
@WebServlet("/ListarDiscusionServlet")
public class ListarDiscusionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListarDiscusionServlet() {
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
		int Id_IdeaParam = Integer.parseInt(request.getParameter("txtIdea"));
		
		Collection<Discusion> lst = new ArrayList<Discusion>();		
		GestionDiscusion negocio = new GestionDiscusion();
		try {
			lst = negocio.listarDiscusion(Id_IdeaParam);
		} catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE_CONFIRMACION", 0);
		} catch (LoginExcepcion e) {			
			request.setAttribute("MENSAJE_CONFIRMACION", 0);
		}		
		
		request.setAttribute("LISTADO_DISCUSION", lst);
		RequestDispatcher rd = request.getRequestDispatcher("DiscusionIdea.jsp");
		rd.forward(request, response);
	}

}
