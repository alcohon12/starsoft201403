package starsoft.modelo;

import java.util.Date;

public class Permiso {
	private int id_Permiso;
	private int id_Idea;
	private int id_Usuario;
	private int votacion_Permiso;
	private Date fecha_creacion;
	private String descripcion_Idea;
	private String titulo_Idea;
	private String nombre_usuario;
	
	public String getTitulo_Idea() {
		return this.titulo_Idea;
	}
	public void setTitulo_Idea(String titulo_Idea) {
		this.titulo_Idea = titulo_Idea;
	}
	public int getId_Permiso() {
		return id_Permiso;
	}
	public String getDescripcion_Idea() {
		return descripcion_Idea;
	}
	public void setDescripcion_Idea(String descripcion_Idea) {
		this.descripcion_Idea = descripcion_Idea;
	}
	public void setId_Permiso(int id_Permiso) {
		this.id_Permiso = id_Permiso;
	}
	public int getId_Idea() {
		return id_Idea;
	}
	public void setId_Idea(int id_Idea) {
		this.id_Idea = id_Idea;
	}
	public int getId_Usuario() {
		return id_Usuario;
	}
	public void setId_Usuario(int id_Usuario) {
		this.id_Usuario = id_Usuario;
	}
	public int getVotacion_Permiso() {
		return votacion_Permiso;
	}
	public void setVotacion_Permiso(int votacion_Permiso) {
		this.votacion_Permiso = votacion_Permiso;
	}
	public Date getFecha_creacion() {
		return fecha_creacion;
	}
	public void setFecha_creacion(Date fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}

	public String getNombre_usuario() {
		return this.nombre_usuario;
	}
	public void setNombre_usuario(String nombre_usuario) {
		this.nombre_usuario = nombre_usuario;
	}
}
