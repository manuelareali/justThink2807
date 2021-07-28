package beanweb;

public class ShopHomeBoundary {
	

	private int idShop;
	private GestisciEventiBoundary gestisciBoundary;
	private static ShopHomeBoundary instance = null;
	

		public static ShopHomeBoundary getInstance() {
			if (instance == null) {
				instance = new ShopHomeBoundary();
				}
			return instance;
		}

		private ShopHomeBoundary() {
			 gestisciBoundary = gestisciBoundary.getInstance();
		}
		
    public void cercaCaritas(){
    	TransizionePagine switchPage = new TransizionePagine();
    	switchPage.apriMappa(this.idShop);
    }



   
    public void gestisciEventi() {
    	gestisciBoundary.getInstance().loadShopBean(idShop);
    }

  



	public void initData(int id, String nome) {
		this.idShop = id;	
	}





}

