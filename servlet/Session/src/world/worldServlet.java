package world;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/world")
public class worldServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter pw = resp.getWriter();
		pw.println("<html>");
		
		pw.println("<head>");
		
		pw.println("<title>제목</title>");
		
		pw.println("</head>");
		
		pw.println("<body>");
		
		HttpSession session = req.getSession(false);
		/*
			getSession(false) == 세션의 오브젝트가 존재하면 현재의 HttpSession을 반환한다. 존재하지 않으면 null을 반환한다.
			
			getSession(true) == 세션의 오브젝트가 존재하면 현재의 HttpSession을 반환한다. 존재하지 않으면 새로 생성한다. default = getSession() == true;
		 */
		if(session == null ) {
			session = req.getSession(true);
			//선택
			session.setMaxInactiveInterval(30);
			session.setAttribute("visited", "1"); //number of visit
			pw.println("<p>첫 방문입니다</p>");
			
		} else {
			String visited = (String)session.getAttribute("visited"); //스트링으로 캐스트 변환
			int count = Integer.parseInt(visited); //문자를 숫자로 바꿈
			count ++; //방문횟수 증가
			pw.println("<p>방문횟수는" + count + "번째 방문 입니다.</p>");
			session.setAttribute("visited", count + ""); //count 가 문자열이 아니기 때문에 뒤에 빈 문자열을 하나 추가해준다
			
			
		}
	
		//세션하나 아무거나 추가
		session.setAttribute("id", "abc123");
		
		
		pw.println("<a href='deleteObj'>deleteObject로 이동</a>");
		
		pw.println("</body>");
		
		pw.println("</html>");
		
		pw.close();
	}

}
