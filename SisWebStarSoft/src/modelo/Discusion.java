package modelo;

import java.util.Date;

public class Discusion {
	private int id_Discusion;
	private int id_Idea;
	private int id_Usuario;
	private String comentario;
	private int id_DiscusionPadre;
	private Date fecha_creacion;
	private String usuario_Comentario;
	
	public String getUsuario_Comentario() {
		return usuario_Comentario;
	}
	public void setUsuario_Comentario(String usuario_Comentario) {
		this.usuario_Comentario = usuario_Comentario;
	}
	public int getId_Discusion() {
		return id_Discusion;
	}
	public void setId_Discusion(int id_Discusion) {
		this.id_Discusion = id_Discusion;
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
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	public int getId_DiscusionPadre() {
		return id_DiscusionPadre;
	}
	public void setId_DiscusionPadre(int id_DiscusionPadre) {
		this.id_DiscusionPadre = id_DiscusionPadre;
	}
	public Date getFecha_creacion() {
		return fecha_creacion;
	}
	public void setFecha_creacion(Date fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}
}
