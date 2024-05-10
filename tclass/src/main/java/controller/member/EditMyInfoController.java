package controller.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;

@WebServlet("/member/editMyInfo.do")
public class EditMyInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getSession().getAttribute("memberIdx") != null){
			req.getRequestDispatcher("./editMyInfo.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("../member/login.do");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int memberIdx = req.getParameter("memberIdx") != null ? Integer.parseInt(req.getParameter("memberIdx")) : 0;
		String pwd = req.getParameter("pwd") != null ? req.getParameter("pwd") : req.getParameter("orgPwd");
		String phone = req.getParameter("phone") != null ? req.getParameter("phone") : "";
		
		if(memberIdx != 0 && pwd != null && phone != "") {
			MemberDAO dao = new MemberDAO();
			int result = dao.modifyMyInfo(memberIdx, pwd, phone);
			dao.close();
			
			if(result > 0) {
				resp.sendRedirect("../index.do");
			} else {
				req.setAttribute("editMyInfoErrMsg", "개인정보수정 오류");
				
				req.getRequestDispatcher("./myInfo.jsp").forward(req, resp);
			}
		}else {
			req.setAttribute("editMyInfoErrMsg", "개인정보수정 오류");
			
			req.getRequestDispatcher("./myInfo.jsp").forward(req, resp);
		}
		
	}
	
	
}
