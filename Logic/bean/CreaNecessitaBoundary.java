package bean;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.CreaNecessitaController;
import exception.MyException;
import exception.Trigger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextArea;
import javafx.stage.Stage;
import javafx.stage.Window;

public class CreaNecessitaBoundary {
	private int caritas;
	private Logger logger = LoggerFactory.getLogger(CreaNecessitaBoundary.class.getName());
	private String[] tipo = { "Vestiti", "Cibo" };
	private String[] urg = { "Alta", "Normale", "Bassa" };

	private TextArea[] text;
	private Trigger trigger;

	public CreaNecessitaBoundary() {
		trigger = new Trigger();
	}

	@FXML
	private TextArea descrizione;

	@FXML
	private ChoiceBox<String> tipologia;

	@FXML
	private ChoiceBox<String> urgenza;

	@FXML
	private Button creaAnnuncio;

	@FXML
	private Button back;

	private int idCaritas;

	@FXML
	void backPressed(ActionEvent event) {
		this.switchPage(back.getScene().getWindow());

	}

	public boolean checker() {
		// Controlla che non ci siano campi lasciati vuoti
		if (text[0].getText().isEmpty()) {
			return false;
		}
		if (tipologia.getValue() != null && urgenza.getValue() != null) {
			return true;
		}
		return true;
	}

	@FXML
	void creaAnnuncioPressed(ActionEvent event) {

		CreaNecessitaController creaNec = new CreaNecessitaController();
		creaNec.inizializza(idCaritas);
		if (checker()) {
			int i = creaNec.creaNecessita(tipologia.getValue().toString(), urgenza.getValue().toString(),
					descrizione.getText());
			if (i == 0) {
				this.switchPage(creaAnnuncio.getScene().getWindow());
			} else {
				logger.trace("errore nella creazione dell'annuncio");
			}
		} else {
			try {
				trigger.myTrigger();
			} catch (MyException e) {
				logger.error("Alcuni campi sono vuoti");
			}
		}
	}

	@FXML
	void initialize() {
		tipologia.getItems().addAll(tipo);
		urgenza.getItems().addAll(urg);
		text = new TextArea[] { this.descrizione };

	}

	public void setCaritas2(int caritas2) {
		this.idCaritas = caritas2;
	}

	public void switchPage(Window stage) {
		try {
			FXMLLoader loader = new FXMLLoader(getClass().getResource("/boundary/Bacheca_Personale.fxml"));
			Parent root = loader.load();

			Stage home = (Stage) stage;
			home.setScene(new Scene(root, 775, 500));
			home.show();

			BachecaPersonaleBoundary bacheca = loader.getController();
			bacheca.loadFormBoundary(caritas);

		} catch (IOException e) {
			logger.error(e.getMessage());
		}
	}

}
