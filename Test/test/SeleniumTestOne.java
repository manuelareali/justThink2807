package test;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class SeleniumTestOne {

	public static void main(String[] args) throws InterruptedException {
		System.setProperty("webdriver.chrome.driver", "WebContent/WEB-INF/lib/chromedriver.exe");
			
			WebDriver driver = new ChromeDriver();
			driver.get("http://localhost:8080/justFinal/view/contattaCaritasMap.jsp");
			
		
			driver.findElement(By.xpath("//*[@id=\"codice_mittente\"]")).sendKeys("c");
			driver.findElement(By.xpath("//*[@id=\"codice_destinatario\"]")).sendKeys("R");
			driver.findElement(By.xpath("//*[@id=\"oggetto\"]")).sendKeys("Turno volontariato");
			driver.findElement(By.xpath("//*[@id=\"messaggio\"]")).sendKeys("Abbiamo bisogno che tu venga 1h prima dell'inizio del turno.");
			
			Thread.sleep(2000);
			
			driver.close();
			
		}
	
}
