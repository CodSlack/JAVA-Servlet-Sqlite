package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.time.LocalDate;
import java.time.LocalDateTime;  
import java.time.format.DateTimeFormatter;
import java.util.Date;

import beans.Korisnik;
import beans.KorisnikDao;
import beans.Obradi;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	KorisnikDao dao=new KorisnikDao();
	Obradi o=new Obradi();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		String confirm= request.getParameter("confirm1");
		String  gender = request.getParameter("gender");
		
		HttpSession session=request.getSession(true);
		session.removeAttribute("greska1");
		Korisnik k=new Korisnik();
		k.setDate(new Date());
		k.setFirstname(first_name);
		k.setGender(gender);
		k.setLastname(last_name);
		k.setPassword(password);
		k.setSuper_user(false);
		k.setAdmin(false);
		double cena=400.0+Math.random()*(250000-10000);
		k.setPrice((int) (cena));
		String webRootPath = getServletContext().getRealPath("/").replace('\\', '/');
		
		if(gender.isEmpty() || first_name.isEmpty() || last_name.isEmpty() || password.isEmpty()
				|| gender.isEmpty()
				)
		{
			session.setAttribute("greska", "SOME OF INPUTS ARE EMPTY TRY AGAIN !!!!");
			response.sendRedirect("/Projekat/register.jsp");
		}
		if(k.getFirstname().equals("Admin") && k.getLastname().equals("Admin") && k.getPassword().equals("Admin")) {
			session.setAttribute("greska", "TRY AGAIN CHOOSE DIFFERENT First Name or Last Name !!!!");
			response.sendRedirect("/Projekat/register.jsp");
		}
		else if(!password.equals(confirm))
		{
			session.setAttribute("greska", "Password didn't match ");
			response.sendRedirect("/Projekat/register.jsp");
		}
		else if(!k.checkName(k.getFirstname()))
		{
			session.setAttribute("greska", "Firstname is invalid. Example ('Michael')");
			response.sendRedirect("/Projekat/register.jsp");
		}
		else if(!k.checkPassword(k.getPassword()))
		{
			session.setAttribute("greska", "Password is invalid. Example ('Example123')");
			response.sendRedirect("/Projekat/register.jsp");
		}
		else {
			try {
				int isp=dao.Dodaj(k,o.ConnecitionString(webRootPath));
				if(isp==0)
				{
					session.setAttribute("greska", "Error There is problem with database");
				}
				else {
					request.setAttribute("pearson", k);
					session.setAttribute("greska1", "1");
					session.removeAttribute("greska");
					response.sendRedirect("/Projekat/login.jsp");
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
	
	}

}
