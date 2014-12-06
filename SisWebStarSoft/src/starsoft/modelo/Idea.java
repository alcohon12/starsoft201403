package starsoft.modelo;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import java.text.*;
public class Idea {
	private int id_Idea;
	private String titulo_Idea;
	private String descripcion_Idea;
	private String palabraClave1;
	private String palabraClave2;
	private String palabraClave3;
	private String palabraClave4;
	private String estado_Idea;
	private Usuario alumno;
	private String extensionArchivoIdea;
	private int id_Estado;
	private int id_Alumno;
	private Date fecha_creacion;
	private Date fecha_modificacion;
	private Date fecha_aprobacion;
	private int id_Asesor;
	
	private String fecha_creacion_String;
	
	private String estudiante;
	
	
	

	public String getEstudiante() {
		return estudiante;
	}

	public void setEstudiante(String estudiante) {
		this.estudiante = estudiante;
	}

	public String getFecha_creacion_String() {
	
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		return df.format(fecha_creacion);
	}

	public int getId_Idea() {
		return id_Idea;
	}
	public void setId_Idea(int id_Idea) {
		this.id_Idea = id_Idea;
	}
	public String getTitulo_Idea() {
		return titulo_Idea;
	}
	public void setTitulo_Idea(String titulo_Idea) {
		this.titulo_Idea = titulo_Idea;
	}
	public String getDescripcion_Idea() {
		return descripcion_Idea;
	}
	public void setDescripcion_Idea(String descripcion_Idea) {
		this.descripcion_Idea = descripcion_Idea;
	}
	public String getPalabraClave1() {
		return palabraClave1;
	}
	public void setPalabraClave1(String palabraClave1) {
		this.palabraClave1 = palabraClave1;
	}
	public String getPalabraClave2() {
		return palabraClave2;
	}
	public void setPalabraClave2(String palabraClave2) {
		this.palabraClave2 = palabraClave2;
	}
	public String getPalabraClave3() {
		return palabraClave3;
	}
	public void setPalabraClave3(String palabraClave3) {
		this.palabraClave3 = palabraClave3;
	}
	public String getPalabraClave4() {
		return palabraClave4;
	}
	public void setPalabraClave4(String palabraClave4) {
		this.palabraClave4 = palabraClave4;
	}
	public String getEstado_Idea() {
		return estado_Idea;
	}
	public void setEstado_Idea(String estado_Idea) {
		this.estado_Idea = estado_Idea;
	}
	public String getExtensionArchivoIdea() {
		return extensionArchivoIdea;
	}
	public void setExtensionArchivoIdea(String extensionArchivoIdea) {
		this.extensionArchivoIdea = extensionArchivoIdea;
	}
	public int getId_Estado() {
		return id_Estado;
	}
	public void setId_Estado(int id_Estado) {
		this.id_Estado = id_Estado;
	}
	public int getId_Alumno() {
		return id_Alumno;
	}
	public void setId_Alumno(int id_Alumno) {
		this.id_Alumno = id_Alumno;
	}

	
	public Date getFecha_creacion() {
		return fecha_creacion;
	}
	public String getFecha_creacionCorta() {
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		return df.format(fecha_creacion);
		
	
	}
	public void setFecha_creacion(Date fecha_creacion) {
		
		
		this.fecha_creacion = fecha_creacion;
	}
	public Date getFecha_modificacion() {
		return fecha_modificacion;
	}
	public void setFecha_modificacion(Date fecha_modificacion) {
		this.fecha_modificacion = fecha_modificacion;
	}
	public Date getFecha_aprobacion() {
		return fecha_aprobacion;
	}
	public void setFecha_aprobacion(Date fecha_aprobacion) {
		this.fecha_aprobacion = fecha_aprobacion;
	}
	public int getId_Asesor() {
		return id_Asesor;
	}
	public void setId_Asesor(int id_Asesor) {
		this.id_Asesor = id_Asesor;
	}
	public Usuario getAlumno() {
		return alumno;
	}
	public void setAlumno(Usuario alumno) {
		this.alumno = alumno;
	}
	
	
}
