package hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("HelloServlet doGet 도착");
		Cookie cookie = new Cookie("id", "abc123");
		resp.addCookie(cookie);
		
		cookie = new Cookie("pwd", "aaaa1111");
		resp.addCookie(cookie);
		
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter pw = resp.getWriter();
		pw.println("<html>");
		
		pw.println("<head>");
		
		pw.println("<title>제목</title>");
		
		pw.println("</head>");
		
		pw.println("<body>");
		
		Cookie cookies[] = req.getCookies();
		
		for (int i = 0; i < cookies.length; i++) {
			String cookieName = cookies[i].getName();
			String value = cookies[i].getValue();
			
			pw.println("<p>"+cookieName+ " : " + value + "</p>");
		}
		
		
		
		
		pw.println("</body>");
		
		pw.println("</html>");
		
		pw.close();
	}

}
