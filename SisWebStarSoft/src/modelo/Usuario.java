package modelo;

import java.util.Date;

public class Usuario {
	private int id_Usuario;
	private String nombre_Usuario;
	private String paterno_Usuario;
	private String materno_Usuario;
	private int id_Genero;
	private int id_Tipo_Documento;
	private String NroDocumento;
	private String correo_Usuario;
	private String celular_Usuario;
	private String password_Usuario;
	private int id_Tipo_Usuario;
	private String nombre_Tipo_Usuario;
	private int id_Centro_Informacion;
	private Date fecha_creacion;
	private Date fecha_modificacion;
	
	public int getId_Usuario() {
		return id_Usuario;
	}
	public void setId_Usuario(int id_Usuario) {
		this.id_Usuario = id_Usuario;
	}
	public String getNombre_Usuario() {
		return nombre_Usuario;
	}
	public void setNombre_Usuario(String nombre_Usuario) {
		this.nombre_Usuario = nombre_Usuario;
	}
	public String getPaterno_Usuario() {
		return paterno_Usuario;
	}
	public void setPaterno_Usuario(String paterno_Usuario) {
		this.paterno_Usuario = paterno_Usuario;
	}
	public String getMaterno_Usuario() {
		return materno_Usuario;
	}
	public void setMaterno_Usuario(String materno_Usuario) {
		this.materno_Usuario = materno_Usuario;
	}
	public int getId_Genero() {
		return id_Genero;
	}
	public void setId_Genero(int id_Genero) {
		this.id_Genero = id_Genero;
	}
	public int getId_Tipo_Documento() {
		return id_Tipo_Documento;
	}
	public void setId_Tipo_Documento(int id_Tipo_Documento) {
		this.id_Tipo_Documento = id_Tipo_Documento;
	}
	public String getCelular_Usuario() {
		return celular_Usuario;
	}
	public void setCelular_Usuario(String celular_Usuario) {
		this.celular_Usuario = celular_Usuario;
	}
	public String getNroDocumento() {
		return NroDocumento;
	}
	public void setNroDocumento(String nroDocumento) {
		NroDocumento = nroDocumento;
	}
	public String getCorreo_Usuario() {
		return correo_Usuario;
	}
	public void setCorreo_Usuario(String correo_Usuario) {
		this.correo_Usuario = correo_Usuario;
	}
	public String getPassword_Usuario() {
		return password_Usuario;
	}
	public void setPassword_Usuario(String password_Usuario) {
		this.password_Usuario = password_Usuario;
	}
	public int getId_Tipo_Usuario() {
		return id_Tipo_Usuario;
	}
	public void setId_Tipo_Usuario(int id_Tipo_Usuario) {
		this.id_Tipo_Usuario = id_Tipo_Usuario;
	}
	public Date getFecha_creacion() {
		return fecha_creacion;
	}
	public void setFecha_creacion(Date fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}
	public int getId_Centro_Informacion() {
		return id_Centro_Informacion;
	}
	public void setId_Centro_Informacion(int id_Centro_Informacion) {
		this.id_Centro_Informacion = id_Centro_Informacion;
	}
	public Date getFecha_modificacion() {
		return fecha_modificacion;
	}
	public void setFecha_modificacion(Date fecha_modificacion) {
		this.fecha_modificacion = fecha_modificacion;
	}
	public String getNombre_Tipo_Usuario() {
		return nombre_Tipo_Usuario;
	}
	public void setNombre_Tipo_Usuario(String nombre_Tipo_Usuario) {
		this.nombre_Tipo_Usuario = nombre_Tipo_Usuario;
	}
}
