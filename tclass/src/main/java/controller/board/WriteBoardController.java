package controller.board;

import java.io.IOException;

import board.BoardDAO;
import board.BoardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class WriteBoardController
 */
public class WriteBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int memberIdx = (Integer)req.getSession().getAttribute("memberIdx");
		String ss1 = req.getParameter("ss1");
		String ss2 = req.getParameter("ss2");
		String boardTitle = req.getParameter("boardTitle");
		String boardContent = req.getParameter("boardContent");
		
		BoardDTO dto = new BoardDTO();
		dto.setMemberIdx(memberIdx);
		dto.setDivision1(ss1);
		dto.setDivision2(ss2);
		dto.setBoardTitle(boardTitle);
		dto.setBoardContent(boardContent);
		
		BoardDAO dao = new BoardDAO();
		int result = dao.writeBoard(dto);
		
		dao.close();
		
		if(result > 0) {
			resp.sendRedirect("./myboard.do");
		}
	}

	
}
