package starsoft.servlet;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.CentroFormacion;
import starsoft.modelo.Respuesta;
import starsoft.negocio.GestionCentroFormacion;

/**
 * Servlet implementation class RegistroCentroInformacionServlet
 */
@WebServlet("/RegistroCentroInformacionServlet")
@MultipartConfig
public class RegistroCentroInformacionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIR_LOCAL = "D:/Vicente/CURSOS/UPC/4 CICLO/Desarrollo Web/Desarrollo Web/PROYECTOS/SisWebStarSoft/WebContent/img/uploads";
	private static final String UPLOAD_DIR = "uploads";

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public RegistroCentroInformacionServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @se e HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *     response)
	 */

	private String getFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		System.out.println("content-disposition header= " + contentDisp);
		String[] tokens = contentDisp.split(";");
		for (String token : tokens) {
			if (token.trim().startsWith("filename")) {
				return token.substring(token.indexOf("=") + 2,
						token.length() - 1);
			}
		}
		return "";
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int id_Centro_Informacion = Integer.parseInt(request
				.getParameter("id_Centro_Informacion"));
		String nombre_Centro_Informacion = request
				.getParameter("nombre_Centro_Informacion");
		int id_Tipo_Centro = Integer.parseInt(request
				.getParameter("id_Tipo_Centro"));
		String url_Centro_Informacion = request
				.getParameter("url_Centro_Informacion");
		Double monto_Pago = Double.parseDouble(request
				.getParameter("monto_Pago"));

		String applicationPath = request.getServletContext().getRealPath("/");
		// constructs path of the directory to save uploaded file
		String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
		String Archivo = "";
		File fileSaveDir = new File(uploadFilePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdirs();
		}

		GestionCentroFormacion negocio = new GestionCentroFormacion();

		try {
			CentroFormacion vo = new CentroFormacion();
			Respuesta beRespuesta = new Respuesta();
			vo.setId_CentroFormacion(id_Centro_Informacion);
			vo.setNom_CentroFormacion(nombre_Centro_Informacion);
			vo.setId_TipoCentroFormacion(id_Tipo_Centro);
			vo.setUrl_CentroFormacion(url_Centro_Informacion);
			vo.setSs_Pago(monto_Pago);

			if (id_Centro_Informacion == 0) {
				beRespuesta = negocio.insertar(vo);
				
			} else {

				beRespuesta=negocio.actualizar(vo);
			}

			if (!beRespuesta.getExisteError()) {
				
				id_Centro_Informacion = (int) beRespuesta.getData();
				
				String fileName = null;

				for (Part part : request.getParts()) {
					fileName = getFileName(part);
					if (fileName != "") {
						Archivo = new File(fileName).getName();
						part.write(uploadFilePath + File.separator + Archivo);
						
						File f = new File(uploadFilePath + File.separator
								+ Archivo);
						f.renameTo(new File(applicationPath + "/uploads" + File.separator
								+ id_Centro_Informacion + ".jpg"));
					}
				}

			}

			request.setAttribute("MENSAJE", beRespuesta.getMensajeError());

		} catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE--2",
					"Hubo un error al procesar la operación: " + e.getMessage());
		} catch (NullPointerException e) {
			System.out.println("Excepció llençada " + e.getMessage());
		}

		RequestDispatcher rd = request
				.getRequestDispatcher("CentroFormacionRegistro.jsp?CodigoCentro="
						+ id_Centro_Informacion);
		rd.forward(request, response);

	}

}
