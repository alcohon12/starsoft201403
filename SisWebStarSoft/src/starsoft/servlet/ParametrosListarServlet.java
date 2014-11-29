package starsoft.servlet;

import java.io.IOException;
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









import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.CentroFormacion;
import starsoft.modelo.Parametro;
import starsoft.modelo.Reunion;
import starsoft.negocio.GestionCentroFormacion;
import starsoft.negocio.GestionParametro;
/**
 * Servlet implementation class ParametrosListarServlet
 */
@WebServlet("/ParametrosListarServlet")
public class ParametrosListarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParametrosListarServlet() {
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
	 * @see HttpServlet#doPost(HttpServxletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		Collection<Parametro> lst = new ArrayList<Parametro>();

		GestionParametro negocio = new GestionParametro();

		try
		{
			lst = negocio.Listar();
		}
		catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE", "Hubo un error al procesar la operación: " + e.getMessage());	
		} catch (LoginExcepcion e) {			
			request.setAttribute("MENSAJE", e.getMessage());
		} 
		
		
		request.setAttribute("LISTADO", lst);
		RequestDispatcher rd = request.getRequestDispatcher("ParametrosListar.jsp");
		rd.forward(request, response);
		
		
	}

}
