package controller.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberDTO;

@WebServlet("/member/myInfo.do")
public class MyInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getSession().getAttribute("memberIdx") != null){
			req.getRequestDispatcher("./myInfo.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("../member/login.do");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = req.getParameter("memberId");
		String pwd = req.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberInfo(memberId, pwd);
		dao.close();
		
		if(dto.getMemberIdx() != 0) {
			// 기존 비밀번호 request 영역에 저장
			req.setAttribute("memberIdx", dto.getMemberIdx());
			req.setAttribute("orgPwd", dto.getPwd());
			req.setAttribute("orgPhone", dto.getPhone());
			
			req.getRequestDispatcher("./editMyInfo.jsp").forward(req, resp);
		} else {
			req.setAttribute("myInfoErrMsg", "비밀번호를 확인해주세요.");
			req.getRequestDispatcher("./myInfo.jsp").forward(req, resp);
		}
		
	}
}
