package starsoft.modelo;

public class CentroFormacion {

	int id_CentroFormacion;
	String nom_CentroFormacion;
	int id_TipoCentroFormacion;
	String ds_TipoCentroFormacion;
	String Url_CentroFormacion;
	double Ss_Pago;
	
	
	public double getSs_Pago() {
		return Ss_Pago;
	}
	public void setSs_Pago(double ss_Pago) {
		Ss_Pago = ss_Pago;
	}
	public String getDs_TipoCentroFormacion() {
		return ds_TipoCentroFormacion;
	}
	public void setDs_TipoCentroFormacion(String ds_TipoCentroFormacion) {
		this.ds_TipoCentroFormacion = ds_TipoCentroFormacion;
	}
	public int getId_CentroFormacion() {
		return id_CentroFormacion;
	}
	public void setId_CentroFormacion(int id_CentroFormacion) {
		this.id_CentroFormacion = id_CentroFormacion;
	}
	public String getNom_CentroFormacion() {
		return nom_CentroFormacion;
	}
	public void setNom_CentroFormacion(String nom_CentroFormacion) {
		this.nom_CentroFormacion = nom_CentroFormacion;
	}
	public int getId_TipoCentroFormacion() {
		return id_TipoCentroFormacion;
	}
	public void setId_TipoCentroFormacion(int id_TipoCentroFormacion) {
		this.id_TipoCentroFormacion = id_TipoCentroFormacion;
	}
	public String getUrl_CentroFormacion() {
		return Url_CentroFormacion;
	}
	public void setUrl_CentroFormacion(String url_CentroFormacion) {
		Url_CentroFormacion = url_CentroFormacion;
	}
	
	
	
}
