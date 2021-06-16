package sample;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDto;

public class SampleServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//	System.out.println("SampleServlet doGet");
		req.setCharacterEncoding("utf-8");
		
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String selectedvalue = req.getParameter("fruit");
		System.out.println("name:" + name);
		System.out.println("age:" + age);
		System.out.println("fruit:" + selectedvalue);
		// Java
		//resp.sendRedirect("world?name="+name+"&age="+age);
		MemberDto dto = new MemberDto(name, age, selectedvalue);
		
		req.setAttribute("mem", dto);
		
		req.getRequestDispatcher("world").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("SampleServlet doPost");
	}

	
}
