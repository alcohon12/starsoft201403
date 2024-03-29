package starsoft.modelo;

import java.util.Date;
import java.text.*;

public class Reunion {
	private int id_Reunion;
	private int id_Idea;
	private String titulo_Idea;
	private String observacion_Reunion;
	private int id_Calificacion;
	private String nombre_Calificacion;
	private int id_Asesor;
	private Date fecha_Reunion;
	private Date fecha_creacion;
	private Date fecha_modificacion;
	
	
	public int getId_Reunion() {
		return id_Reunion;
	}
	public void setId_Reunion(int id_Reunion) {
		this.id_Reunion = id_Reunion;
	}
	public String getObservacion_Reunion() {
		return observacion_Reunion;
	}
	public void setObservacion_Reunion(String observacion_Reunion) {
		this.observacion_Reunion = observacion_Reunion;
	}
	public int getId_Calificacion() {
		return id_Calificacion;
	}
	public void setId_Calificacion(int id_Calificacion) {
		this.id_Calificacion = id_Calificacion;
	}
	public int getId_Asesor() {
		return id_Asesor;
	}
	public void setId_Asesor(int id_Asesor) {
		this.id_Asesor = id_Asesor;
	}
	public Date getFecha_Reunion() {
		return fecha_Reunion;
	}
	public String getFecha_Reunion_String()
	{
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		return df.format(fecha_Reunion);
	}
	
	public void setFecha_Reunion_String(String Fecha)
	{
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		try {
			fecha_Reunion = df.parse(Fecha);
		} 
		catch (ParseException e) {
			
		}
	}
	
	public void setFecha_Reunion(Date fecha_Reunion) {
		this.fecha_Reunion = fecha_Reunion;
	}
	public Date getFecha_creacion() {
		return fecha_creacion;
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
	public String getNombre_Calificacion() {
		return nombre_Calificacion;
	}
	public void setNombre_Calificacion(String nombre_Calificacion) {
		this.nombre_Calificacion = nombre_Calificacion;
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
	
	
}
