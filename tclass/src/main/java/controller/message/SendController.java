package controller.message;

import java.io.IOException;

import common.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import message.MessageDAO;
import message.MessageDTO;

@WebServlet("/message/send.do")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 2,
		maxRequestSize = 1024 * 1024 * 10
)
public class SendController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		if(req.getSession().getAttribute("memberIdx") != null){
			req.getRequestDispatcher("./sendMessage.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("../member/login.do");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MessageDAO dao = new MessageDAO();
		MessageDTO dto = new MessageDTO();
		
		String receiverId = req.getParameter("receiverId") != null ? req.getParameter("receiverId") : "";
		String messageTitle = req.getParameter("messageTitle");
		String messageContent = req.getParameter("messageContent");
		dto.setReceiverName(receiverId);
		dto.setMessageTitle(messageTitle);
		dto.setMessageContent(messageContent);

		String senderId = String.valueOf(req.getSession().getAttribute("name"));
		int memberIdx = (Integer)(req.getSession().getAttribute("memberIdx"));
		dto.setSenderName(senderId);
		dto.setMemberIdx(memberIdx);
		
		// 파일 업로드 처리
		String saveDir = req.getServletContext().getRealPath("messageFile");
		String orgFileName = "";
		
		try {
			orgFileName = FileUtil.uploadFile(req, saveDir);
		} catch(Exception e) {
			e.printStackTrace();
			req.setAttribute("receiverId", receiverId);
			req.setAttribute("messageTitle", messageTitle);
			req.setAttribute("messageContent", messageContent);
			req.setAttribute("uploadFileError", "파일 업로드 에러 발생");
			req.getRequestDispatcher("./sendMessage.jsp").forward(req, resp);
		}
		
		if(orgFileName != "") {
			String saveFileName = FileUtil.renameFile(saveDir, orgFileName);

			dto.setOrgFileName(orgFileName);
			dto.setSaveFileName(saveFileName);
		}
		int result = dao.sendMessage(dto);
		dao.close();
		
		if(result > 0) {
			resp.sendRedirect("./sendList.do");
		} else {
			req.setAttribute("receiverId", receiverId);
			req.setAttribute("messageTitle", messageTitle);
			req.setAttribute("messageContent", messageContent);
			req.setAttribute("sendErrMsg", "쪽지 쓰기 중 오류 발생");
			
			req.getRequestDispatcher("./sendMessage.jsp").forward(req, resp);
		}
	}
	
}
