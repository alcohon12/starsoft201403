package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Usuario;

/**
 * Servlet implementation class BusquedaUsuarios
 */
@WebServlet("/IdeaBusquedaUsuariosServlet")
public class IdeaBusquedaUsuariosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdeaBusquedaUsuariosServlet() {
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
		String filtro = request.getParameter("txtFiltro").toUpperCase();
		
		ArrayList<Usuario> lst = new ArrayList<Usuario>();
		ArrayList<Usuario> lstfiltro = new ArrayList<Usuario>();
		
		Usuario obj1 = new Usuario();
		obj1.setId_Usuario(1);
		obj1.setNombre_Usuario("Victor");
		obj1.setPaterno_Usuario("Marino");
		obj1.setMaterno_Usuario("Alvarez");
		obj1.setCorreo_Usuario("victor@upc.edu.pe");
		obj1.setNombre_Tipo_Usuario("Estudiante");
		lst.add(obj1);
		
		Usuario obj2 = new Usuario();
		obj2.setId_Usuario(2);
		obj2.setNombre_Usuario("Frank");
		obj2.setPaterno_Usuario("Chara");
		obj2.setMaterno_Usuario("Pelaez");
		obj2.setCorreo_Usuario("frank@upc.edu.pe");
		obj2.setNombre_Tipo_Usuario("Estudiante");
		lst.add(obj2);
		
		Usuario obj3 = new Usuario();
		obj3.setId_Usuario(3);
		obj3.setNombre_Usuario("Vicente");
		obj3.setPaterno_Usuario("Martel");
		obj3.setMaterno_Usuario("Ugarte");
		obj3.setCorreo_Usuario("vicente@upc.edu.pe");
		obj3.setNombre_Tipo_Usuario("Asesor");
		lst.add(obj3);
		
		Usuario obj4 = new Usuario();
		obj4.setId_Usuario(4);
		obj4.setNombre_Usuario("Alfredo");
		obj4.setPaterno_Usuario("Alvarez");
		obj4.setMaterno_Usuario("Ramos");
		obj4.setCorreo_Usuario("frank@upc.edu.pe");
		obj4.setNombre_Tipo_Usuario("Asesor");
		lst.add(obj4);
		
		for(Usuario item : lst)
		{

				if(item.getNombre_Usuario().toUpperCase().contains(filtro)) lstfiltro.add(item);

		}
		
		request.setAttribute("LISTADO_USUARIOS", lstfiltro);
		RequestDispatcher rd = request.getRequestDispatcher("IdeaBuscarUsuario.jsp");
		rd.forward(request, response);
	}

}
