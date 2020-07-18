package com.comunenapoli.progetto.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Patente {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idPatente = null;
	
	@Column(unique = true)
	private String numeroPatente = null;
	private Date dataScadenza = null;
	
	@OneToOne
	private Utente utente = null;

	public Patente() {
		this(null,null,null);
	}

	public Patente(String numeroPatente, Date dataScadenza,  Utente utente) {
		this.numeroPatente = numeroPatente;
		this.dataScadenza = dataScadenza;
		this.utente = utente;
	}

	public Integer getIdPatente() {
		return idPatente;
	}

	public void setIdPatente(Integer idPatente) {
		this.idPatente = idPatente;
	}

	public String getNumeroPatente() {
		return numeroPatente;
	}

	public void setNumeroPatente(String numeroPatente) {
		this.numeroPatente = numeroPatente;
	}

	public Date getDataScadenza() {
		return dataScadenza;
	}

	public void setDataScadenza(Date dataScadenza) {
		this.dataScadenza = dataScadenza;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}
}
