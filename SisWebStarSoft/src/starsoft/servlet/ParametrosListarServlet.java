package starsoft.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





import starsoft.modelo.Parametro;
import starsoft.modelo.Reunion;
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
		
		
		ArrayList<Parametro> lst = new ArrayList<Parametro>();
	
		
		
		Parametro obj1 = new Parametro();
		obj1.setId_Parametro(1);
		obj1.setDescripcion_Parametro("DNI");		
		obj1.setNombre_Tabla("Tipo Documento");
		
		lst.add(obj1);
		
		obj1 = new Parametro();
		obj1.setId_Parametro(2);
		obj1.setDescripcion_Parametro("Pasaporte");		
		obj1.setNombre_Tabla("Tipo Documento");
		
		lst.add(obj1);
		
		obj1 = new Parametro();
		obj1.setId_Parametro(2);
		obj1.setDescripcion_Parametro("Carne Extranjeria");		
		obj1.setNombre_Tabla("Tipo Documento");
		
		lst.add(obj1);
		
		obj1 = new Parametro();
		obj1.setId_Parametro(3);
		obj1.setDescripcion_Parametro("Licencia conductor");		
		obj1.setNombre_Tabla("Tipo Documento");
		
		lst.add(obj1);
		
		
		obj1 = new Parametro();
		obj1.setId_Parametro(4);
		obj1.setDescripcion_Parametro("Universidad");		
		obj1.setNombre_Tabla("Tipo Centro Formacion");
		
		lst.add(obj1);
		
		obj1 = new Parametro();
		obj1.setId_Parametro(5);
		obj1.setDescripcion_Parametro("Instituo");		
		obj1.setNombre_Tabla("Tipo Centro Formacion");
		
		lst.add(obj1);
		
		obj1 = new Parametro();
		obj1.setId_Parametro(6);
		obj1.setDescripcion_Parametro("Academia");		
		obj1.setNombre_Tabla("Tipo Centro Formacion");
		
		lst.add(obj1);
		
		
		
		request.setAttribute("LISTADO", lst);
		RequestDispatcher rd = request.getRequestDispatcher("ParametrosListar.jsp");
		rd.forward(request, response);
		
		
	}

}
