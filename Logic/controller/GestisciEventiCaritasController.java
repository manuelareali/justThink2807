package controller;

import java.util.List;
import dao.EventoDao;
import entity.EventTab;

public class GestisciEventiCaritasController {

	private EventoDao eventDao;

	public List<EventTab> caricaEventi(int idCaritas) {

		return this.eventDao.cercaEventiCaritas(idCaritas);

	}

	public GestisciEventiCaritasController() {
		eventDao = new EventoDao();
	}

	public boolean cancellaEvento(int idEvento) {
		return eventDao.cancellaEvento(idEvento);
	}

}
