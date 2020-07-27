package com.comunenapoli.progetto.businessLogic;

import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.comunenapoli.progetto.model.CalendarioChiusure;

public class CalendarioChiusureDao implements DaoInterface<CalendarioChiusure> {

	private EntityManager manager = null;

	public CalendarioChiusureDao()
	{
		this(null);
	}
	
	public CalendarioChiusureDao(EntityManager entityManager)
	{
		setManager(entityManager);
	}

	public EntityManager getManager() {
		return manager;
	}

	public void setManager(EntityManager manager) {
		this.manager = manager;
	}
	
	@Override
	public void create(CalendarioChiusure calendarioChiusure) {
		manager.persist(calendarioChiusure);
	}

	@Override
	public List<CalendarioChiusure> retrieve() {
		TypedQuery<CalendarioChiusure> query = manager.createQuery("from CalendarioChiusure",CalendarioChiusure.class);
		List<CalendarioChiusure> listaChiusure = query.getResultList();
		return listaChiusure;
	}

	@Override
	public void update(CalendarioChiusure calendario) {
		manager.persist(calendario);
	}

	@Override
	public void delete(CalendarioChiusure calendario) {
		manager.remove(calendario);
	}
	
	public CalendarioChiusure findByDataInizioDataFine(Date dataInizio, Date dataFine) {
		TypedQuery<CalendarioChiusure> query;
		query = manager.createQuery("select c from CalendarioChiusure c where c.dataInizio between :x and :y",CalendarioChiusure.class);
		query = query.setParameter("x",dataInizio).setParameter("y", dataFine);
		CalendarioChiusure chiusura = query.getResultList().stream().findFirst().orElse(null);
		System.out.println("chiusura: ");
		System.out.println(chiusura);
		return chiusura;
	}
	
	
	//ritorna true se è aperto e quindi si può aggiungere il noleggio
	public boolean findByDataInizioUtente(Date dataInizio) {
		TypedQuery<CalendarioChiusure> query;
		query = manager.createQuery("select c from CalendarioChiusure c where c.dataInizio b :x or c.dataFine > :y",CalendarioChiusure.class);
		query = query.setParameter("x",dataInizio).setParameter("y", dataInizio);
		CalendarioChiusure calendarioChiusure = query.getResultList().stream().findFirst().orElse(null);
		boolean isAperto = calendarioChiusure==null;
		return isAperto;
	}
	
	public CalendarioChiusure findChiusuraByIdCalendario(Integer idCalendario) {
		CalendarioChiusure calendarioChiusure = manager.createQuery("select c from CalendarioChiusure c where c.idCalendario = :x",CalendarioChiusure.class).
				setParameter("x",idCalendario).getResultList().stream().findFirst().orElse(null);
		return calendarioChiusure;
	}
	
}
