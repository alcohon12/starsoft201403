package starsoft.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import starsoft.excepcion.DAOExcepcion;
import starsoft.excepcion.LoginExcepcion;
import starsoft.modelo.*;
import starsoft.negocio.GestionCentroFormacion;
import starsoft.negocio.GestionReunion;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String nombre = request.getParameter("nombre");

		Collection<CentroFormacion> lst = new ArrayList<CentroFormacion>();

		GestionCentroFormacion negocio = new GestionCentroFormacion();

		try {
			lst = negocio.Listar(nombre);
		} catch (DAOExcepcion e) {
			request.setAttribute("MENSAJE",
					"Hubo un error al procesar la operación: " + e.getMessage());
		} catch (NullPointerException e) {
			System.out.println("Excepció llençada " + e.getMessage());
		}

		request.setAttribute("Centros", lst);
		RequestDispatcher rd = request.getRequestDispatcher("PageH06.jsp");
		rd.forward(request, response);

	}

}
