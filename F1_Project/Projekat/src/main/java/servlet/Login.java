package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    Obradi obradi=new Obradi();
    KorisnikDao dao=new KorisnikDao();
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String first_name = request.getParameter("firstname1");
		String last_name = request.getParameter("lastname1");
		String password = request.getParameter("password1");
		HttpSession session=request.getSession();
		String webRootPath = getServletContext().getRealPath("/").replace('\\', '/');
		session.removeAttribute("greska");
		if(first_name.equals("Admin") && last_name.equals("Admin") && password.equals("Admin"))
		{
			Korisnik k;
			try {
				k = dao.checkLoogin(first_name, last_name, password,obradi.ConnecitionString(webRootPath));
				if(k!=null) {
					  session.setAttribute("pearson", k);
					
					  List<Korisnik> korisnici=dao.getList(obradi.ConnecitionString(webRootPath)); 
					  
					  if(korisnici==null) {
					  session.setAttribute("greska_admin", "There is no registred users");
					  response.sendRedirect("/Projekat/admin.jsp");
					  } 
					  else {
				      session.removeAttribute("greska_admin");
					  request.setAttribute("korisnici", korisnici);
					  List<beans.Karte> karte=dao.dajKarte(obradi.ConnecitionString(webRootPath)); 
					  request.setAttribute("karte", karte);
					  RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/admin.jsp");
					  dispatch.forward(request, response);
					  }
					 
					}
				else {
					response.sendRedirect("/Projekat/login.jsp");
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}else {
		try {
			Korisnik k=dao.checkLoogin(first_name, last_name, password,obradi.ConnecitionString(webRootPath));
			if(k!=null)
			{
				session.setAttribute("pearson", k);
				session.removeAttribute("greska1");
				session.removeAttribute("greska");
				/*RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/home2.jsp");
				dispatch.forward(request, response);
				*/
				response.sendRedirect("/Projekat/home.jsp?id_user="+k.getId());
			}
			else {
				response.sendRedirect("/Projekat/login.jsp");
				session.setAttribute("greska1", "You need to SIGN UP.");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
		
	}



}
