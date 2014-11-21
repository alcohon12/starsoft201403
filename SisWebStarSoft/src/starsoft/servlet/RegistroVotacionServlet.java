package starsoft.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import starsoft.modelo.Permiso;

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
			String pCodigoIdea = request.getParameter("txtIdea");
			
			Permiso permisoLst = new Permiso();
			permisoLst.setId_Idea(Integer.parseInt(pCodigoIdea));
			permisoLst.setVotacion_Permiso(Integer.parseInt(NumVotacion));
			
			HttpSession SesionComent = request.getSession();
			if(SesionComent.getAttribute("Votacion") == null){
				ArrayList<Permiso>  permisoList = new ArrayList<Permiso>();
				permisoList.add(permisoLst);
				SesionComent.setAttribute("Votacion", permisoList);
			}else{
				ArrayList<Permiso> permList = (ArrayList<Permiso>)SesionComent.getAttribute("Votacion");
				permList.add(permisoLst);
				SesionComent.setAttribute("Votacion", permList);
			}
	    	
			RequestDispatcher a = request.getRequestDispatcher("DiscusionIdea.jsp?CodigoIdea=" + pCodigoIdea + "&NumEstrellas=" + NumVotacion);
			a.forward(request, response);
		}
	}

}
