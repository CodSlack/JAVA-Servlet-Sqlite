package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Korisnik;
import beans.KorisnikDao;
import beans.Obradi;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Obradi obradi=new Obradi();
	KorisnikDao dao=new KorisnikDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		String s=request.getParameter("tip");
		String yes=request.getParameter("yes");
		String webRootPath = getServletContext().getRealPath("/").replace('\\', '/');
		if(s!=null && s.equals("delete"))
		{
			try {
				dao.deleteUser(id, obradi.ConnecitionString(webRootPath));
				List<beans.Karte> karte=dao.dajKarte(obradi.ConnecitionString(webRootPath)); 
				request.setAttribute("karte", karte);
				
				request.setAttribute("karte", karte);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/admin.jsp");
			dispatch.forward(request, response);
		}
		if(s!=null && s.equals("Edit"))
		{
			try {
				dao.editUser(id, obradi.ConnecitionString(webRootPath),yes);
				List<Korisnik> korisnici=dao.getList(obradi.ConnecitionString(webRootPath)); 
				request.setAttribute("korisnici", korisnici);
				List<beans.Karte> karte=dao.dajKarte(obradi.ConnecitionString(webRootPath)); 
				request.setAttribute("karte", karte);
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/admin.jsp");
				dispatch.forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(s!=null && s.equals("delete_race"))
		{
			try {
				dao.deleteKarte(id, obradi.ConnecitionString(webRootPath));
				List<Korisnik> korisnici=dao.getList(obradi.ConnecitionString(webRootPath)); 
				request.setAttribute("korisnici", korisnici);
				request.removeAttribute("karte");
				List<beans.Karte> karte=dao.dajKarte(obradi.ConnecitionString(webRootPath));
				request.setAttribute("karte", karte);
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/admin.jsp");
				dispatch.forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(s!=null && s.equals("Update_Money") && id!=0)
		{
			try {
				dao.updateMoneyAdmin(id,obradi.ConnecitionString(webRootPath));
				List<beans.Karte> karte=dao.dajKarte(obradi.ConnecitionString(webRootPath));
				List<Korisnik> korisnici=dao.getList(obradi.ConnecitionString(webRootPath)); 
				request.setAttribute("korisnici", korisnici);
				request.setAttribute("karte", karte);
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/admin.jsp");
				dispatch.forward(request, response);
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		if(s!=null && s.equals("Update_Seats") && id!=0)
		{
			try {
				dao.updateTickets(id,obradi.ConnecitionString(webRootPath));
				List<beans.Karte> karte=dao.dajKarte(obradi.ConnecitionString(webRootPath));
				List<Korisnik> korisnici=dao.getList(obradi.ConnecitionString(webRootPath)); 
				request.setAttribute("korisnici", korisnici);
				request.setAttribute("karte", karte);
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/admin.jsp");
				dispatch.forward(request, response);
				
			} catch (ClassNotFoundException | SQLException e) {
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
		System.out.print(request.getParameter("id"));
		String s=request.getParameter("update_user");
		int id;
		if(request.getParameter("id")!=null) {
		id=Integer.parseInt(request.getParameter("id"));
		}
		else {
			id=0;
		}
		HttpSession session=request.getSession();
		String webRootPath = getServletContext().getRealPath("/").replace('\\', '/');

		if(s!=null && s.equals("insert") && id!=0)
		{
			String name=request.getParameter("firstname1");
			String lastname=request.getParameter("lastname1");
			String password=request.getParameter("password1");
			String cpassword=request.getParameter("pasword2");
			if(password.equals(cpassword))
			{
				try {
					boolean p=dao.updateUser((id),name,lastname,password,obradi.ConnecitionString(webRootPath));
					response.sendRedirect("/Projekat/login.jsp");
					
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				session.removeAttribute("same");
				
			}
			else {
				String same="Password anc Confirmation password need to be same";
				session.setAttribute("same", same);
			}
		}
		if(s!=null && s.equals("insert_ticket"))
		{
			String name=request.getParameter("country").toLowerCase();
			String stand=request.getParameter("stand");
			String price=request.getParameter("price");
			String number=request.getParameter("number");
			if(number !=null && price!=null && stand!=null && name!=null) {
			float p=Float.valueOf(price);
			try {
				dao.insertKare(obradi.ConnecitionString(webRootPath),name,stand,p,Integer.parseInt(number));
				List<beans.Karte> karte=dao.dajKarte(obradi.ConnecitionString(webRootPath));
				List<Korisnik> korisnici=dao.getList(obradi.ConnecitionString(webRootPath)); 
				request.setAttribute("korisnici", korisnici);
				request.setAttribute("karte", karte);
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/admin.jsp");
				dispatch.forward(request, response);
				
			} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		}
	
		
	}

}
