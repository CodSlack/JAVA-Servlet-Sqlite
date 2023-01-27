package beans;
import java.text.SimpleDateFormat;
import java.util.regex.Pattern;
import java.util.Date;

public class Korisnik {
	private int id;
	private String firstname;
	private String lastname;
	private String password;
	private boolean super_user;
	private String date;
	private String gender;
	boolean isAdmin;
	private int money;
	
	

	public Korisnik() {
		// TODO Auto-generated constructor stub
	}
	
	public Korisnik(int id1,String firstname2, String lastname2, boolean supper_users, String gender2,String date1,int money1) {
		this.firstname=firstname2;
		this.id=id1;
		this.lastname=lastname2;
		if(supper_users)
		{
			this.super_user=true;
		}else {
			this.super_user=false;
		}
		this.gender=gender2;
		this.date=date1;
		this.money=money1;
	}
	public boolean isAdmin() {
		return isAdmin;
	}
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isSuper_user() {
		return super_user;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setSuper_user(boolean super_user) {
		this.super_user = super_user;
	}
	public String getDate() {
		return date;
	}
	public void setDate(Date date2) {
		
		  SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		  this.date=formatter.format(date2);		 
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public boolean checkPassword(String text)
	{
		if(Pattern.matches("^[a-zA-Z0-9&_#]{2,40}", text))
		{
			return true;
		}
		return false;
	}
	public boolean checkName(String name)
	{
		if(Pattern.matches("^[A-Z][a-z]{2,40}", name))
		{
			return true;
		}
		return false;
	}
	public int getPrice() {
		return money;
	}

	public void setPrice(int d) {
		this.money = d;
	}

}
