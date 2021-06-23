package it.unisa.model;

import java.sql.Date;

public class CardBean {
	private String codice;
	private String retro;
	private Date scadenza;
	public String getCodice() {
		return codice;
	}
	public void setCodice(String codice) {
		this.codice = codice;
	}
	public String getRetro() {
		return retro;
	}
	public void setRetro(String retro) {
		this.retro = retro;
	}
	public Date getScadenza() {
		return scadenza;
	}
	public void setScadenza(Date scadenza) {
		this.scadenza = scadenza;
	}

}
