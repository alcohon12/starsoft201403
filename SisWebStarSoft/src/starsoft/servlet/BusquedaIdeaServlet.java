package starsoft.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;

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
import starsoft.modelo.Reunion;
import starsoft.modelo.Usuario;
import starsoft.negocio.GestionIdea;
import starsoft.negocio.GestionUsuario;

/**
 * Servlet implementation class BusquedaIdeaServlet
 */
@WebServlet("/BusquedaIdeaServlet")
public class BusquedaIdeaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusquedaIdeaServlet() {
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
		
		String tipofiltro = request.getParameter("rbtfiltro");
		String filtro = request.getParameter("txtfiltro").toUpperCase();
		Collection<Idea> lst = new ArrayList<Idea>();		

		GestionIdea negocio = new GestionIdea();

		try {
			lst = negocio.listarIdea();
		} catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE", "Hubo un error al procesar la operación: " + e.getMessage());	
		} catch (LoginExcepcion e) {			
			request.setAttribute("MENSAJE", "Usuario y/o clave incorrectos");
		}
		
		
		ArrayList<Idea> lstfiltro = new ArrayList<Idea>();
		for(Idea item : lst)
		{
			switch (tipofiltro) {
			case "rbttodas":
				if(item.getTitulo_Idea().toUpperCase().contains(filtro) || item.getDescripcion_Idea().toUpperCase().contains(filtro) || item.getPalabraClave1().toUpperCase().contains(filtro) || item.getPalabraClave2().toUpperCase().contains(filtro) || item.getPalabraClave3().toUpperCase().contains(filtro) || item.getPalabraClave4().toUpperCase().contains(filtro))
					lstfiltro.add(item);
				break;
			case "rbtpublicadas":
				if((item.getTitulo_Idea().toUpperCase().contains(filtro) || item.getDescripcion_Idea().toUpperCase().contains(filtro) || item.getPalabraClave1().toUpperCase().contains(filtro) || item.getPalabraClave2().toUpperCase().contains(filtro) || item.getPalabraClave3().toUpperCase().contains(filtro) || item.getPalabraClave4().toUpperCase().contains(filtro)) && item.getEstado_Idea().toUpperCase().equals("PUBLICADA"))
					lstfiltro.add(item);
				break;
			case "rbtaprobadas":
				if((item.getTitulo_Idea().toUpperCase().contains(filtro) || item.getDescripcion_Idea().toUpperCase().contains(filtro) || item.getPalabraClave1().toUpperCase().contains(filtro) || item.getPalabraClave2().toUpperCase().contains(filtro) || item.getPalabraClave3().toUpperCase().contains(filtro) || item.getPalabraClave4().toUpperCase().contains(filtro)) && item.getEstado_Idea().toUpperCase().equals("APROBADA"))
					lstfiltro.add(item);
				break;
			case "rbtrechazadas":
				if((item.getTitulo_Idea().toUpperCase().contains(filtro) || item.getDescripcion_Idea().toUpperCase().contains(filtro) || item.getPalabraClave1().toUpperCase().contains(filtro) || item.getPalabraClave2().toUpperCase().contains(filtro) || item.getPalabraClave3().toUpperCase().contains(filtro) || item.getPalabraClave4().toUpperCase().contains(filtro)) && item.getEstado_Idea().toUpperCase().equals("RECHAZADA"))
					lstfiltro.add(item);
				break;
			default:
				
				break;
			}
		}
		
		request.setAttribute("LISTADO_IDEAS", lstfiltro);
		RequestDispatcher rd = request.getRequestDispatcher("IdeaBuscar.jsp");
		rd.forward(request, response);
	}

}
