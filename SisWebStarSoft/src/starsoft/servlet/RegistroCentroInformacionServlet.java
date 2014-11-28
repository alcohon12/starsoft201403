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
import starsoft.modelo.CentroFormacion;
import starsoft.negocio.GestionCentroFormacion;




/**
 * Servlet implementation class RegistroCentroInformacionServlet
 */
@WebServlet("/RegistroCentroInformacionServlet")
public class RegistroCentroInformacionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroCentroInformacionServlet() {
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
		
		
		int id_Centro_Informacion = Integer.parseInt(request.getParameter("id_Centro_Informacion"));
		String nombre_Centro_Informacion = request.getParameter("nombre_Centro_Informacion");		
		int id_Tipo_Centro = 1;//Integer.parseInt(request.getParameter("ddlCalificacion"));
		String url_Centro_Informacion = request.getParameter("url_Centro_Informacion");
		Double monto_Pago = Double.parseDouble(request.getParameter("monto_Pago"));
	
		
	
		
		GestionCentroFormacion negocio = new GestionCentroFormacion(); 
		
		try
		{
			CentroFormacion vo = new CentroFormacion();
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
		
		
	}

}
