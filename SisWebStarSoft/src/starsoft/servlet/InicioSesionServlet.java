package starsoft.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Usuario;
import starsoft.negocio.GestionUsuario;

/**
 * Servlet implementation class InicioSesionServlet
 */
@WebServlet("/InicioSesionServlet")
public class InicioSesionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InicioSesionServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String Correo = request.getParameter("txtCorreo");
		String Contrasena = request.getParameter("txtContrasena");
		
		GestionUsuario negocio = new GestionUsuario();

		try {
			Usuario vo = negocio.validar(Correo, Contrasena);
			
			HttpSession session = request.getSession();
			session.setAttribute("USUARIO_ACTUAL", vo);
			
			RequestDispatcher rd = request.getRequestDispatcher("Principal.jsp");
			rd.forward(request, response);
			return;
		} catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE", "Hubo un error al procesar la operación: " + e.getMessage());	
		} catch (LoginExcepcion e) {			
			request.setAttribute("MENSAJE", "Usuario y/o clave incorrectos");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("InicioSesion.jsp");
		rd.forward(request, response);
	}
}
