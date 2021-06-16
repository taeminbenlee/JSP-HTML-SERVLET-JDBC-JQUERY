package hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		String name = req.getParameter("name");
		String sage = req.getParameter("age");
		
		String fruit[] = req.getParameterValues("fruit");
		
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter pw = resp.getWriter();		
		pw.println("<html>");
		
		pw.println("<head>");
		pw.println("<title>제목</title>");		
		pw.println("</head>");
				
		pw.println("<body>");
		
		pw.println("<p>name:" + name + "</p>");
		pw.println("age:<input type='text' value=" + sage + " ><br>");
		
		if(fruit != null) {
			for (int i = 0; i < fruit.length; i++) {
				pw.println("<p>fruit:" + fruit[i] + "</p>");			
			}
		}
		
		pw.println("<a href='sample?name=" + name + "&age=" + sage + "'>sample로 이동</a>");
		
		pw.println("</body>");
		
		pw.println("</html>");		
		pw.close();
		
	}

	
}










