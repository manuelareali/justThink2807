package beanweb;

import controller.CaritasHomeController;
import controller.LoginController;
import controller.ShopHomeController;
import controller.UserHomeController;


public class LoginBoundary {



	private LoginController loginC = new LoginController();

	private beanweb.UserHomeBoundary userHomeBoundary;

	private beanweb.ShopHomeBoundary shopHomeBoundary;
	private beanweb.CaritasHomeBoundary caritasHomeBoundary;

	
	
		
	public String loginPressed(String username, String password) {
		UserHomeController userHomeController;
		if(username != null && !username.equals("") && password != null && !password.equals("")){
			int idUser = loginC.trovaID(username);
			String loggedUser = loginC.loginAccess(username, password);
			if (loggedUser.equalsIgnoreCase("Volontario")) {
				userHomeBoundary = userHomeBoundary.getInstance();				
				userHomeController = new UserHomeController();
				userHomeController.initDataCont(idUser, userHomeBoundary);
			} else if (loggedUser.equalsIgnoreCase("Caritas")) {
				caritasHomeBoundary = caritasHomeBoundary.getInstance();
				CaritasHomeController caritasHomeController = new CaritasHomeController();
				caritasHomeController.initDataCaritas(idUser, caritasHomeBoundary);
			} else if (loggedUser.equalsIgnoreCase("Negozio")) {
				shopHomeBoundary = shopHomeBoundary.getInstance();
				ShopHomeController shopHomeC = new ShopHomeController();
				shopHomeC.initDataShop(idUser, shopHomeBoundary);
			}
			return loggedUser;
		}
		return username;
	}
}


