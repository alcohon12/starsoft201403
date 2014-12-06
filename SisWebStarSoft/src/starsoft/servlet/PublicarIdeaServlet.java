package starsoft.servlet;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.Discusion;
import starsoft.modelo.Idea;
import starsoft.modelo.Permiso;
import starsoft.modelo.Usuario;
import starsoft.negocio.GestionIdea;
import starsoft.negocio.GestionPermiso;

/**
 * Servlet implementation class PublicarIdeaServlet
 */
@WebServlet("/PublicarIdeaServlet")
public class PublicarIdeaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIR_LOCAL = "C:/uploads";
    private static final String UPLOAD_DIR = "uploads";

    /**
     * Default constructor. 
     */
    public PublicarIdeaServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        int id = Integer.parseInt(request.getParameter("id"));
     
		Idea ideax = new Idea();
		Collection<Permiso> lst = new ArrayList<Permiso>();

		GestionIdea negocio = new GestionIdea();
		GestionPermiso negocio2 = new GestionPermiso();
		try {
			ideax = negocio.obtener(id);
			
			
			lst = negocio2.listarPermisoPorIdea(id);			
		} catch (DAOExcepcion e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (LoginExcepcion e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("PERMISOS", lst);
		request.setAttribute("IDEA", ideax);
		RequestDispatcher rd = request.getRequestDispatcher("IdeaPublicar.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        int id = Integer.parseInt(request.getParameter("id"));
        String[] lpermisos = request.getParameterValues("txtusuarios");
        
		Idea ideax = new Idea();
		Collection<Permiso> lst = new ArrayList<Permiso>();

		GestionIdea negocio = new GestionIdea();
		GestionPermiso negocio2 = new GestionPermiso();
		try {
			ideax = negocio.obtener(id);
			negocio2.quitarTodo(id);
			
			  for(String usuario: lpermisos)
				  negocio2.insertar(usuario, id);
			
			  
			lst = negocio2.listarPermisoPorIdea(id);
		} catch (DAOExcepcion e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (LoginExcepcion e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		request.setAttribute("IDEA", ideax);
		request.setAttribute("PERMISOS", lst);
		request.setAttribute("PUBLICAR_IDEA", "Se han registrado los datos correctamente.");
		RequestDispatcher rd = request.getRequestDispatcher("IdeaPublicar.jsp");
		rd.forward(request, response);
	}

}
