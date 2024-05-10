package controller.message;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import message.MessageDAO;
import message.MessageDTO;

@WebServlet("/message/receiveDetail.do")
public class ReceiveDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int messageIdx = Integer.parseInt(req.getParameter("messageIdx"));
		
		if(messageIdx > 0) {
			MessageDAO dao = new MessageDAO();
			MessageDTO dto = dao.getMessageDetail(messageIdx);
			dao.close();
			
			dto.setMessageContent(dto.getMessageContent().replace("\r\n", "<br>"));
			dto.setMessageContent(dto.getMessageContent().replace(" ", "&nbsp;"));

			req.setAttribute("messageView", dto);

			req.getRequestDispatcher("./receiveDetail.jsp?messageIdx=" + messageIdx).forward(req, resp);
		} else {
			resp.sendRedirect("./receiveList.do");
		}
	}
}
