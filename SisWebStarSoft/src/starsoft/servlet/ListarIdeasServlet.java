

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


import starsoft.negocio.GestionIdeaReporte;;


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
		
		String FechaIni = request.getParameter("txtFechaIni"); 
		String FechaFin = request.getParameter("txtFechaFin");
		
		String str_Estado = (request.getParameter("ddlEstado")); //estado
		
		int ddlCampo = Integer.parseInt(request.getParameter("ddlCampo"));
		String filtro = request.getParameter("txtFiltro"); //filtro por campo 1=titulo,2=descripcion
	
		Date dFechaIni = new Date();
		Date dFechaFin = new Date();
		Collection<Idea> lst = new ArrayList<Idea>();
		String titulo="";
		String descripcion="";
		GestionIdeaReporte negocio = new GestionIdeaReporte();
		if(FechaIni.trim().equals("")){
			FechaIni="01/01/2000";
			FechaFin="01/01/2020";
		}

		switch (ddlCampo) {
		case 1:
			titulo=filtro;
			break;

		case 2:
			descripcion=filtro;
			break;
		}
		
			
		
		try
		{
			
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			dFechaIni = df.parse(FechaIni);
			dFechaFin = df.parse(FechaFin);
			lst = negocio.obtener(dFechaIni, dFechaFin, str_Estado, titulo, descripcion);
		}
		catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE", "Hubo un error al procesar la operación: " + e.getMessage());	
		} catch (LoginExcepcion e) {			
			request.setAttribute("MENSAJE", e.getMessage());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	

		request.setAttribute("LISTADO_IDEAS", lst);
		RequestDispatcher rd = request.getRequestDispatcher("IdeasListar.jsp");
		rd.forward(request, response);

	}
}
