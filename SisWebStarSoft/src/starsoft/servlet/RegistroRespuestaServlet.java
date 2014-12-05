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
import starsoft.modelo.Usuario;
import starsoft.negocio.GestionDiscusion;

/**
 * Servlet implementation class RegistroRespuestaServlet
 */
@WebServlet("/RegistroRespuestaServlet")
public class RegistroRespuestaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroRespuestaServlet() {
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
		String ComentarioParam = request.getParameter("txtRespuesta");
		String Padre = request.getParameter("txtPadre");
		HttpSession session = request.getSession(true);
		Usuario user = (Usuario)session.getAttribute("USUARIO_ACTUAL");
		
		Collection<Discusion> lst = new ArrayList<Discusion>();		
		GestionDiscusion negocio = new GestionDiscusion();
		Discusion ds = new Discusion();
		try {
			ds.setId_Idea(Id_IdeaParam);
			ds.setId_Usuario(user.getId_Usuario());
			ds.setComentario(ComentarioParam);
			ds.setId_DiscusionPadre(Integer.parseInt(Padre));
			negocio.InsertarVotacionDiscusion(ds);
		} catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE", "Hubo un error al procesar la operación: " + e.getMessage());	
		} catch (LoginExcepcion e) {			
			request.setAttribute("MENSAJE", "Usuario y/o clave incorrectos");
		}		
		
		request.setAttribute("LISTADO_DISCUSION", lst);
		RequestDispatcher rd = request.getRequestDispatcher("DiscusionIdea.jsp?CodigoIdea=" + Id_IdeaParam);
		rd.forward(request, response);
	}

}
