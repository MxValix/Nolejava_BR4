package com.comunenapoli.progetto.utils;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.comunenapoli.progetto.businessLogic.AutoDao;
import com.comunenapoli.progetto.businessLogic.BusinessLogicAuto;
import com.comunenapoli.progetto.businessLogic.BusinessLogicNoleggio;
import com.comunenapoli.progetto.businessLogic.CalendarioChiusureDao;
import com.comunenapoli.progetto.businessLogic.NoleggioDao;
import com.comunenapoli.progetto.model.Auto;
import com.comunenapoli.progetto.model.CalendarioChiusure;
import com.comunenapoli.progetto.model.Noleggio;

public class BusinessLogicAutoNoleggioUtils {

	//dorebbe avere un model con cui comunicare, non così
	/*public static void filtroRicerca(Date dataInizioNoleggio, Date dataFineNoleggio, String tipologiaAuto, String marcaAuto,
			String cambio, Integer numeroPosti, Double prezzoAutoPerGiorno, BusinessLogicNoleggio businessLogicNoleggio, BusinessLogicAuto businessLogicAuto) {
		List<Integer> idAutoNonDisponibili = businessLogicNoleggio.getIdAutoNonDisponibili(dataInizioNoleggio, dataFineNoleggio);
		List<Auto> autoDisponibili = businessLogicAuto.getAutoDisponibili(idAutoNonDisponibiliList)

	}
	 */

	public static List<Auto> filtroRicerca(Date dataInizioNoleggio, Date dataFineNoleggio, String tipologiaAuto, BusinessLogicAuto businessLogicAuto, BusinessLogicNoleggio businessLogicNoleggio) {
		List <Integer> idAutoNonDisponibili = businessLogicNoleggio.getIdAutoNonDisponibili(dataInizioNoleggio, dataFineNoleggio);
		List <Auto> autoDisponibili = businessLogicAuto.getAutoDisponibili(idAutoNonDisponibili);
		List <Auto> risultati = new ArrayList<Auto>();
		boolean checkTipologiaAuto = tipologiaAuto ==null || tipologiaAuto.isEmpty() || tipologiaAuto.equals("");
		if (checkTipologiaAuto) {
			return autoDisponibili;
		}else {
			for (Auto auto: autoDisponibili) {
				if (auto.getTipologiaAuto().equals(tipologiaAuto)) {
					risultati.add(auto);
				}
			}
		}

		return risultati;
	}
/*
	public static List<Auto> filtroRicerca(Date dataInizioNoleggio, Date dataFineNoleggio, String marca, String modello, String tipologiaAuto, BusinessLogicAuto businessLogicAuto, BusinessLogicNoleggio businessLogicNoleggio) {
		List <Auto> autoConFiltri = businessLogicAuto.getListaAutoConFiltri(marca, modello, tipologiaAuto);
		List<Integer> idAutoNonDisponibili = businessLogicNoleggio.getIdAutoNonDisponibili(dataInizioNoleggio, dataFineNoleggio);
		int autoConFiltriSize = autoConFiltri.size();
		int idAutoNonDisponibiliSize = idAutoNonDisponibili.size();
		List<Auto> autoNoleggioFiltri = new ArrayList<>();
		if (idAutoNonDisponibiliSize>0 && autoConFiltriSize>0) {
			for (int i=0; i<autoConFiltriSize; i++) {
				boolean check = false;
				Auto autoCorrente = autoConFiltri.get(i);
				Integer idAutoCorrente = autoCorrente.getIdAuto();
				for (int j=0; j<idAutoNonDisponibiliSize;j++) {
					if (idAutoCorrente==idAutoNonDisponibili.get(j)) {
						check=true;
				    }
				}
				if (!check) autoNoleggioFiltri.add(autoCorrente);
			}
			return autoNoleggioFiltri;
		}
		return autoConFiltri;
	}
	*/

	public static List<Auto> filtroRicerca(Date dataInizioNoleggio, Date dataFineNoleggio, String marcaAuto, String modelloAuto,
			String cambioAuto, Integer numeroPosti, String tipologiaCarburante, String tipologiaAuto,
			BusinessLogicAuto businessLogicAuto, BusinessLogicNoleggio businessLogicNoleggio) {
		List <Auto> autoConFiltri = businessLogicAuto.getListaAutoConFiltri(marcaAuto, modelloAuto, tipologiaAuto, tipologiaCarburante, cambioAuto, numeroPosti);
		List<Integer> idAutoNonDisponibili = businessLogicNoleggio.getIdAutoNonDisponibili(dataInizioNoleggio, dataFineNoleggio);
		int autoConFiltriSize = autoConFiltri.size();
		int idAutoNonDisponibiliSize = idAutoNonDisponibili.size();
		List<Auto> autoNoleggioFiltri = new ArrayList<>();
		if (idAutoNonDisponibiliSize>0 && autoConFiltriSize>0) {
			for (int i=0; i<autoConFiltriSize; i++) {
				boolean check = false;
				Auto autoCorrente = autoConFiltri.get(i);
				Integer idAutoCorrente = autoCorrente.getIdAuto();
				for (int j=0; j<idAutoNonDisponibiliSize;j++) {
					if (idAutoCorrente==idAutoNonDisponibili.get(j)) {
						check=true;
				    }
				}
				if (!check) autoNoleggioFiltri.add(autoCorrente);
			}
			return autoNoleggioFiltri;
		}
		return autoConFiltri;
	}
}
