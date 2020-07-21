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

	public static List<Auto> filtroRicerca(Date dataInizioNoleggio, Date dataFineNoleggio, String marca, String modello, String tipologiaAuto, BusinessLogicAuto businessLogicAuto, BusinessLogicNoleggio businessLogicNoleggio) {
		List <Auto> autoConFiltri = businessLogicAuto.getListaAutoConFiltri(marca, modello, tipologiaAuto);
		List<Integer> idAutoNonDisponibili = businessLogicNoleggio.getIdAutoNonDisponibili(dataInizioNoleggio, dataFineNoleggio);
		int autoConFiltriSize = autoConFiltri.size();
		int idAutoNonDisponibiliSize = idAutoNonDisponibili.size();

		if (idAutoNonDisponibiliSize>0 && autoConFiltriSize>0) {
			List<Auto> autoNoleggioFiltri = new ArrayList<>();
			for (int i=0; i<autoConFiltriSize; i++) {
				Auto autoCorrente = autoConFiltri.get(i);
				for (int j=0; j<idAutoNonDisponibiliSize; j++) {
					int idAutoNonDisponibile = idAutoNonDisponibili.get(j);
					boolean checkIdAuto = autoCorrente.getIdAuto() != idAutoNonDisponibile;
					if (checkIdAuto) {
						autoNoleggioFiltri.add(autoCorrente);
					}
				}

			}

			return autoNoleggioFiltri;
		}
		System.out.println("autoConFiltri: " + autoConFiltri);
		return autoConFiltri;
	}
	
		
}
