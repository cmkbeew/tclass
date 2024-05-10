package controller.board;

import java.io.IOException;

import board.BoardDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteBoardController
 */
public class DeleteBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardIdx = req.getParameter("boardIdx") != null ? Integer.parseInt(req.getParameter("boardIdx")) : 0;

		if(boardIdx > 0) {
			BoardDAO dao = new BoardDAO();
			int result = dao.getBoardDelete(boardIdx);
			dao.close();

			if(result > 0) {
				resp.sendRedirect("./myboard.do");
			}
		} else {
			resp.sendRedirect("./myboard.do");
		}
	}
}
