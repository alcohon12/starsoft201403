package starsoft.servlet;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import starsoft.modelo.Idea;
import starsoft.modelo.Reunion;

/**
 * Servlet implementation class RegistroIdeaServlet
 */
@WebServlet("/RegistroIdeaServlet")
public class RegistroIdeaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "C:/uploads";

    /**
     * Default constructor. 
     */
    public RegistroIdeaServlet() {
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
		String Titulo = request.getParameter("txttitulo");
		String Descripcion = request.getParameter("txtdecripcion");
		String Archivo = request.getParameter("txtarchivo");
		String PClave1 = request.getParameter("txtclave1");
		String PClave2 = request.getParameter("txtclave2");
		String PClave3 = request.getParameter("txtclave3");
		String PClave4 = request.getParameter("txtclave4");

		 if(ServletFileUpload.isMultipartContent(request)){
	            try {
	                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	              
	                for(FileItem item : multiparts){
	                    if(!item.isFormField()){
	                        String name = new File(item.getName()).getName();
	                        Archivo = UPLOAD_DIRECTORY + File.separator + name;
	                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
	                    }
	                }
	           
  	            } catch (Exception ex) {
	               request.setAttribute("REGISTRO_IDEA", "Falló cargando el archivo " + ex);
	            }          
	         
	        }
		 // registrar idea
		Idea obj = new Idea();
		obj.setTitulo_Idea(Titulo);
		obj.setDescripcion_Idea(Descripcion);
		obj.setExtensionArchivoIdea(Archivo);
		obj.setPalabraClave1(PClave1);
		obj.setPalabraClave2(PClave2);
		obj.setPalabraClave3(PClave3);
		obj.setPalabraClave4(PClave4);
					
		request.setAttribute("REGISTRO_IDEA", "Se han registrado los datos correctamente.");
		RequestDispatcher rd = request.getRequestDispatcher("IdeaRegistro.jsp");
		rd.forward(request, response);
	}

}
