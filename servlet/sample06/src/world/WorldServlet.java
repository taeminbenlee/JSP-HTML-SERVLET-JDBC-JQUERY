package world;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDto;

public class WorldServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter pw = resp.getWriter();		
		pw.println("<html>");
		
		pw.println("<head>");
		pw.println("<title>제목</title>");		
		pw.println("</head>");
				
		pw.println("<body>");
		pw.println("<h3>world servlet</h3>");
		/*
		 * pw.println("<p>name:" + name + "</p>");
		 * pw.println("age:<input type='text' value=" + age + " ><br>");
		 */
		MemberDto mem = (MemberDto)req.getAttribute("mem");
		
		//pw.println("<p>name:" + mem.getName() + "</p>");
		//pw.println("<p>name:" + mem.getAge() + "</p>");
		pw.println("<p>"+mem.toString()+"</p>");
		pw.println("</body>");
		
		pw.println("</html>");		
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}

}
