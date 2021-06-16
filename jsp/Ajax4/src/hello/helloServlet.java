package hello;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

import dto.CustDto;
import net.sf.json.JSONObject;


public class helloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	System.out.println("어휴");
	
	//값 받아오기
	String id = req.getParameter("id");
	String pwd = req.getParameter("pwd");
	System.out.println("id= "+id);
	System.out.println("pwd= "+pwd);
	
	//데이터 전송 단순 문자열 보낼때는 jsonObj사용
	String str = "World";
	//전송을위해 jsonobj 생성 
	JSONObject jobj = new JSONObject();
//	jobj.put("str", str);
	
	//전송용 맵 생성
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("title", "제목");
	map.put("content", "내용");
	//맵을 jobj에 담느낟
	jobj.put("map", map);
	
	//dto 로 리스트 넘기기
	List<CustDto> list = new ArrayList<CustDto>();
	list.add(new CustDto("abc", "홍길동"));
	list.add(new CustDto("bbc", "성춘향"));
	//리스트를 맵에 담기
	HashMap<String, Object> map1 = new HashMap<String, Object>();
	map.put("custlist", list);
	//맵 보내기
	jobj.put("map", map);
	
	resp.setContentType("application/x-json; charset=UTF-8");
	resp.getWriter().print(jobj);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("ㅜ.ㅠ");
		
		
	}

}
