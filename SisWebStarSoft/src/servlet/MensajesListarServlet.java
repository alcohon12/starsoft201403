package servlet;

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

import modelo.Mensaje;;


/**
 * Servlet implementation class MensajesListarServlet
 */
@WebServlet("/MensajesListarServlet")
public class MensajesListarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MensajesListarServlet() {
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
		

		ArrayList<Mensaje> lst = new ArrayList<Mensaje>();
	
		
		Date myDate;
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.MONTH, 11);
		cal.set(Calendar.DATE, 11);
		cal.set(Calendar.YEAR, 2014);
		myDate = cal.getTime();
		
		Mensaje obj1 = new Mensaje();
		obj1.setIdEstado(1);
		obj1.setdsEstado("Activo");		
		obj1.setFeExpiracion(myDate);
		obj1.setDsMensaje("Mantenimeinto pagina 12/11/2014 15:00 Hrs.");
		lst.add(obj1);
		
		cal = Calendar.getInstance();
		cal.set(Calendar.MONTH, 10);
		cal.set(Calendar.DATE, 1);
		cal.set(Calendar.YEAR, 2014);
		
		obj1 = new Mensaje();
		obj1.setIdEstado(2);
		obj1.setdsEstado("Inactivo");		
		obj1.setFeExpiracion(myDate);
		obj1.setDsMensaje("Mantenimeinto pagina 12/11/2014 15:00 Hrs.");
		lst.add(obj1);
		
		cal = Calendar.getInstance();
		cal.set(Calendar.MONTH, 10);
		cal.set(Calendar.DATE, 21);
		cal.set(Calendar.YEAR, 2014);
		
		obj1 = new Mensaje();
		obj1.setIdEstado(3);
		obj1.setdsEstado("Inactivo");		
		obj1.setFeExpiracion(myDate);
		obj1.setDsMensaje("Mantenimeinto pagina 12/11/2014 15:00 Hrs.");
		lst.add(obj1);
		
		
		
		cal = Calendar.getInstance();
		cal.set(Calendar.MONTH, 11);
		cal.set(Calendar.DATE, 5);
		cal.set(Calendar.YEAR, 2014);
		
		obj1 = new Mensaje();
		obj1.setIdEstado(4);
		obj1.setdsEstado("Activo");		
		obj1.setFeExpiracion(myDate);
		obj1.setDsMensaje("Mantenimeinto pagina 12/11/2014 15:00 Hrs.");
		lst.add(obj1);
		
		request.setAttribute("LISTADO", lst);
		RequestDispatcher rd = request.getRequestDispatcher("MensajesListar.jsp");
		rd.forward(request, response);
		
		
	}

}
