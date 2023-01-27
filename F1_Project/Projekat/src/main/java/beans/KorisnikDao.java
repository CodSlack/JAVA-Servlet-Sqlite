package beans;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import beans.Korisnik;

public class KorisnikDao {
	
	Connection conn = null;

	protected void Database(String s) throws ClassNotFoundException, SQLException
	{
        Class.forName("org.sqlite.JDBC");
		conn=DriverManager.getConnection(s);
	}
	
	public Korisnik checkLoogin(String ime,String prezime,String sifra,String s) throws ClassNotFoundException, SQLException
	{
			 Database(s);
			 	
			 String sql ="SELECT * FROM korisnici WHERE firstname = ? and lastname = ? and password=? ";
			 
			 PreparedStatement statement = conn.prepareStatement(sql);
			 statement.setString(1, ime); 
			 statement.setString(2, prezime);
			 statement.setString(3, sifra);
			  
			 ResultSet result = statement.executeQuery();
			  
			 Korisnik user = null;
			  
			 if (result.next()) { 
		     user = new Korisnik();
		     user.setId(result.getInt("id"));
			 user.setFirstname(result.getString("firstname"));
			 user.setLastname(result.getString("lastname"));
			 user.setGender(result.getString("gender"));
			 user.setPassword(result.getString("password"));
			 user.setDate(Calendar.getInstance().getTime());
			 user.setAdmin(result.getBoolean("admin"));
			 user.setSuper_user(result.getBoolean("super_user"));
			 user.setPrice(result.getInt("money"));
			 }
			statement.close();
	        return user;
	}

	public int Dodaj(Korisnik k,String s) throws ClassNotFoundException, SQLException {
		 Database(s);
		 String sql="insert into korisnici values (NULL,?, ?, ?, ?, ?, ?, ?,?)";
		 PreparedStatement statement = conn.prepareStatement(sql);
         
		 statement.setString(1, k.getFirstname());
		 statement.setString(2, k.getLastname());
		 statement.setString(3, k.getDate());
		 statement.setString(4, k.getPassword());
		 statement.setBoolean(5, false);
		 statement.setBoolean(6, false);
		 statement.setString(7, k.getGender());
		 statement.setInt(8,  k.getPrice());
		 int isp=statement.executeUpdate();
		
		 statement.close();
		 return isp;
	}

	public List<Korisnik> getList(String s) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Database(s);
		List<Korisnik> korisnici=new ArrayList<>();
		String sql="select *from korisnici";
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();
		while (resultSet.next()) {
			int id=resultSet.getInt("id");
			String firstname = resultSet.getString("firstname");
            String lastname = resultSet.getString("lastname");
            boolean supper_user = resultSet.getBoolean("super_user");
            String gender=resultSet.getString("gender").toUpperCase(); 
            String date=resultSet.getString("date");
            int money1=resultSet.getInt("money");
            if(!firstname.equals("Admin") && !lastname.equals("Admin")) {
            Korisnik kor = new Korisnik(id,firstname, lastname, supper_user,gender,date,money1);
            korisnici.add(kor);
            }
        }
		statement.close();
		
