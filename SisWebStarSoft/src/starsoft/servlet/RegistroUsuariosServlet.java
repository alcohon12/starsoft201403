package starsoft.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import starsoft.excepcion.DAOExcepcion;
import starsoft.modelo.Usuario;
import starsoft.negocio.GestionUsuario;

/**
 * Servlet implementation class RegistroUsuariosServlet
 */
@WebServlet("/RegistroUsuariosServlet")
public class RegistroUsuariosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroUsuariosServlet() {
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
		int id_Usuario = Integer.parseInt(request.getParameter("txtIdUsuario"));
		String Nombres = request.getParameter("txtNombres");
		String Paterno = request.getParameter("txtPaterno");
		String Materno = request.getParameter("txtMaterno");
		int Genero = Integer.parseInt(request.getParameter("ddlGenero"));
		int TipoDoc = Integer.parseInt(request.getParameter("ddlTipoDoc"));
		String NroDoc = request.getParameter("txtNroDoc");
		String Correo = request.getParameter("txtCorreo");
		String Celular = request.getParameter("txtCelular");
		String Contrasena = request.getParameter("txtContrasena");
		int TipoUsuario = Integer.parseInt(request.getParameter("ddlTipoUsuario"));
		int CentroInfo = Integer.parseInt(request.getParameter("ddlCentroInfo"));
		
		GestionUsuario negocio = new GestionUsuario();
		
		try
		{
			Usuario obj = new Usuario();
			obj.setId_Usuario(id_Usuario);
			obj.setNombre_Usuario(Nombres);
			obj.setPaterno_Usuario(Paterno);;
			obj.setMaterno_Usuario(Materno);;
			obj.setId_Genero(Genero);
			obj.setId_Tipo_Documento(TipoDoc);
			obj.setNroDocumento(NroDoc);
			obj.setCorreo_Usuario(Correo);
			obj.setCelular_Usuario(Celular);
			obj.setPassword_Usuario(Contrasena);
			obj.setId_Tipo_Usuario(TipoUsuario);
			obj.setId_Centro_Informacion(CentroInfo);
			
			if(id_Usuario == 0)
				negocio.insertar(obj);
			else
				negocio.actualizar(obj);
			
			request.setAttribute("MENSAJE_CONFIRMACION", 1);
			//request.setAttribute("MENSAJE", "");
		}
		catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE_CONFIRMACION", 0);
			//request.setAttribute("MENSAJE", "Hubo un error al procesar la operación: " + e.getMessage());
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("UsuarioRegistro.jsp?CodigoUsuario=" + id_Usuario);
		rd.forward(request, response);
	}

}
