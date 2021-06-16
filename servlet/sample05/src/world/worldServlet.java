package world;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class worldServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("WorldServlet doGet");
		String url = req.getParameter("url");
		
		//java = sendRedirect
		if(url.equals("naver")) {
			resp.sendRedirect("Http://www.naver.com");
		}
		else {
			resp.sendRedirect("Http://www.daum.net");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

}
