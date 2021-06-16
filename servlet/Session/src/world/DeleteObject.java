package world;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/deleteObj")
public class DeleteObject extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		session.removeAttribute("visited");
		
		Enumeration<String> enum_session = session.getAttributeNames();
		while(enum_session.hasMoreElements()) {
			String name = enum_session.nextElement();
			String value = (String)session.getAttribute(name);
			
			System.out.println(name + " : " + value);
		}
		
		// session 삭제
		session.invalidate();
		if(req.getSession(false) == null) {
			System.out.println("session이 비어 있습니다");
		}
		
	}

}














