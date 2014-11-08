package modelo;

import java.util.Date;

public class Permiso {
	private int id_Permiso;
	private int id_Idea;
	private int id_Usuario;
	private int votacion_Permiso;
	private Date fecha_creacion;
	
	public int getId_Permiso() {
		return id_Permiso;
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
}
