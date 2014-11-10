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
		
		
		/**String FechaIni = request.getParameter("txtFechaIni");
		String FechaFin = request.getParameter("txtFechaFin");
		
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy"); 
		
		Date xFechaIni = new Date();
		Date xFechaFin = new Date();
		
		try {
			xFechaIni = df.parse(FechaIni);
			xFechaFin = df.parse(FechaFin);
		} 
		catch (ParseException e) {
			e.printStackTrace();
		}

		Date myDate;
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.MONTH, 10);
        cal.set(Calendar.DATE, 1);
        cal.set(Calendar.YEAR, 2014);
        myDate= cal.getTime();
	 */
		
		int campo = Integer.parseInt(request.getParameter("ddlCampo"));
		String filtro = request.getParameter("txtFiltro").toUpperCase();
		
		ArrayList<Idea> lista = new ArrayList<Idea>();
		ArrayList<Idea> listafiltro = new ArrayList<Idea>();
		ArrayList<Idea> listafiltro1 = new ArrayList<Idea>();
		ArrayList<Idea> listafiltro2 = new ArrayList<Idea>();
		
		
		String status = request.getParameter("status");
		
        
        Idea dato1 = new Idea();
		dato1.setTitulo_Idea("Programas de reclutamiento");
		dato1.setDescripcion_Idea("El primer paso en la retención de los estudiantes comienza con el reclutamiento. Los postulantes tienen que estar bien informados para transitar de manera exitosa el proceso de admisión y elegir las clases, especialidades y otras actividades. Realizar programas de reclutamiento agradables y divertidos conduce a una mayor tasa de retención estudiantil.");
		dato1.setPalabraClave1("Reclutamiento");
		dato1.setPalabraClave2("Admisión");
		dato1.setPalabraClave3("Orientación");
		dato1.setPalabraClave4("Retención");
		dato1.setId_Estado(1);
		//dato1.setFecha_creacion(myDate);
		dato1.setId_Alumno(2);
		lista.add(dato1);

		
		Idea dato2 = new Idea();
		dato2.setTitulo_Idea("Programas de orientación y consejos");
		dato2.setDescripcion_Idea("Los nuevos estudiantes necesitan ayuda para empezar en el campus y la mejor manera de hacerlo es a través de programas de orientación. Para mantener la buena relación de los estudiantes con la escuela que comenzó en la etapa de orientación, los programas de asesoría son muy recomendables.");
		dato2.setPalabraClave1("Oportunidad");
		dato2.setPalabraClave2("Consejos");
		dato2.setPalabraClave3("Asesoría");
		dato2.setPalabraClave4("Orientación");
		dato2.setId_Estado(1);
		dato2.setId_Alumno(1);
		//dato2.setFecha_creacion(myDate);
		lista.add(dato2);
		
		Idea dato3 = new Idea();
		dato3.setTitulo_Idea("Promover y aceptar la diversidad");
		dato3.setDescripcion_Idea("La diversidad puede promoverse a través de una serie de programas especiales del campus, como foros, noches de cine y cenas con diversas temáticas, o apariciones ocasionales de famosos. Al crear programas de diversidad, algunas de las actividades deben estar abiertas a todos los estudiantes para evitar la sensación de favoritismo y evitar conflictos estudiantiles.");
		dato3.setPalabraClave1("Diversidad");
		dato3.setPalabraClave2("Favoritismo");
		dato3.setPalabraClave3("Conflictos");
		dato3.setPalabraClave4("Programas");
		dato3.setId_Estado(2);
		dato3.setId_Alumno(1);
		lista.add(dato3);
 
		Idea dato4 = new Idea();
		dato4.setTitulo_Idea("Empleo y ayuda financiera");
		dato4.setDescripcion_Idea("Algunos estudiantes abandonan la universidad debido a la falta de fondos para pagar los gastos de matricula. La ayuda financiera podrá concederse también a un número de estudiantes para que puedan continuar su educación.");
		dato4.setPalabraClave1("Empleo");
		dato4.setPalabraClave2("Financiera");
		dato4.setPalabraClave3("Gastos");
		dato4.setPalabraClave4("Fondos");
		dato4.setId_Estado(1);
		//dato4.setFecha_creacion(myDate);
		dato4.setId_Alumno(4);
		lista.add(dato4);
	
		for(Idea item : lista)
			//if(item.getFecha_creacion().compareTo(xFechaIni) >= 0 && item.getFecha_creacion().compareTo(xFechaFin) <= 0) 
			listafiltro.add(item);
		
		
		for(Idea item : listafiltro)
		if(status.equals("aprobada"))
			{
			if(item.getId_Estado()==1) listafiltro1.add(item);
			}			
			else if(status.equals("rechazada"))
			{
			if(item.getId_Estado()==2) listafiltro1.add(item);
			}
		
		
	
		for(Idea item : listafiltro1)
			if(campo == 2)
			{
				if(item.getDescripcion_Idea().toUpperCase().contains(filtro)) listafiltro2.add(item);
			}
			else if(campo == 3)
			{
				if(item.getPalabraClave1().toUpperCase().contains(filtro)) listafiltro2.add(item);
			}			
			else if(campo == 4)
			{
				if(item.getPalabraClave2().toUpperCase().contains(filtro)) listafiltro2.add(item);
			}					
			else if(campo == 5)
			{
				if(item.getPalabraClave3().toUpperCase().contains(filtro)) listafiltro.add(item);
			}					
			else if(campo == 6)
			{
				if(item.getPalabraClave4().toUpperCase().contains(filtro)) listafiltro2.add(item);
			}
			else if(campo == 1)
			{
			if(item.getTitulo_Idea().toUpperCase().contains(filtro)) listafiltro2.add(item);
			}


		request.setAttribute("LISTADO_IDEAS", listafiltro2);
		RequestDispatcher rd = request.getRequestDispatcher("IdeasListar.jsp");
		rd.forward(request, response);
		
		
	}

}