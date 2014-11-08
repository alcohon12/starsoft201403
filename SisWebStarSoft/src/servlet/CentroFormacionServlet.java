package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.*;

import java.util.*;
/**
 * Servlet implementation class CentroFormacionServlet
 */
@WebServlet("/CentroFormacionServlet")
public class CentroFormacionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CentroFormacionServlet() {
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
		
		ArrayList<CentroFormacion> Centros=new ArrayList<CentroFormacion>();
		
		CentroFormacion Centro=null;
		for(int x=1;x<=100;x++){
			Centro=new CentroFormacion();
			Centro.setId_CentroFormacion(x);
			Centro.setNom_CentroFormacion("Centro Formacion Nro " + x);
			if(x%5==0)
				Centro.setDs_TipoCentroFormacion("Universidad");
			else
				Centro.setDs_TipoCentroFormacion("Instituto");
			
			Centro.setUrl_CentroFormacion("www.centro" + x + ".com.pe");
			Centros.add(Centro);
			
		}
		
		request.setAttribute("Centros", Centros);
		request.setAttribute("value", "Hola mundo");
		
		RequestDispatcher rd=request.getRequestDispatcher("PageH06.jsp");
		rd.forward(request, response);
		
	}

}