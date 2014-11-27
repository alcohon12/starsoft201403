package starsoft.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import starsoft.modelo.CentroFormacion;
import starsoft.modelo.Idea;

/**
 * Servlet implementation class ListarCentroPorCobranzaServlet
 */
@WebServlet("/ListarCentroPorCobranzaServlet")
public class ListarCentroPorCobranzaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListarCentroPorCobranzaServlet() {
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
		ArrayList<CentroFormacion> CentrosP = new ArrayList<CentroFormacion>();
		
		
		for(int x=1;x<=10;x++){
			
			Centro=new CentroFormacion();
			Centro.setId_CentroFormacion(x);
			Centro.setNom_CentroFormacion("Centro Formacion Nro " + x);
			Centro.setSs_Pago(1500/x);
			if(x%5==0)
				Centro.setDs_TipoCentroFormacion("Universidad");
			else
				Centro.setDs_TipoCentroFormacion("Instituto");
			Centros.add(Centro);
		}
		
		
		request.setAttribute("Centros", Centros);
		
		RequestDispatcher rd=request.getRequestDispatcher("CentroPorCobranzaListar.jsp");
		rd.forward(request, response);
		
	}
		
	}

