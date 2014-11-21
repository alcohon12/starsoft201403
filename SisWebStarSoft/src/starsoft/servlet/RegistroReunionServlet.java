package starsoft.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import starsoft.modelo.Reunion;
import starsoft.modelo.Usuario;

/**
 * Servlet implementation class RegistroReunionServlet
 */
@WebServlet("/RegistroReunionServlet")
public class RegistroReunionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroReunionServlet() {
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
		String Observaciones = request.getParameter("txtObservaciones");
		int Calificacion = Integer.parseInt(request.getParameter("ddlCalificacion"));
		String Fecha = request.getParameter("txtFecha");
		
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		
		Reunion obj = new Reunion();
		obj.setObservacion_Reunion(Observaciones);
		obj.setId_Calificacion(Calificacion);
		
		try
		{
			obj.setFecha_Reunion(df.parse(Fecha));
		}
		catch(ParseException e)
		{
			
		}
		
		request.setAttribute("REGISTRO_REUNION", obj);
		RequestDispatcher rd = request.getRequestDispatcher("ReunionBuscar.jsp");
		rd.forward(request, response);
	}

}
