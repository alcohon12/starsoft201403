package starsoft.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import starsoft.excepcion.DAOExcepcion;
import starsoft.modelo.CentroFormacion;
import starsoft.modelo.Parametro;
import starsoft.negocio.GestionCentroFormacion;

/**
 * Servlet implementation class RegistroParametroServlet
 */
@WebServlet("/RegistroParametroServlet")
public class RegistroParametroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroParametroServlet() {
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
		
		

		int id_Parametro = Integer.parseInt(request.getParameter("id_Parametro"));
		String descripcion_Parametro = request.getParameter("descripcion_Parametro");		
		int id_Tabla = 1;//Integer.parseInt(request.getParameter("ddlCalificacion"));
		String nombre_Tabla = request.getParameter("nombre_Tabla");
		
	
		
	
		
		GestionCentroFormacion negocio = new GestionCentroFormacion(); 
	/*	
		try
		{
			Parametro vo = new CentroFormacion();
			vo.setId_CentroFormacion(id_Centro_Informacion);
			vo.setNom_CentroFormacion(nombre_Centro_Informacion);
			vo.setId_TipoCentroFormacion(id_Tipo_Centro);			
			vo.setUrl_CentroFormacion(url_Centro_Informacion);
			vo.setSs_Pago(monto_Pago);
	
			
			if(id_Centro_Informacion == 0)
				negocio.insertar(vo);
			else
				negocio.actualizar(vo);
			
			request.setAttribute("MENSAJE", "");
		}
		catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE", "Hubo un error al procesar la operación: " + e.getMessage());
		} 
		
		RequestDispatcher rd = request.getRequestDispatcher("CentroFormacionRegistro.jsp?CodigoCentro=" + id_Centro_Informacion);
		rd.forward(request, response);
		
		*/
		
	}

}
