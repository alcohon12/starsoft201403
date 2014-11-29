

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

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Idea;
import starsoft.modelo.Parametro;
import starsoft.modelo.Reunion;
import starsoft.modelo.Usuario;
import starsoft.negocio.GestionIdea;
import starsoft.negocio.GestionParametro;

/**
 * Servlet implementation class ListarIdeasServlet
 */
@WebServlet("/ListarIdeasServlet")
public class ListarIdeasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListarIdeasServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int campo = Integer.parseInt(request.getParameter("ddlCampo"));
		String filtro = request.getParameter("txtFiltro");
		int status = Integer.parseInt(request.getParameter("status"));

		String FechaIni = request.getParameter("txtFechaIni");
		String FechaFin = request.getParameter("txtFechaFin");

		Collection<Idea> lst = new ArrayList<Idea>();

		GestionIdea negocio = new GestionIdea();

		try
		{
			lst = negocio.listarIdea(FechaIni, FechaFin, status, filtro);
		}
		catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE", "Hubo un error al procesar la operación: " + e.getMessage());	
		} catch (LoginExcepcion e) {			
			request.setAttribute("MENSAJE", e.getMessage());
		} 
		

		request.setAttribute("LISTADO_IDEAS", lst);
		RequestDispatcher rd = request.getRequestDispatcher("IdeasListar.jsp");
		rd.forward(request, response);

	}
}
