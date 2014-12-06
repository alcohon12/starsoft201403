package starsoft.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Usuario;
import starsoft.negocio.GestionUsuario;

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
		String filtro = "%" + request.getParameter("txtFiltro").toUpperCase() + "%";
		
		Collection<Usuario> lst = new ArrayList<Usuario>();
		
		GestionUsuario negocio = new GestionUsuario();
		
		try
		{
			lst = negocio.obtener(1, filtro);
		}
		catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE", "Hubo un error al procesar la operación: " + e.getMessage());	
		} catch (LoginExcepcion e) {			
			request.setAttribute("MENSAJE", e.getMessage());
		}
		
		request.setAttribute("LISTADO_USUARIOS", lst);
		RequestDispatcher rd = request.getRequestDispatcher("IdeaBuscarUsuario.jsp");
		rd.forward(request, response);
	}

}
