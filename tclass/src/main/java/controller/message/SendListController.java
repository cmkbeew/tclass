package controller.message;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.BbsPage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import message.MessageDAO;
import message.MessageDTO;

@WebServlet("/message/sendList.do")
public class SendListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		if(session.getAttribute("memberId") != null) {
			// 페이징 정보 초기화
			int total_count = 0;
			int total_page = 1;
			int page_no = 1;
			int page_size = 5;
			int page_skip_cnt = 5;
			int page_block_size = 5;
			int page_block_start = 1;
			int page_block_end = 1;
	
			Map<String, Object> maps  = new HashMap<>();
	
			// 페이징 정보 설정
			page_no = req.getParameter("page_no") != null ? Integer.parseInt(req.getParameter("page_no")) : 1;
			page_skip_cnt = (page_no - 1) * page_size;
	
			maps.put("page_size", page_size);
			maps.put("page_skip_cnt", page_skip_cnt);
			maps.put("memberIdx", session.getAttribute("memberIdx"));
			maps.put("senderName", session.getAttribute("name"));
			
			MessageDAO dao = new MessageDAO();
			List<MessageDTO> list = dao.getSendList(maps);
			total_count = dao.getSendListCount(maps);
			dao.close();
	
			total_page = (int)Math.ceil(total_count / (double)page_size);
			page_block_start = (int)(Math.ceil(page_no / (double)page_block_size) -1 ) * page_size + 1;
			page_block_end = (int)Math.ceil(page_no / (double)page_block_size) * page_size;
			page_block_end = page_block_end > total_page ? total_page : page_block_end;
	
			maps.put("total_count", total_count);
			maps.put("total_page", total_page);
			maps.put("page_no", page_no);
			maps.put("page_block_size", page_block_size);
			maps.put("page_block_start", page_block_start);
			maps.put("page_block_end", page_block_end);
	
			String pagingArea = BbsPage.pagingArea(total_page, page_no, page_block_start, page_block_end, "./sendList.do?");
			maps.put("paging", pagingArea);
	
			if(list != null && total_count != 0) {
				req.setAttribute("list", list);
				req.setAttribute("maps", maps);
				
				req.getRequestDispatcher("./sendList.jsp").forward(req, resp);
			} else {
				req.setAttribute("noSendList", "보낸 쪽지가 없습니다.");
	
				req.getRequestDispatcher("./sendList.jsp").forward(req, resp);
			}
		} else {
			// 미로그인 상태로 접근 시 로그인 페이지로 이동
			resp.sendRedirect("../member/login.do");
		}
	}
}
