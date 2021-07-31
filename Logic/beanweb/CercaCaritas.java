package beanweb;

import controller.CercaCaritasController;
import controller.ShopHomeController;
import controller.UserHomeController;
import entity.CoordinateMap;
import exception.MyException;
import exception.Trigger;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import bean.LoginBoundary;


public class CercaCaritas {

	private static Logger logger = LoggerFactory.getLogger(LoginBoundary.class.getName());
	public enum MarkerType {
		CARITAS, EVENTO, DONAZIONE, MAP
	}
	
	private int idCaritas;
	private int idEvento;

	private String ruolo;
	private int idUser;
	private String v = "Volontario";
	private String n = "Negozio";
	
	private Trigger trigger;



	private CercaCaritasController cercaController;
	private DonationBoundary donationBoundary;
	private PrenotaTurnoBoundary prenotaTurnoBoundary;
	private BachecaBoundary bachecaBoundary;
	private PartecipaEventoBoundary partecipaEventoBoundary;
	private PromuoviEventoBoundary promuoviEventoBoundary;
	private UserHomeBoundary userHomeBoundary;
	private ShopHomeBoundary shopHomeBoundary;
	
	private static CercaCaritas instance  = null;
	
	public static CercaCaritas getInstance(){
		if(instance == null) {
			instance = new CercaCaritas();
		}
		return instance;
		}
	
	
	
	
	public void indietro() {
	if (ruolo.equals(v)) {				
				userHomeBoundary = userHomeBoundary.getInstance();
				UserHomeController userHomeController = new UserHomeController();
				userHomeController.initDataCont(this.idUser,userHomeBoundary);
	}
	else if(ruolo.equalsIgnoreCase(n)) {
			shopHomeBoundary = ShopHomeBoundary.getInstance();
			ShopHomeController shopHomeC = new ShopHomeController();
			shopHomeC.initDataShop(this.idUser, shopHomeBoundary);
		}
	}
	
	
	public void promuoviEvento(int idCar) {
		if(idCar != 0) {
			promuoviEventoBoundary = promuoviEventoBoundary.getInstance();
			promuoviEventoBoundary.loadFormBoundary(idCar, this.idUser);
		}else {
			try {
				trigger.myTrigger();
			} catch (MyException e) {
				logger.error("Bisogna selezionare un marker");
			}
		}
	}


	public  void vediNecessita(int idCar) {
			bachecaBoundary = bachecaBoundary.getInstance();
			bachecaBoundary.loadFormBoundary(idCar, this.idUser);
	}

	public void creaDonazione(int idCar) {
			donationBoundary =  donationBoundary.getInstance();
			donationBoundary.initBoundary(idCar, this.idUser);
	}

	public void prenotaTurno(int idCar) {
			prenotaTurnoBoundary = prenotaTurnoBoundary.getInstance();
			prenotaTurnoBoundary.setData(idCar, this.idUser);		
	}
	

	public void partecipaEvento(int idEvent) {
			partecipaEventoBoundary = partecipaEventoBoundary.getInstance();
			partecipaEventoBoundary.setData(idEvent, this.idUser);
		}

	

	public CercaCaritas(){
		cercaController = new CercaCaritasController();
		trigger = new Trigger();
	}

	public String trovaRuoloBean() {
		return cercaController.trovaRuolo(this.idUser);
	}
	

	public List<CoordinateMap> initMarkersCaritas() {
		return cercaController.initMarkerCar();
	}

	public List<CoordinateMap> initMarkersEvento() {
		return cercaController.initMarkerEvent();
	}
	
	public List<CoordinateMap> initMarkersDonazione() {
		return cercaController.initMarkerDonation();
	}
	
	public void initMarkerIndicatore(int id){
		 cercaController.initMap2(idCaritas, ruolo, n);
	}
	
	public int getIdEvento() {
		return idEvento;
	}
	public void setIdEvento(int idEvento) {
		this.idEvento = idEvento;
	}
	
	public int getIdUte() {
		return this.idUser;
	}
	

	public void setUser(int id, String ruolo) {
		this.idUser = id;
		this.ruolo = ruolo;
		

	}
	public int getIdCaritas() {
		return idCaritas;
	}
	public void setIdCaritas(int idCaritas) {
		this.idCaritas = idCaritas;
	}
}
