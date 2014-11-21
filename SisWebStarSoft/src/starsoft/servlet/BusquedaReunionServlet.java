package starsoft.servlet;

import java.io.IOException;
import java.util.*;
import java.text.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import starsoft.modelo.Reunion;

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
		
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy"); 
		
		Date xFechaIni = new Date();
		Date xFechaFin = new Date();
		
		try {
			xFechaIni = df.parse(FechaIni);
			xFechaFin = df.parse(FechaFin);
		} 
		catch (ParseException e) {
			//e.printStackTrace();
		}
		
		ArrayList<Reunion> lst = new ArrayList<Reunion>();
		ArrayList<Reunion> lstfiltro = new ArrayList<Reunion>();
		
		Date myDate;
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.MONTH, 10);
        cal.set(Calendar.DATE, 1);
        cal.set(Calendar.YEAR, 2014);
        myDate = cal.getTime();
		
		Reunion obj1 = new Reunion();
		obj1.setId_Reunion(1);
		obj1.setObservacion_Reunion("Observacion 01");
		obj1.setId_Calificacion(1);
		obj1.setNombre_Calificacion("Bueno");
		obj1.setFecha_Reunion(myDate);
		lst.add(obj1);
		
		cal = Calendar.getInstance();
        cal.set(Calendar.MONTH, 10);
        cal.set(Calendar.DATE, 5);
        cal.set(Calendar.YEAR, 2014);
        myDate = cal.getTime();
		
		Reunion obj2 = new Reunion();
		obj2.setId_Reunion(2);
		obj2.setObservacion_Reunion("Observacion 02");
		obj2.setId_Calificacion(2);
		obj2.setNombre_Calificacion("Medio");
		obj2.setFecha_Reunion(myDate);
		lst.add(obj2);
		
		cal = Calendar.getInstance();
        cal.set(Calendar.MONTH, 10);
        cal.set(Calendar.DATE, 10);
        cal.set(Calendar.YEAR, 2014);
        myDate = cal.getTime();
		
		Reunion obj3 = new Reunion();
		obj3.setId_Reunion(3);
		obj3.setObservacion_Reunion("Observacion 03");
		obj3.setId_Calificacion(3);
		obj3.setNombre_Calificacion("Mejorar");
		obj3.setFecha_Reunion(myDate);
		lst.add(obj3);
		
		cal = Calendar.getInstance();
        cal.set(Calendar.MONTH, 10);
        cal.set(Calendar.DATE, 15);
        cal.set(Calendar.YEAR, 2014);
        myDate = cal.getTime();
		
		Reunion obj4 = new Reunion();
		obj4.setId_Reunion(4);
		obj4.setObservacion_Reunion("Observacion 04");
		obj4.setId_Calificacion(1);
		obj4.setNombre_Calificacion("Bueno");
		obj4.setFecha_Reunion(myDate);
		lst.add(obj4);
		
		for(Reunion item : lst)
		{
			if(item.getFecha_Reunion().compareTo(xFechaIni) >= 0 && item.getFecha_Reunion().compareTo(xFechaFin) <= 0)
			lstfiltro.add(item);
		}
		
		request.setAttribute("LISTADO_REUNIONES", lstfiltro);
		RequestDispatcher rd = request.getRequestDispatcher("ReunionBuscar.jsp");
		rd.forward(request, response);
	}

}
