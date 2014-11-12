package modelo;

import java.util.Date;
import java.text.*;

public class Mensaje {

	int idMensaje;
	int idEstado;
	String dsEstado;
	Date feExpiracion ;
	String dsMensaje ;
	
	

	public String getdsEstado() {
		return dsEstado;
	}
	public void setdsEstado(String dsEstado) {
		this.dsEstado = dsEstado;
	}
	
	public int getIdMensaje() {
		return idMensaje;
	}
	public void setIdMensaje(int idMensaje) {
		this.idMensaje = idMensaje;
	}
	public int getIdEstado() {
		return idEstado;
	}
	public void setIdEstado(int idEstado) {
		this.idEstado = idEstado;
	}
	public String getFeExpiracionString() {

		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		return df.format(feExpiracion);

	}

	public void setFeExpiracion(Date feExpiracion) {
		this.feExpiracion = feExpiracion;
	}
	public String getDsMensaje() {
		return dsMensaje;
	}
	public void setDsMensaje(String dsMensaje) {
		this.dsMensaje = dsMensaje;
	}
	
	
}
