package hello;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class helloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("HelloServlet doPost");
		String url = req.getParameter("url");
		System.out.println("url:" + url);
		
	/*	//java = sendRedirect
		if(url.equals("naver")) {
			resp.sendRedirect("Http://www.naver.com");
		}
		else {
			resp.sendRedirect("Http://www.daum.net");
		}*/
		
		resp.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		if(url.equals("naver")) {
			resp.setHeader("Location", "Http://www.naver.com");
		}
		else {
			resp.setHeader("Location", "Http://www.daum.net");
		}
		
		
	}
		
		

}
