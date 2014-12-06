package starsoft.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import starsoft.excepcion.DAOExcepcion;
import starsoft.modelo.Parametro;
import starsoft.negocio.GestionParametro;

/**
 * Servlet implementation class RegistroParametrosServlet
 */
@WebServlet("/RegistroParametrosServlet")
public class RegistroParametrosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroParametrosServlet() {
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
		
		String descripcion_parametro = request.getParameter("descripcion_parametro");
		int numero_Tabla = Integer.parseInt(request.getParameter("numero_Tabla"));
		String nombre_Tabla = request.getParameter("nombre_Tabla");
		int IdParametro = Integer.parseInt(request.getParameter("txtIdParametro"));
				
		GestionParametro negocio= new GestionParametro(); 
		
		try
		{
			Parametro obj = new Parametro();
			obj.setDescripcion_Parametro(descripcion_parametro);
			obj.setId_Tabla(numero_Tabla);
			obj.setNombre_Tabla(nombre_Tabla);
					
			if(IdParametro == 0){
				negocio.Registrar(obj);
			}
			//else
				//negocio.Registrar(obj);
			
			request.setAttribute("MENSAJE", "");
		}
		catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE", "Hubo un error al procesar la operación: " + e.getMessage());
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("ParametrosRegistro.jsp?CodigoParametro=" + IdParametro);
		rd.forward(request, response);
	}
}
