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
import javax.servlet.http.HttpSession;





import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Discusion;
import starsoft.modelo.Permiso;
import starsoft.negocio.GestionDiscusion;
import starsoft.negocio.GestionPermiso;

/**
 * Servlet implementation class RegistroVotacionServlet
 */
@WebServlet("/RegistroVotacionServlet")
public class RegistroVotacionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroVotacionServlet() {
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
		if(request.getParameter("txtVotacion")!=null){
			String NumVotacion = request.getParameter("txtVotacion");
			String pId_Permiso = request.getParameter("txtId_Permiso");
			String pCodigoIdea = request.getParameter("txtIdea");
			
			Permiso permisoLst = new Permiso();
			permisoLst.setId_Permiso(Integer.parseInt(pId_Permiso));
			permisoLst.setVotacion_Permiso(Integer.parseInt(NumVotacion));
			
			
			GestionPermiso negocio = new GestionPermiso();
			Permiso obj = new Permiso();
			try {
				obj.setId_Permiso(Integer.parseInt(pId_Permiso));
				obj.setVotacion_Permiso(Integer.parseInt(NumVotacion));
				negocio.ActualizarVotacionPermiso(obj);
			} catch (DAOExcepcion e) {
				request.setAttribute("MENSAJE", "Hubo un error al procesar la operación: " + e.getMessage());	
			} catch (LoginExcepcion e) {			
				request.setAttribute("MENSAJE", "Usuario y/o clave incorrectos");
			}
			RequestDispatcher a = request.getRequestDispatcher("DiscusionIdea.jsp?CodigoIdea=" + pCodigoIdea );
			a.forward(request, response);
		}
	}

}
