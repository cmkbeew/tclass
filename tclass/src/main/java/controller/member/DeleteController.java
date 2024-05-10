package controller.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;

@WebServlet("/member/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int memberIdx = req.getParameter("memberIdx") != null ? Integer.parseInt(req.getParameter("memberIdx")) : 0;
		
		if(memberIdx != 0) {
			MemberDAO dao = new MemberDAO();
			int result = dao.deleteMember(memberIdx);
			dao.close();
			
			if(result > 0) {
				// 세션 삭제
				req.getSession().invalidate();
				
				resp.sendRedirect("../index.do");
			} else {
				req.setAttribute("deleteErrMsg", "회원탈퇴 실패");
				
				req.getRequestDispatcher("./myInfo.jsp").forward(req, resp);
			}
		} else {
			req.setAttribute("deleteErrMsg", "회원탈퇴 실패");
			
			req.getRequestDispatcher("./myInfo.jsp").forward(req, resp);
		}
		
	}
}
