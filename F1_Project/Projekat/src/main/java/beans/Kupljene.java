package beans;

public class Kupljene {
	private int id;
	private int id_korisnika;
	private int id_karte;
	private String name_karte;
	private int cena_karte;
	private int broj_ku;
	


	public Kupljene()
	{
		
	}
	
	public Kupljene(int id_korisnika2, int id_karte1, String name, int broj_ku1, int cena) {
		this.id_korisnika=id_korisnika2;
		this.id_karte=id_karte1;
		this.broj_ku=broj_ku1;
		this.cena_karte=cena;
	}
	public int getBroj_ku() {
		return broj_ku;
	}

	public void setBroj_ku(int broj_ku) {
		this.broj_ku = broj_ku;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_korisnika() {
		return id_korisnika;
	}
	public void setId_korisnika(int id_korisnika) {
		this.id_korisnika = id_korisnika;
	}
	public int getId_karte() {
		return id_karte;
	}
	public void setId_karte(int id_karte) {
		this.id_karte = id_karte;
	}
	public String getName_karte() {
		return name_karte;
	}
	public void setName_karte(String name_karte) {
		this.name_karte = name_karte;
	}
	public int getCena_karte() {
		return cena_karte;
	}
	public void setCena_karte(int cena_karte) {
		this.cena_karte = cena_karte;
	}
	public int getBroj() {
		return broj;
	}
	public void setBroj(int broj) {
		this.broj = broj;
	}
	private int broj;
}
