

package servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Idea;
import modelo.Reunion;
import modelo.Usuario;

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
		// TODO Auto-generated method stub

		/**
		 * String FechaIni = request.getParameter("txtFechaIni"); String
		 * FechaFin = request.getParameter("txtFechaFin");
		 * 
		 * DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		 * 
		 * Date xFechaIni = new Date(); Date xFechaFin = new Date();
		 * 
		 * try { xFechaIni = df.parse(FechaIni); xFechaFin = df.parse(FechaFin);
		 * } catch (ParseException e) { e.printStackTrace(); }
		 * 
		 * Date myDate; Calendar cal = Calendar.getInstance();
		 * cal.set(Calendar.MONTH, 10); cal.set(Calendar.DATE, 1);
		 * cal.set(Calendar.YEAR, 2014); myDate= cal.getTime();
		 */

		int campo = Integer.parseInt(request.getParameter("ddlCampo"));
		String filtro = request.getParameter("txtFiltro").toUpperCase();

		ArrayList<Idea> lista = new ArrayList<Idea>();
		ArrayList<Idea> listafiltro = new ArrayList<Idea>();
		ArrayList<Idea> listafiltro1 = new ArrayList<Idea>();
		ArrayList<Idea> listafiltro2 = new ArrayList<Idea>();

		String status = request.getParameter("status");

		Date myDate;
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.MONTH, 10);
		cal.set(Calendar.DATE, 1);
		cal.set(Calendar.YEAR, 2014);
		myDate = cal.getTime();

		Idea dato1 = new Idea();
		dato1.setTitulo_Idea("Idea 1 prueba");
		dato1.setDescripcion_Idea("Esta es la primera idea");
		dato1.setPalabraClave1("palabraidea1");
		dato1.setPalabraClave2("palabraidea2");
		dato1.setPalabraClave3("palabraidea3");
		dato1.setPalabraClave4("palabraidea4");
		dato1.setId_Estado(1);
		dato1.setFecha_creacion(myDate);
		
		dato1.setId_Alumno(2);
		lista.add(dato1);

		cal = Calendar.getInstance();
		cal.set(Calendar.MONTH, 11);
		cal.set(Calendar.DATE, 1);
		cal.set(Calendar.YEAR, 2014);
		myDate = cal.getTime();

		Idea dato2 = new Idea();
		dato2.setTitulo_Idea("Idea 2 prueba");
		dato2.setDescripcion_Idea("Esta es la segunda idea");
		dato2.setPalabraClave1("palabraidea1");
		dato2.setPalabraClave2("palabraidea2");
		dato2.setPalabraClave3("palabraidea3");
		dato2.setPalabraClave4("palabraidea4");
		dato2.setId_Estado(1);
		dato2.setId_Alumno(1);
		dato2.setFecha_creacion(myDate);
		lista.add(dato2);

		cal = Calendar.getInstance();
		cal.set(Calendar.MONTH, 11);
		cal.set(Calendar.DATE, 11);
		cal.set(Calendar.YEAR, 2014);
		myDate = cal.getTime();

		Idea dato3 = new Idea();
		dato3.setTitulo_Idea("Idea 3 prueba");
		dato3.setDescripcion_Idea("Esta es la tercera idea");
		dato3.setPalabraClave1("palabraidea1");
		dato3.setPalabraClave2("palabraidea2");
		dato3.setPalabraClave3("palabraidea3");
		dato3.setPalabraClave4("palabraidea4");
		dato3.setId_Estado(2);
		dato3.setId_Alumno(1);
		dato3.setFecha_creacion(myDate);
		lista.add(dato3);

		cal = Calendar.getInstance();
		cal.set(Calendar.MONTH, 25);
		cal.set(Calendar.DATE, 10);
		cal.set(Calendar.YEAR, 2014);
		myDate = cal.getTime();

		Idea dato4 = new Idea();
		dato4.setTitulo_Idea("Idea 4 prueba");
		dato4.setDescripcion_Idea("Esta es la cuarta idea");
		dato4.setPalabraClave1("palabraidea1");
		dato4.setPalabraClave2("palabraidea2");
		dato4.setPalabraClave3("palabraidea3");
		dato4.setPalabraClave4("palabraidea4");
		dato4.setId_Estado(1);
		dato4.setFecha_creacion(myDate);
		dato4.setId_Alumno(4);
		lista.add(dato4);

		String FechaIni = request.getParameter("txtFechaIni");
		String FechaFin = request.getParameter("txtFechaFin");

		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");

		Date xFechaIni = new Date();
		Date xFechaFin = new Date();

		try {
			xFechaIni = df.parse(FechaIni);
			xFechaFin = df.parse(FechaFin);
		} catch (ParseException e) {
			// e.printStackTrace();
		}

		for (Idea item : lista)
			if (item.getFecha_creacion().compareTo(xFechaIni) >= 0
					&& item.getFecha_creacion().compareTo(xFechaFin) <= 0)
				listafiltro.add(item);

		for (Idea item : listafiltro)

			if (status.equals("aprobada")) {
				if (item.getId_Estado() == 1)
					listafiltro1.add(item);
			} else if (status.equals("rechazada")) {
				if (item.getId_Estado() == 2)
					listafiltro1.add(item);
			}

		for (Idea item : listafiltro1)
			if (campo == 2) {
				if (item.getDescripcion_Idea().toUpperCase().contains(filtro))
					listafiltro2.add(item);
			} else if (campo == 3) {
				if (item.getPalabraClave1().toUpperCase().contains(filtro))
					listafiltro2.add(item);
			} else if (campo == 4) {
				if (item.getPalabraClave2().toUpperCase().contains(filtro))
					listafiltro2.add(item);
			} else if (campo == 5) {
				if (item.getPalabraClave3().toUpperCase().contains(filtro))
					listafiltro.add(item);
			} else if (campo == 6) {
				if (item.getPalabraClave4().toUpperCase().contains(filtro))
					listafiltro2.add(item);
			} else if (campo == 1) {
				if (item.getTitulo_Idea().toUpperCase().contains(filtro))
					listafiltro2.add(item);
			}

		request.setAttribute("LISTADO_IDEAS", listafiltro2);
		RequestDispatcher rd = request.getRequestDispatcher("IdeasListar.jsp");
		rd.forward(request, response);

	}
}
