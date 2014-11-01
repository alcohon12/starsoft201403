package proyecto.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import proyecto.modelo.Cliente;

/**
 * Servlet implementation class ClientesBuscarServlets
 */
@WebServlet("/ClientesBuscarServlet")
public class ClientesBuscarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientesBuscarServlet() {
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
		
		String criterio = request.getParameter("txtNombres");
		
		System.out.println("Dentro de ClientesBuscarServlet: " + criterio);

		Cliente c1 = new Cliente();
		c1.setCodigo(11);
		c1.setNombres("David");
		c1.setPaterno("Rodriguez");
		c1.setMaterno("Condezo");

		Cliente c2 = new Cliente();
		c2.setCodigo(12);
		c2.setNombres("Juan");
		c2.setPaterno("Perez");
		c2.setMaterno("Quispe");

		ArrayList<Cliente> clientes = new ArrayList<Cliente>();
		clientes.add(c1);
		clientes.add(c2);

		// Guardando datos en el scope REQUEST
		request.setAttribute("CLIENTES_REGISTRADOS", clientes);	

		RequestDispatcher rd = request.getRequestDispatcher("clientes_buscar.jsp");
		rd.forward(request, response);
	}


}
