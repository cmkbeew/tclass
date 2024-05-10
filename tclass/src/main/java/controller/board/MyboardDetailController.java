package controller.board;

import java.io.IOException;

import board.BoardDAO;
import board.BoardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MyboardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardIdx = req.getParameter("boardIdx") != null ? Integer.parseInt(req.getParameter("boardIdx")) : 0;
		String replyState = req.getParameter("replyState") != null ? req.getParameter("replyState") : "N";
		
		if(replyState.equals("Y")) {
			if(boardIdx > 0) {
				BoardDAO dao = new BoardDAO();
				BoardDTO boardView = dao.getBoardDetail(boardIdx);
				dao.close();

				boardView.setBoardContent(boardView.getBoardContent().replace("\r\n", "<br>"));
				boardView.setBoardContent(boardView.getBoardContent().replace(" ", "&nbsp;"));

				req.setAttribute("boardView", boardView);

				req.getRequestDispatcher("/board/yBoardDetail.jsp?boardIdx=" + boardIdx).forward(req, resp);
			} else {
				resp.sendRedirect("./myboard.do");
			}
			
		} else {
			if(boardIdx > 0) {
				BoardDAO dao = new BoardDAO();
				BoardDTO boardView = dao.getBoardDetail(boardIdx);
				dao.close();

				boardView.setBoardContent(boardView.getBoardContent().replace("\r\n", "<br>"));
				boardView.setBoardContent(boardView.getBoardContent().replace(" ", "&nbsp;"));

				req.setAttribute("boardView", boardView);

				req.getRequestDispatcher("/board/nBoardDetail.jsp?boardIdx=" + boardIdx).forward(req, resp);
			} else {
				resp.sendRedirect("./myboard.do");
			}
		}

		
	}
	
}
