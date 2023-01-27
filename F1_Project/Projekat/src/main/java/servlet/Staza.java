package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Karte;
import beans.Korisnik;
import beans.KorisnikDao;
import beans.Obradi;

/**
 * Servlet implementation class Staza
 */
@WebServlet("/Staza")
public class Staza extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Obradi obradi=new Obradi();
	KorisnikDao dao=new KorisnikDao();
	List<String> poruke=new ArrayList<String>();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Staza() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id_user=request.getParameter("id_user");
		String track=request.getParameter("track");
		String tip=request.getParameter("tip");
		String webRootPath = getServletContext().getRealPath("/").replace('\\', '/');
		HttpSession session=request.getSession();
		
		
		if(tip!=null && tip.equals("buy"))
			{		
				int i=Integer.parseInt(request.getParameter("id"));
				float cena=Float.parseFloat(request.getParameter("cena"));
				try {
					Karte k=dao.dajKartu(i,obradi.ConnecitionString(webRootPath));
					if(k.getNumber()<=0)
					{
						request.setAttribute("less", "Number need to greather than 0");
					}
					else {
						
						if(id_user!=null) {
					    Korisnik kor=dao.dajKorisnikId(Integer.parseInt(id_user), obradi.ConnecitionString(webRootPath));
						if(request.getParameter("cena")!=null && kor.getPrice()>0) {
						dao.updateKartu(i,obradi.ConnecitionString(webRootPath),k.getNumber()-1);
				        String br_t=(String)session.getAttribute("br_tiket");  
				        if(br_t==null)
				        {
				        	session.setAttribute("br_tiket", "1");
				        }
				        else {
				        	String p=Integer.toString((Integer.parseInt(br_t)+1));
				        	session.setAttribute("br_tiket", p);
				        }
						float cenaa=Float.valueOf(request.getParameter("cena"));
				        String cena_potr=(String)session.getAttribute("cena_potr");  
				        if(cena_potr==null)
				        {
				        	session.setAttribute("cena_potr", Float.toString(cena));
				        }
				        else {
				        	session.setAttribute("cena_potr", Float.toString((Float.valueOf(cena_potr)+cenaa)));

				        }
						dao.updateMoney(kor.getId(),(int)(cenaa),obradi.ConnecitionString(webRootPath),kor.getPrice());
						}
						else {
		
							session.setAttribute("not_enough","Ask Admin for more Money. You dont have enough money for tickets..");
						}
						request.setAttribute("pearson", kor);
						response.sendRedirect("/Projekat/home.jsp?id_user="+kor.getId());
						}
						List<Karte> karte=dao.getKarte(track,obradi.ConnecitionString(webRootPath));
						request.setAttribute("karte", karte);
					}
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		if(track!=null && track.equals("bahrain"))
		{
			try {
				List<Karte> karte=dao.getKarte(track,obradi.ConnecitionString(webRootPath));
				if(id_user!=null) {
			    Korisnik kor=dao.dajKorisnikId(Integer.parseInt(id_user), obradi.ConnecitionString(webRootPath));
				session.setAttribute("pearson", kor);
				}
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/bahrain.jsp");
				request.setAttribute("karte", karte);
				dispatch.forward(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(track!=null && track.equals("Saudi Arabia") )
		{
			try {
				List<Karte> karte=dao.getKarte(track.toLowerCase(),obradi.ConnecitionString(webRootPath));
				if(id_user!=null) {
			    Korisnik kor=dao.dajKorisnikId(Integer.parseInt(id_user), obradi.ConnecitionString(webRootPath));
				session.setAttribute("pearson", kor);
				}
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/saudi_arabia.jsp");
				request.setAttribute("karte", karte);
				System.out.print(karte);
				dispatch.forward(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(track!=null && track.equals("Australia"))
		{
			try {
				List<Karte> karte=dao.getKarte(track.toLowerCase(),obradi.ConnecitionString(webRootPath));
				request.setAttribute("karte", karte);
				if(id_user!=null) {
				    Korisnik kor=dao.dajKorisnikId(Integer.parseInt(id_user), obradi.ConnecitionString(webRootPath));
					request.setAttribute("pearson", kor);
					}
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/australia.jsp");
				dispatch.forward(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(track!=null && track.equals("Azerbeijan"))
		{
			try {
				List<Karte> karte=dao.getKarte(track.toLowerCase(),obradi.ConnecitionString(webRootPath));
				if(karte==null)
				{
					session.setAttribute("Admin need to add new tickets.", "nema_karte");
				}
				else {
					for (Iterator iterator = karte.iterator(); iterator.hasNext();) {
						Karte karte2 = (Karte) iterator.next();
						System.out.println(karte2.getName()+" ");
					}
					session.removeAttribute("nema_karte");
				}
				request.setAttribute("karte", karte);
				if(id_user!=null) {
				    Korisnik kor=dao.dajKorisnikId(Integer.parseInt(id_user), obradi.ConnecitionString(webRootPath));
					request.setAttribute("pearson", kor);
					}
			
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/azerbeijan.jsp");
				dispatch.forward(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tip=request.getParameter("tip");
		String id=request.getParameter("id_user");
		String webRootPath = getServletContext().getRealPath("/").replace('\\', '/');
		HttpSession session=request.getSession();
		if(tip!=null && tip.equals("Add_Message"))
		{
			if(id!=null) {
			try {
				Korisnik k=dao.dajKorisnikId(Integer.parseInt(id), obradi.ConnecitionString(webRootPath));
				session.setAttribute("pearson", k);
				poruke.add("<b>"+ k.getFirstname().toUpperCase()+"</b>"+"   "+"<b>"+k.getLastname()+"</b>"+"   :   Message:  "+request.getParameter("msg2"));
				session.setAttribute("poruke", poruke);
			} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
			response.sendRedirect("/Projekat/home.jsp?id_user="+id);
		}
		
	}

}
