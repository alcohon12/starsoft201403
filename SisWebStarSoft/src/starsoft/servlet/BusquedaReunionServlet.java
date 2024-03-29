package starsoft.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Reunion;
import starsoft.negocio.GestionReunion;

/**
 * Servlet implementation class BusquedaReunionServlet
 */
@WebServlet("/BusquedaReunionServlet")
public class BusquedaReunionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusquedaReunionServlet() {
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
		String FechaIni = request.getParameter("txtFechaIni");
		String FechaFin = request.getParameter("txtFechaFin");
		Date dFechaIni = new Date();
		Date dFechaFin = new Date();
		
		Collection<Reunion> lst = new ArrayList<Reunion>();
		
		GestionReunion negocio = new GestionReunion();
		
		try
		{
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			dFechaIni = df.parse(FechaIni);
			dFechaFin = df.parse(FechaFin);
			
			lst = negocio.obtener(dFechaIni, dFechaFin);
		}
		catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE", "Hubo un error al procesar la operación: " + e.getMessage());	
		} catch (LoginExcepcion e) {			
			request.setAttribute("MENSAJE", e.getMessage());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("LISTADO_REUNIONES", lst);
		RequestDispatcher rd = request.getRequestDispatcher("ReunionBuscar.jsp");
		rd.forward(request, response);
	}

}