		return korisnici;
	}

	public List<Karte> getKarte(String track,String s) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Database(s);
		List<Karte> kartice=new ArrayList<>();
		Karte karte=null;
		String sql="select *from karte where name=?";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setString(1, track); 
		ResultSet result = statement.executeQuery();
		 while(result.next()) { 
		     karte = new Karte();
		     karte.setId(result.getInt("id"));
			 karte.setName(result.getString("name"));
			 karte.setNumber(result.getInt("number"));
			 karte.setPrice(result.getFloat("price"));
			 karte.setStand(result.getString("stand"));
			 karte.setSuper_user(result.getInt("super_user"));
			 kartice.add(karte);
			 }
			statement.close();
	        return kartice;
	}

	public Karte dajKartu(int i,String s) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Database(s);
		Karte karte=null;
		String sql="select *from karte where id=?";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setInt(1, i); 
		ResultSet result = statement.executeQuery();
		 if (result.next()) { 
		     karte = new Karte();
		     karte.setId(result.getInt("id"));
			 karte.setName(result.getString("name"));
			 karte.setNumber(result.getInt("number"));
			 karte.setPrice(result.getFloat("price"));
			 karte.setStand(result.getString("stand"));
			 karte.setSuper_user(result.getInt("super_user"));
			 }
			statement.close();
	        return karte;
	}

	public void updateKartu(int i, String s,int broj) throws ClassNotFoundException, SQLException {
        
		Database(s);
		String sql = "UPDATE karte SET number = ? where id=?";
		PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, broj);
        statement.setInt(2, i);
    
        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();
        return;
		
	}

	public boolean updateUser(int id, String name, String lastname, String password,String t) throws ClassNotFoundException, SQLException {
		Database(t);
		String sql = "UPDATE korisnici SET firstname = ? and lastname=? and password=?  where id=?";
		PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, name);
        statement.setString(2, lastname);
        statement.setString(3, password);
        statement.setInt(4, id);
        
        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();
        return rowUpdated;
		
	}

	public void deleteUser(int id,String t) throws ClassNotFoundException, SQLException {
		Database(t);
		String sql = "delete from korisnici where id=?";
		PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, id);
     
        
        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();		
	}

	public void editUser(int id, String t,String yes) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Database(t);
		String sql = "update korisnici set super_user=? where id=?";
		PreparedStatement statement = conn.prepareStatement(sql);
		if(yes!=null) {
		if(yes.equals("1")) {
		statement.setBoolean(1, true);
		}
		else {
			statement.setBoolean(1, false);
		}
		}
        statement.setInt(2, id);
        
        
        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();	
	}

	public List<beans.Karte> dajKarte(String s) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Database(s);
		Karte karte=null;
		String sql="select *from karte";
		List<beans.Karte>kartice=new ArrayList<Karte>();
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet result = statement.executeQuery();
		while(result.next()) { 
		     karte = new Karte();
		     karte.setId(result.getInt("id"));
			 karte.setName(result.getString("name"));
			 karte.setNumber(result.getInt("number"));
			 karte.setPrice(result.getFloat("price"));
			 karte.setStand(result.getString("stand"));
			 karte.setSuper_user(result.getInt("super_user"));
			 kartice.add(karte);
			 }
			statement.close();
	        return kartice;
	}

	public void deleteKarte(int id, String t) throws ClassNotFoundException, SQLException {
		Database(t);
		String sql = "delete from karte where id=?";
		PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, id);
 
        
        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();	
		
	}
	public Korisnik dajKorisnikId(int id, String t) throws ClassNotFoundException, SQLException {
		Database(t);
		String sql = "select* from korisnici where id=?";
		PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, id);
        Korisnik k=new Korisnik();
		ResultSet resultSet = statement.executeQuery();
		 if (resultSet.next()) { 
		     int tt=resultSet.getInt("id");
			 String firstname = resultSet.getString("firstname");
	         String lastname = resultSet.getString("lastname");
	         boolean supper_user = resultSet.getBoolean("super_user");
	         String gender=resultSet.getString("gender").toUpperCase(); 
	         String date=resultSet.getString("date");
	         int money=resultSet.getInt("money");
	         k=new Korisnik(tt, firstname, lastname, supper_user, gender, date, money);
			 }
			statement.close();
	        return k;
        
		
	}
	public void insertKare(String s, String name, String stand, float price,int number_of_seats) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		 Database(s);
		 String sql="insert into karte values (NULL,?, ?, ?,?,?)";
		 PreparedStatement statement = conn.prepareStatement(sql);
        
		 statement.setString(1, name);
		 statement.setString(2, stand);
		 statement.setInt(3,number_of_seats);
		 statement.setFloat(4, price);
		 statement.setInt(5, 1);

		 int isp=statement.executeUpdate();
		
		 statement.close();
		 return ;
	}

	public void updateMoney(int id, int money, String t,int m) throws ClassNotFoundException, SQLException {
		Database(t);
		String sql = "update korisnici set money=? where id=?";
		PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1,m-money);
        statement.setInt(2, id);
		int isp=statement.executeUpdate();
		statement.close();
		return;
	}

	public void updateMoneyAdmin(int id, String t) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Database(t);
		String sql = "update korisnici set money=? where id=?";
		PreparedStatement statement = conn.prepareStatement(sql);
		Korisnik k=dajKorisnikId(id, t);
        statement.setInt(1,k.getPrice()+2500);
        statement.setInt(2, id);
		int isp=statement.executeUpdate();
		statement.close();
		return;
	}

	public void updateTickets(int id, String t) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Database(t);
		String sql = "UPDATE karte SET number = ? where id=?";
		PreparedStatement statement = conn.prepareStatement(sql);
		Karte k=dajKartu(id, t);
        statement.setInt(1, k.getNumber()+200);
        statement.setInt(2, id);
       
        
        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();
	}


	
	
}
