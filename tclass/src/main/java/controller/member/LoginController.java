package controller.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.MemberDAO;
import member.MemberDTO;

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getSession().getAttribute("memberIdx") != null) {
			resp.sendRedirect("../index.do");
			
		} else {
			req.getRequestDispatcher("./login.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = req.getParameter("memberId") != null ? req.getParameter("memberId") : "";
		String pwd = req.getParameter("pwd") != null ? req.getParameter("pwd") : "";
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberInfo(memberId, pwd);
		dao.close();
		
		if(dto.getMemberId() != null) {
			HttpSession session = req.getSession();
			session.setAttribute("memberIdx", dto.getMemberIdx());
			session.setAttribute("name", dto.getName());
			session.setAttribute("memberId", dto.getMemberId());
//			session.setAttribute("pwd", dto.getPwd());
			session.setAttribute("year", dto.getYear());
			session.setAttribute("month", dto.getMonth());
			session.setAttribute("day", dto.getDay());
			session.setAttribute("gender", dto.getGender());
			session.setAttribute("phone", dto.getPhone());
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("interest", dto.getInterest());
			session.setAttribute("grade", dto.getGrade());
//			session.setAttribute("birth", dto.getYear() + "-" + dto.getMonth() + "-" + dto.getDay());
			
			resp.sendRedirect("../index.do");
		} else {
			req.setAttribute("loginErrMsg", "아이디 또는 비밀번호를 잘못 입력했습니다.");
			
			req.getRequestDispatcher("./login.jsp").forward(req, resp);
		}
	}
}
