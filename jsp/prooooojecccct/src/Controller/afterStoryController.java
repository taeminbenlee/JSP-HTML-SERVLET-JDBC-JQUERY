package Controller;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Dto.afterStoryDto;
import Dao.afterStoryDao;

@WebServlet(urlPatterns = "/after")
public class afterStoryController extends HttpServlet {

	public void forward(String arg, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(arg);
		dispatch.forward(req, resp);			
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("afterStoryController doProcess");	
	
		String param = req.getParameter("param");
		
		
		if(param.equals("afterstoryList")) {
		
			String choice = req.getParameter("choice");
			String search = req.getParameter("search");
			String lpage = req.getParameter("pageNum");

			int page = 0;
			if(lpage != null && !lpage.equals("")) {	
				page = Integer.parseInt(lpage);
			}
			if(choice == null) {
				choice = "";
	
			}
			if(search == null) {
				search = "";
			}
			afterStoryDao dao = afterStoryDao.getInstance();
			List<afterStoryDto> list = dao.storyList(choice, search, page);
			req.setAttribute("list", list);
	
			
			int len = dao.allAfterStory(choice, search);
			int afPage = len / 9;	
			if((len % 9) > 0){
				afPage = afPage +1;
			}
			
			
			System.out.println("총 글 : " + len);
			System.out.println("총 글 : " + len);
			System.out.println("출력되는 총 페이지 : " + afPage);
			
			req.setAttribute("afPage", afPage + "");
			req.setAttribute("pageNum", page + "");
			req.setAttribute("len", len + "");
			req.setAttribute("search", search );
			req.setAttribute("choice", choice );
			req.setAttribute("content", "./afterstory/afterStoryList");
			
			forward("index.jsp", req, resp);	
			
		} 
		else if(param.equals("afterStoryDetail")) {
			String seqaf = req.getParameter("seq");
			int seq = Integer.parseInt(seqaf);
			
			afterStoryDao dao = afterStoryDao.getInstance();
			afterStoryDto dto = dao.storyDetail(seq);
			
			req.setAttribute("detailAf", dto);
			
			req.setAttribute("content", "./afterstory/afterStoryDetail");
			
			forward("index.jsp", req, resp);	
		}
		
		else if(param.equals("updateStory")) {

			int seq = Integer.parseInt(req.getParameter("seq").trim());
			req.setAttribute("content", "./afterstory/afterStoryUpdate");
			forward("index.jsp", req, resp);	
		} 
		
		else if(param.equals("afterDelete")) {
			int seq = Integer.parseInt( req.getParameter("seq") );
			System.out.println("seq:" + seq);

			afterStoryDao dao = afterStoryDao.getInstance();
			dao.deleteStory(seq);
			
			resp.sendRedirect("after?param=afterstoryList");
		}
		
		
		else if(param.equals("fail")) {
			System.out.println("In Fail Param!");
			
			//한글 깨지지 않게 인코딩
			req.setCharacterEncoding("utf-8");
	
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter pw = resp.getWriter();		
			pw.println("<html>");		
			pw.println("<head>");
			pw.println("<title>견생역전</title>");		
			pw.println("</head>");				
			pw.println("<body>");
			
			pw.println("<script>");
			pw.println("alert('이미지파일만 업로드 가능합니다')");
			pw.println("location.href = 'after?param=afterstoryList'");
			pw.println("</script>");
			
			pw.println("</body>");
			pw.println("</html>");		
			pw.close();		
		}
	

		
		}
		
	

	

}

