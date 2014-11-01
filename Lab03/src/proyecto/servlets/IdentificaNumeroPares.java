package proyecto.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import proyecto.modelo.NumeroPar;

/**
 * Servlet implementation class IdentificaNumeroPares
 */
@WebServlet("/IdentificaNumeroPares")
public class IdentificaNumeroPares extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdentificaNumeroPares() {
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
		
		int valorinicio = Integer.valueOf(request.getParameter("txtInicio"));
		int valorfinal = Integer.valueOf(request.getParameter("txtFin"));
		
		
		System.out.println("Identificando los valores Pares.... entre [ " + valorinicio + " y " + valorfinal +"]");

		NumeroPar n1 = new NumeroPar();
		ArrayList<NumeroPar> np = new ArrayList<NumeroPar>();
	
		for(int x = valorinicio; x<=valorfinal; x++)
				{ 
					if(x/2==0) { 
							n1.setValor(x);
							np.add(n1);} // fin del If
			} // fin del For
	
		

		

		// Guardando datos en el scope REQUEST
		request.setAttribute("NUMEROS_PARES", np);	

		RequestDispatcher rd = request.getRequestDispatcher("ListadoNumeros.jsp");
		rd.forward(request, response);
		
		
	}

}
