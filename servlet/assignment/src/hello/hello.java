package hello;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = "/hello")
public class hello extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		out.println("<!DOCTYPE html>");
        out.println("<html><head>");
        out.println("<title>hello Servlet</title></head>");
        out.println("<body><h2>입력된 정보</h2>");
        //이름 텍스트
        String name = req.getParameter("yourName");
        out.println("<p>이름: " + name + "</p>");
        //연령대 셀렉트
        String age = req.getParameter("age");
        if (age == null) {
           out.println("<p>연령대: MISSING</p>");
        } else if (age.equals("10")) {
           out.println("<p>연령대: 10대</p>");
        } else if (age.equals("20")) {
           out.println("<p>연령대: 20대</p>");
        } else if (age.equals("30")) {
            out.println("<p>연령대: 30대</p>");
        } else if (age.equals("40")) {
            out.println("<p>연령대: 40대</p>");
        } else {
        	out.println("<p>연령대: 50대</p>");
        }
        //성별 라디오
        String gender = req.getParameter("gender");
        if (gender == null) {
           out.println("<p>성별: MISSING</p>");
        } else if (gender.equals("male")) {
           out.println("<p>성별: 남자</p>");
        } else {
           out.println("<p>성별: 여자</p>");
        }
        //취미 체크박스 복수
        String[] hobbies = req.getParameterValues("hobby");
        
        if (hobbies == null || hobbies.length == 0) {
           out.println("<p>hobby: NONE</p>");
        } else {
           out.println("<p>취미: ");
           for (String select : hobbies) {
              if (select.equals("playing game")) {
                 out.println("게임 ");
              } else if (select.equals("watching movie")) {
                 out.println("영화");
              } else if (select.equals("shopping")) {
                 out.println("쇼핑 ");
              }
              
           }
           out.println("</p>");
           
        }
/*        
        String hobbyParam = "";
        if (hobbies != null || hobbies.length != 0) {
        	for (String select : hobbies) {
                if (select.equals("playing game")) {
                   hobbyParam = "게임 ";
                } else if (select.equals("watching movie")) {
                	hobbyParam = "영화 ";
                } else if (select.equals("shopping")) {
                	 hobbyParam = "쇼핑 ";
                }
        }*/
       	
        out.println("<a href='result?yourName=" + name + "&age=" + age + "&gender="+ gender +"&hobby= ");
        		for (int i = 0; i < hobbies.length; i++) {
					out.println(hobbies[i] + ", ");	
					};
					
		/*
		 * out.println("<a href='result?yourName=" + name + "&age=" + age + "&gender="+
		 * gender +"&hobby= " + hobbyParam+"'>");
		 * 
		 * 
		 */
					
		out.println("'>result로 이동</a>");
        		
        
        out.println("</body>");
		
		out.println("</html>");		
		out.close();
		
	}
        
}

	


