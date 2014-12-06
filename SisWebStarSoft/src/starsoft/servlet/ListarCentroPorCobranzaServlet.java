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

import starsoft.excepcion.DAOExcepcion;
import starsoft.modelo.CentroFormacionCobranza;
import starsoft.negocio.GestionCentroFormacionCobranza;

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

		int mes = Integer.parseInt(request.getParameter("ddlCampo"));
		GestionCentroFormacionCobranza negocio=new GestionCentroFormacionCobranza();
	
		
		
		Collection<CentroFormacionCobranza> Centros = new ArrayList<CentroFormacionCobranza>();

		
		try {
			Centros = negocio.obetner(mes);
		} catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE",
					"Hubo un error al procesar la operación: " + e.getMessage());
		} catch (NullPointerException e) {
			System.out.println("Excepció llençada " + e.getMessage());
		}
		
		request.setAttribute("Centros", Centros);
		
		RequestDispatcher rd=request.getRequestDispatcher("CentroPorCobranzaListar.jsp");
		rd.forward(request, response);
		
	}
		
	}

