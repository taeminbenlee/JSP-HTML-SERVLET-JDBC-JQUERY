package hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//	System.out.println("helloservlet doget");
		
		/* 
			servlet -> java(html)자바코드 안에 html
			jsp -> html(java) html안에 java 
		*/
		String name = req.getParameter("name");
		System.out.println("name: "+name);
		
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter pw = resp.getWriter();
		pw.println("<html>");
		
		pw.println("<head>");
		
		pw.println("<title>제목</title>");
		
		pw.println("</head>");
		
		pw.println("<body>");
		
		pw.println("<h3>helloServlet</h3>");
		
		pw.println("<p>name: "+name+"</p>");
		
		pw.println("<a href='sample'>sample link</a>");
		
		pw.println("</body>");
		
		pw.println("</html>");
		
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//	System.out.println("helloservlet dopost");
	}

	
	
}
