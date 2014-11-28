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
import javax.servlet.http.HttpSession;

import starsoft.excepcion.DAOExcepcion;
import starsoft.modelo.Reunion;
import starsoft.modelo.Usuario;
import starsoft.negocio.GestionReunion;

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
		int id_Reunion = Integer.parseInt(request.getParameter("txtIdReunion"));
		String Observaciones = request.getParameter("txtObservaciones");
		int Calificacion = Integer.parseInt(request.getParameter("ddlCalificacion"));
		String Fecha = request.getParameter("txtFecha");
		
		HttpSession session = request.getSession(true);
		Usuario user = (Usuario)session.getAttribute("USUARIO_ACTUAL");
		int id_Asesor = user.getId_Usuario();
		
		GestionReunion negocio = new GestionReunion(); 
		
		try
		{
			Reunion obj = new Reunion();
			obj.setId_Reunion(id_Reunion);
			obj.setObservacion_Reunion(Observaciones);
			obj.setId_Calificacion(Calificacion);
			obj.setId_Asesor(id_Asesor);
			
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			obj.setFecha_Reunion(df.parse(Fecha));
			
			if(id_Reunion == 0)
				negocio.insertar(obj);
			else
				negocio.actualizar(obj);
			
			request.setAttribute("MENSAJE", "");
		}
		catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE", "Hubo un error al procesar la operación: " + e.getMessage());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("ReunionRegistro.jsp?CodigoReunion=" + id_Reunion);
		rd.forward(request, response);
	}

}
