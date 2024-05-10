package controller.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import board.BoardDAO;
import board.BoardDTO;
import common.BbsPage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ListBoardController
 */
public class ListBoardController extends HttpServlet {
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
			
			BoardDAO dao = new BoardDAO();
			List<BoardDTO> list = dao.getBoardList(maps);
			total_count = dao.getBoardCount(maps);
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
	
			String pagingArea = BbsPage.pagingArea(total_page, page_no, page_block_start, page_block_end, "./myboard.do?");
			maps.put("paging", pagingArea);
	
			if(list != null && total_count != 0) {
				req.setAttribute("list", list);
				req.setAttribute("maps", maps);
				
				req.getRequestDispatcher("./myboard.jsp").forward(req, resp);
			} else {
				req.setAttribute("noBoardList", "작성한 글이 없습니다.");
	
				req.getRequestDispatcher("./myboard.jsp").forward(req, resp);
			}
		} else {
			// 미로그인 상태로 접근 시 로그인 페이지로 이동
			resp.sendRedirect("../member/login.do");
		}
	}
}
