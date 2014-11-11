package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Discusion;
import modelo.Idea;

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
		String idIdea = "1";//(String)request.getAttribute("IdIdea"); 
		
		Discusion objD1 = new Discusion();
		//objD1.setId_Idea(Integer.parseInt(idIdea));
		objD1.setComentario(comentario);
		objD1.setFecha_creacion(new Date());
		objD1.setUsuario_Comentario("fchara");
		lst.add(objD1);
			
		request.setAttribute("LISTADO_DISCUSION", lst);
		RequestDispatcher rd = request.getRequestDispatcher("DiscusionIdea.jsp?CodigoIdea=" + idIdea);
		rd.forward(request, response);
	}

}
