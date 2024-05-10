package controller.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;

@WebServlet("/member/changePwd.do")
public class ChangePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./changePwd.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = req.getParameter("memberId") != null ? req.getParameter("memberId") : "";
		String pwd = req.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		int result = dao.changePwd(memberId, pwd);
		dao.close();
		
		if(result > 0) {
			resp.sendRedirect("./login.do");
		} else {
			req.setAttribute("changPwdErrMsg", "비밀번호 변경 오류");
			
			req.getRequestDispatcher("./changePwd.jsp").forward(req, resp);			
		}
	}

	
}
