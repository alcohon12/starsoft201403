package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Idea;

/**
 * Servlet implementation class BusquedaIdeaDiscusionServlet
 */
@WebServlet("/BusquedaIdeaDiscusionServlet")
public class BusquedaIdeaDiscusionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusquedaIdeaDiscusionServlet() {
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
		ArrayList<Idea> lst = new ArrayList<Idea>();
		
		Idea obj1 = new Idea();
		obj1.setId_Idea(1);
		obj1.setTitulo_Idea("Idea 1 prueba");
		obj1.setDescripcion_Idea("Esta es la primera idea");
		obj1.setPalabraClave1("palabraidea1");
		obj1.setPalabraClave2("palabraidea2");
		obj1.setPalabraClave3("palabraidea3");
		obj1.setPalabraClave4("palabraidea4");
		obj1.setEstado_Idea("APROBADA");
		lst.add(obj1);
		
		Idea obj2 = new Idea();
		obj2.setId_Idea(2);
		obj2.setTitulo_Idea("Idea 2 prueba");
		obj2.setDescripcion_Idea("Esta es la segunda idea");
		obj2.setPalabraClave1("palabraidea1");
		obj2.setPalabraClave2("palabraidea2");
		obj2.setPalabraClave3("palabraidea3");
		obj2.setPalabraClave4("palabraidea4");
		obj2.setEstado_Idea("RECHAZADA");
		lst.add(obj2);
		
		Idea obj3 = new Idea();
		obj3.setId_Idea(3);
		obj3.setTitulo_Idea("Idea 3 prueba");
		obj3.setDescripcion_Idea("Esta es la tercera idea");
		obj3.setPalabraClave1("palabraidea1");
		obj3.setPalabraClave2("palabraidea2");
		obj3.setPalabraClave3("palabraidea3");
		obj3.setPalabraClave4("palabraidea4");
		obj3.setEstado_Idea("PUBLICADA");
		lst.add(obj3);
		
		Idea obj4 = new Idea();
		obj4.setId_Idea(4);
		obj4.setTitulo_Idea("Idea 4 pruebaaaaaaa");
		obj4.setDescripcion_Idea("Esta es la cuarta idea");
		obj4.setPalabraClave1("palabraidea1");
		obj4.setPalabraClave2("palabraidea2");
		obj4.setPalabraClave3("palabraidea3");
		obj4.setPalabraClave4("palabraidea4");
		obj4.setEstado_Idea("APROBADA");
		lst.add(obj4);
		
		Idea obj5 = new Idea();
		obj5.setId_Idea(5);
		obj5.setTitulo_Idea("Idea 5 prueba");
		obj5.setDescripcion_Idea("Esta es la quinta idea");
		obj5.setPalabraClave1("palabraidea1");
		obj5.setPalabraClave2("palabraidea2");
		obj5.setPalabraClave3("palabraidea3");
		obj5.setPalabraClave4("palabraidea4");
		obj5.setEstado_Idea("APROBADA");
		lst.add(obj5);
		
		
		request.setAttribute("LISTADO_IDEAS_DISCUSION", lst);
		RequestDispatcher rd = request.getRequestDispatcher("InvitacionIdea.jsp");
		rd.forward(request, response);
	}

}
