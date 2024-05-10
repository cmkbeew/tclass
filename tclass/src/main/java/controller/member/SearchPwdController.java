package controller.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberDTO;

@WebServlet("/member/searchPwd.do")
public class SearchPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./searchPwd.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = req.getParameter("memberId") != null ? req.getParameter("memberId") : "";
		String name = req.getParameter("name") != null ? req.getParameter("name") : "";
		String phone = req.getParameter("phone") != null ? req.getParameter("phone") : "";
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.searchPwd(memberId, name, phone);
		dao.close();
		
		if(dto.getMemberIdx() != 0) {
			req.setAttribute("memberId", dto.getMemberId());
			
			req.getRequestDispatcher("./changePwd.jsp").forward(req, resp);
//			resp.sendRedirect("./changePwd.do");
		} else {
			req.getRequestDispatcher("./nSearchPwd.jsp").forward(req, resp);
		}
		
	}
}
