package tiger.api.test.fake;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.github.javafaker.Faker;

public class DataGenerator {
	
	//this is to generate fake email address. 
	public static String getEmail() {
		Faker faker = new Faker(); 
		return faker.name().firstName() 
				+ faker.name().lastName() 
				+ "@gmail.com";
	}
	
	
	//this is to generate fake phone number
	public static String getPhoneNumber() {
		Faker faker = new Faker(); 
		return faker.phoneNumber().cellPhone();
	}
	
	public static String getFirstName() {
		Faker faker = new Faker(); 
		return faker.name().firstName(); 
	}
	
	/**
	 * Get random Last name
	 * @return
	 */
	public static String getLastName() {
		Faker faker = new Faker(); 
		return faker.name().lastName(); 
	}
	
	//I made some changes here
	public static String getDob() {
		Faker faker = new Faker(); 
		Date date = faker.date().birthday();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(date);
	}


}
