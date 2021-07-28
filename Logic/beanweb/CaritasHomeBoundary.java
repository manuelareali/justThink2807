package beanweb;


public class CaritasHomeBoundary {

	
	private int idCar;
	
	private static CaritasHomeBoundary instance = null;

	private GestisciTurniBoundary gestTurn;
	private GestisciDonazioniBoundary gestDon;
	private GestisciEventiCaritasBoundary gestisciB;
	private BachecaPersonaleBoundary bacheca;



	public static CaritasHomeBoundary getInstance() {
		if (instance == null) {
			instance = new CaritasHomeBoundary();
		}
		return instance;
	}

	private CaritasHomeBoundary() {
		bacheca = bacheca.getInstance();
		gestTurn = gestTurn.getInstance();
		gestDon = gestDon.getInstance();
		gestisciB = gestisciB.getInstance();
	}

	public void gestisciDonazioni() {		
		gestDon.getInstance().loadFormBoundary(idCar);
	}

	
	public void gestisciEventi() {			
			gestisciB.getInstance().loadShop(idCar);
	}

	
	public void gestisciTurni() {
			gestTurn.getInstance().loadFormBoundary(idCar);
	}

	public void visualizzaBacheca() {		
			bacheca.getInstance().loadFormBoundary(idCar);
	}

	public void initDataC(int id, String nome) {
		this.idCar = id;
	}

}