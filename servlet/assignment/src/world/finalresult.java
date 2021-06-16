package world;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDto;

public class finalresult extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		
        out.println("<html><head>");
        out.println("<title>final result</title></head>");
        out.println("<body><h2>입력된 정보</h2>");
        
        MemberDto mem = (MemberDto)req.getAttribute("mem");
        
        out.println("<p>"+mem.toString()+"</p>");
		out.println("</body>");
		
		out.println("</html>");		
		out.close();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("finalresult doPost");
	}
	
	
}
