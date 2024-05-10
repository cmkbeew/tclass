package controller.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberDTO;

@WebServlet("/member/join.do")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./join.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String memberId = req.getParameter("memberId");
		String pwd = req.getParameter("pwd");
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String day = req.getParameter("day");
		String gender = req.getParameter("gender");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String interest = req.getParameter("interest");
		String grade = req.getParameter("grade");
		
		// 중복 회원 검증
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		int id_check = dao.getIdCheck(memberId);

		if(id_check >= 1) {
			req.setAttribute("name", name);
			req.setAttribute("memberId", memberId);
			req.setAttribute("name", name);
			req.setAttribute("year", year);
			req.setAttribute("month", month);
			req.setAttribute("day", day);
			req.setAttribute("gender", gender);
			req.setAttribute("phone", phone);
			req.setAttribute("email", email);
			req.setAttribute("interest", interest);
			req.setAttribute("grade", grade);
			
			req.setAttribute("idCheckErrMsg", "아이디 중복 오류");
			dao.close();
			req.getRequestDispatcher("./join.jsp").forward(req, resp);
		} else {
			dto.setName(name);
			dto.setMemberId(memberId);
			dto.setPwd(pwd);
			dto.setYear(year);
			dto.setMonth(month);
			dto.setDay(day);
			dto.setGender(gender);
			dto.setPhone(phone);
			dto.setEmail(email);
			dto.setInterest(interest);
			dto.setGrade(grade);

			int result = dao.join(dto);
			dao.close();

			if(result > 0) {
				resp.sendRedirect("./login.jsp");
			} else {
				req.setAttribute("joinErrMsg", "회원가입 실패");

				req.getRequestDispatcher("./join.do").forward(req, resp);
			}
		}
	}
}
