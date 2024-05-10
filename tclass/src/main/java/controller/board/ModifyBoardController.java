package controller.board;

import java.io.IOException;

import board.BoardDAO;
import board.BoardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ModifyBoardController
 */
public class ModifyBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardIdx = req.getParameter("boardIdx") != null ? Integer.parseInt(req.getParameter("boardIdx")) : 0;

		if(boardIdx > 0) {
			BoardDAO dao = new BoardDAO();
			BoardDTO boardView = dao.getBoardDetail(boardIdx);
			dao.close();

			req.setAttribute("boardView", boardView);

			req.getRequestDispatcher("/board/boardModify.jsp?boardIdx=" + boardIdx).forward(req, resp);
		} else {
			resp.sendRedirect("./myboard.do");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardIdx = req.getParameter("boardIdx") != null ? Integer.parseInt(req.getParameter("boardIdx")) : 0;
		String ss1 = req.getParameter("ss1");
		String ss2 = req.getParameter("ss2");
		String boardTitle = req.getParameter("boardTitle");
		String boardContent = req.getParameter("boardContent");
		
		BoardDTO dto = new BoardDTO();
		dto.setBoardIdx(boardIdx);
		dto.setDivision1(ss1);
		dto.setDivision2(ss2);
		dto.setBoardTitle(boardTitle);
		dto.setBoardContent(boardContent);
		
		if(boardIdx > 0) {
			BoardDAO dao = new BoardDAO();
			BoardDTO boardView = dao.modifyBoard(dto);
			dao.close();
			
			req.setAttribute("boardView", boardView);
			
			resp.sendRedirect("./myboardDetail.do?boardIdx=" + boardIdx);
		} else {
			resp.sendRedirect("./myboard.do");
		}

	}
}
