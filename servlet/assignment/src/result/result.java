package result;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDto;

public class result extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");

        String name = req.getParameter("yourName");
        String age = req.getParameter("age");
        String gender = req.getParameter("gender");
        String[] hobbies = req.getParameterValues("hobby");
		System.out.println("name:" + name);
		System.out.println("age:" + age);
		System.out.println("gender:" + gender);
		System.out.println("hobby:" ); 
		for (int i = 0; i < hobbies.length; i++) {
			System.out.println(hobbies[i] + ", ");};
		
		
		  MemberDto dto = new MemberDto(name, age, gender, hobbies);
		 
		 req.setAttribute("mem", dto);
		 
		 req.getRequestDispatcher("world").forward(req, resp);
		
	


	}

	
}
