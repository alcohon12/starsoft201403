package starsoft.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import starsoft.excepcion.DAOExcepcion;
import starsoft.negocio.GestionCentroFormacion;


/**
 * Servlet implementation class EliminarCentroFormacionServlet
 */
@WebServlet("/EliminarCentroFormacionServlet")
public class EliminarCentroFormacionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarCentroFormacionServlet() {
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
		// int idReunion = Integer.parseInt(request.getParameter("txtIdReunion"));
		int id_Centro_Informacion = Integer.parseInt(request.getParameter("txtIdCentro"));
		GestionCentroFormacion negocio = new GestionCentroFormacion();
		
		try
		{
			negocio.eliminar(id_Centro_Informacion);
		}
		catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE", "Hubo un error al procesar la operación: " + e.getMessage());
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("PageH06.jsp");
		rd.forward(request, response);
	}

}
