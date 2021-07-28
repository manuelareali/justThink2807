package test;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class SeleniumTestTwo {
	
	public static void main(String[] args) throws InterruptedException {
		System.setProperty("webdriver.chrome.driver", "WebContent/WEB-INF/lib/chromedriver.exe");
			
			WebDriver driver = new ChromeDriver();
			driver.get("http://localhost:8080/justFinal/view/creaDonazioneMap.jsp");
			
		
			
			driver.findElement(By.xpath("/html/body/form/div[2]/h3[2]/input[2]")).click();
			driver.findElement(By.xpath("//*[@id=\"IndirizzoVolontario\"]")).sendKeys("via Roma");
			driver.findElement(By.xpath("//*[@id=\"descrizione\"]")).sendKeys("Ho donato 3kg di pasta");
			
			Thread.sleep(2000);
			
			driver.close();
			
		}
}
