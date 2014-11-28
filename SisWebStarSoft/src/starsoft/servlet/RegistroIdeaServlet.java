package starsoft.servlet;
import java.io.File;
import java.io.IOException;
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
import starsoft.modelo.Idea;
import starsoft.modelo.Usuario;
import starsoft.negocio.GestionIdea;

/**
 * Servlet implementation class RegistroIdeaServlet
 */
@WebServlet("/RegistroIdeaServlet")
@MultipartConfig
public class RegistroIdeaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIR_LOCAL = "C:/uploads";
    private static final String UPLOAD_DIR = "uploads";

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

        String applicationPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        System.out.println("Upload File Directory="+fileSaveDir.getAbsolutePath());
       
		// TODO Auto-generated method stub
		String Titulo = request.getParameter("txttitulo");
		String Descripcion = request.getParameter("txtdecripcion");
		String Archivo = "";
		String PClave1 = request.getParameter("txtclave1");
		String PClave2 = request.getParameter("txtclave2");
		String PClave3 = request.getParameter("txtclave3");
		String PClave4 = request.getParameter("txtclave4");
		java.util.Date fhoy = new java.util.Date();

		String fileName = null;
        //Get all the parts from request and write it to the file on server
        for (Part part : request.getParts()) {
            fileName = getFileName(part);
            if(fileName != ""){
                Archivo = new File(fileName).getName();
                part.write(uploadFilePath + File.separator + Archivo);
                File f = new File(uploadFilePath + File.separator + Archivo);
                f.renameTo(new File(UPLOAD_DIR_LOCAL + File.separator + Archivo));
            }
        }


			HttpSession session = request.getSession(true);
			Usuario user = (Usuario)session.getAttribute("USUARIO_ACTUAL");
			int id_Alumno = user.getId_Usuario();
			
		Idea obj = new Idea();
		obj.setTitulo_Idea(Titulo);
		obj.setDescripcion_Idea(Descripcion);
		obj.setExtensionArchivoIdea(Archivo);
		obj.setPalabraClave1(PClave1);
		obj.setPalabraClave2(PClave2);
		obj.setPalabraClave3(PClave3);
		obj.setPalabraClave4(PClave4);		
		obj.setId_Alumno(id_Alumno);
		obj.setFecha_creacion(fhoy);
		obj.setId_Estado(17); // ESTADO POR DEFECTO 

		GestionIdea negocio = new GestionIdea();
		try {
			negocio.insertar(obj);
		} catch (DAOExcepcion e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
					
		request.setAttribute("REGISTRO_IDEA", "Se han registrado los datos correctamente.");
		RequestDispatcher rd = request.getRequestDispatcher("IdeaRegistro.jsp");
		rd.forward(request, response);
	}
	 private String getFileName(Part part) {
	        String contentDisp = part.getHeader("content-disposition");
	        System.out.println("content-disposition header= "+contentDisp);
	        String[] tokens = contentDisp.split(";");
	        for (String token : tokens) {
	            if (token.trim().startsWith("filename")) {
	                return token.substring(token.indexOf("=")+2 , token.length()-1);
	            }
	        }
	        return "";
	    }

}
