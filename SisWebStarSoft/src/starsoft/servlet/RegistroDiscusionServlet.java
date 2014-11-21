package starsoft.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import starsoft.modelo.Discusion;
import starsoft.modelo.Idea;
import starsoft.modelo.Permiso;

/**
 * Servlet implementation class RegistroDiscusionServlet
 */
@WebServlet("/RegistroDiscusionServlet")
public class RegistroDiscusionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroDiscusionServlet() {
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
		ArrayList<Discusion> lst = new ArrayList<Discusion>();
		String comentario = request.getParameter("txtComent");
		String idIdea = request.getParameter("txtIdea");
		String NumEstrellas = "";
				
		HttpSession SesionComent = request.getSession();
		if(SesionComent.getAttribute("Votacion") != null){
			ArrayList<Permiso>  permisoList = (ArrayList<Permiso>)SesionComent.getAttribute("Votacion");
			for(Permiso item : permisoList){
				if(item.getId_Idea() == Integer.parseInt(idIdea)){
					NumEstrellas =  String.valueOf(item.getVotacion_Permiso());
				}
			}
		}
		Discusion objD1 = new Discusion();
		objD1.setId_Idea(Integer.parseInt(idIdea));
		objD1.setComentario(comentario);
		objD1.setFecha_creacion(new Date());
		objD1.setUsuario_Comentario("fchara");
		lst.add(objD1);
			
		request.setAttribute("LISTADO_DISCUSION", lst);
		RequestDispatcher rd = request.getRequestDispatcher("DiscusionIdea.jsp?CodigoIdea=" + idIdea + "&NumEstrellas=" + NumEstrellas);
		if(NumEstrellas == "" || NumEstrellas == null){
			rd = request.getRequestDispatcher("DiscusionIdea.jsp?CodigoIdea=" + idIdea);
		}else{
			rd = request.getRequestDispatcher("DiscusionIdea.jsp?CodigoIdea=" + idIdea + "&NumEstrellas=" + NumEstrellas);
		}
		
		rd.forward(request, response);
	}
}
