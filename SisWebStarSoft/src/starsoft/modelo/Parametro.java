package starsoft.modelo;

import java.util.Date;

public class Parametro {
	private int id_Parametro;
	private String descripcion_Parametro;
	private int id_Tabla;
	private String nombre_Tabla;
	private Date fecha_creacion;
	private Date fecha_modificacion;
	
	public int getId_Parametro() {
		return id_Parametro;
	}
	public void setId_Parametro(int id_Parametro) {
		this.id_Parametro = id_Parametro;
	}
	public String getDescripcion_Parametro() {
		return descripcion_Parametro;
	}
	public void setDescripcion_Parametro(String descripcion_Parametro) {
		this.descripcion_Parametro = descripcion_Parametro;
	}
	public int getId_Tabla() {
		return id_Tabla;
	}
	public void setId_Tabla(int id_Tabla) {
		this.id_Tabla = id_Tabla;
	}
	public String getNombre_Tabla() {
		return nombre_Tabla;
	}
	public void setNombre_Tabla(String nombre_Tabla) {
		this.nombre_Tabla = nombre_Tabla;
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
}
