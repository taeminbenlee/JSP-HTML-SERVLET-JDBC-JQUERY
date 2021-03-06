package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.abandonedDogDao;	
import dto.abandonedDogDto;

@WebServlet("/abandog")
public class abandonedDogController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doProcess(req, resp);
		}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//한글깨짐방지
		req.setCharacterEncoding("utf-8");
		//확인용문자열
		System.out.println("abandonedController doProcess");
		
		String param = req.getParameter("param");
		//유기견 제보글 확인목록으로~
		if(param.equals("getAbandonedDogPagingList")) {
			String choice = req.getParameter("choice");
			String search = req.getParameter("search");
			String spage = req.getParameter("pageNumber");
			int page = 0;
			if(spage != null && !spage.equals("")) {	
				page = Integer.parseInt(spage);
			}
			if(choice == null) {
				choice = "";
			}
			if(search == null) {
				search = "";
			}
			
			abandonedDogDao dao = abandonedDogDao.getInstance();
			List<abandonedDogDto> list = dao.getAbandonedDogPagingList(choice, search, page);
			req.setAttribute("list", list);
			
			int len = dao.getAllReport(choice, search);
			int adpage = len / 10;		// 23 -> 2
			if((len % 10) > 0){
				adpage = adpage + 1;
			}
			req.setAttribute("adPage", adpage + "");
			req.setAttribute("pageNumber", page + "");
			
			req.setAttribute("content", "abandonedDogList");
			
			forward("main.jsp", req, resp);	
			
		}
		//유기견 제보 글 작성페이지로~
		else if(param.equals("writeReport")) {
			req.setAttribute("content", "writeReport");
			
			forward("main.jsp", req, resp);	
		}
		//유기견 제보 글 작성 이후 버튼 클릭시
		else if(param.equals("reportAf")) {
			String myid = req.getParameter("id");
			int dan = Integer.parseInt(req.getParameter("dan"));
			String addr = req.getParameter("addr");
			int phonenum = Integer.parseInt(req.getParameter("phonenum"));
			String mycontent = req.getParameter("content");
			String filename = req.getParameter("file");
			
			abandonedDogDao dao = abandonedDogDao.getInstance();
			
			boolean isS = dao.writeReport(new abandonedDogDto(myid, phonenum, addr, mycontent, filename, dan));
			if(isS) {
				resp.sendRedirect("abandog?param=getAbandonedDogPagingList");
			} else {
				resp.sendRedirect("writeReport.jsp");
			}
		}
		//메인에서 클릭시 유기견 제보 메인으로~
		else if(param.equals("reportADPage")) {
			req.setAttribute("content", "reportAbandonedDogPage");
			
			forward("main.jsp", req, resp);	
		}
		else if(param.equals("openReportDetail")) {
			int seq = Integer.parseInt(req.getParameter("seq").trim());
			
			abandonedDogDao dao = abandonedDogDao.getInstance();
			abandonedDogDto dto = dao.reportDetail(seq);
			
			req.setAttribute("detail", dto);
			
			req.setAttribute("content", "reportDetail");
			
			forward("main.jsp", req, resp);	
			
		}
		else if(param.equals("updateReport")) {
			int seq = Integer.parseInt(req.getParameter("seq").trim());
			req.setAttribute("content", "reportUpdate");
			forward("main.jsp", req, resp);	
		}
		else if(param.equals("updateAf")) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			int phonenum = Integer.parseInt(req.getParameter("phonenum"));
			String address = req.getParameter("address");
			String mycontent = req.getParameter("mycontent");
			
			abandonedDogDao dao = abandonedDogDao.getInstance();
			boolean isS = dao.updateReport(seq, address, phonenum, mycontent);
			
			if(isS == true) {
				resp.sendRedirect("abandog?param=getAbandonedDogPagingList");
			} else {
				resp.sendRedirect("abandog?param=updateReport");

			}
				
		}
		
		
		
		
	}
	public void forward(String arg, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(arg);
		dispatch.forward(req, resp);			
	}
}
