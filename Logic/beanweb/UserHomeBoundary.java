package beanweb;


import bean.ProfileBoundary;
import controller.ProfileController;
import controller.UserHomeController;



public class UserHomeBoundary{

	private int userId;
	


	
	private static UserHomeBoundary instance = null;
	
	public static UserHomeBoundary getInstance() {
		if (instance == null) {
			instance = new UserHomeBoundary();
			}
		return instance;
	}
	

    public void deleteAccountButtonPressed() {
    	//this.userController.deleteAccount(userId);
    }

   
   public  void profileButtonPressed() {
    	ProfileBoundary profileBean = null;
    	ProfileController profileController = new ProfileController();
			profileController.initData(userId, profileBean);
		}
  
  


    public int  searchCaritasButtonPressed(){
    	TransizionePagine switchPage = new TransizionePagine();
    	switchPage.apriMappa(this.userId);
    	return 0;
    }
 

	public void initData(int id, String nome, String Cognome) {
        this.userId = id;
  
    }
}





