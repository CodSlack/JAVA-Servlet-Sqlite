package beans;

public class Obradi {
	 public String ConnecitionString(String webRootPath)
	    {
	    	String s="jdbc:sqlite:";
	        String niz[]=webRootPath.split("/");
	        for (int i = 0; i < niz.length; i++) {
	        	if(niz[i].equals(".metadata"))
	        	{
	        		break;
	        	}
	        	s+=niz[i]+"\\";  
			}
		 	
	        s+="Projekat\\src\\main\\webapp\\databse\\korisnici.db";
	        return s;
	    }
}
