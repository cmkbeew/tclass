package controller.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberDTO;

@WebServlet("/member/searchId.do")
public class SearchIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./searchId.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name") != null ? req.getParameter("name") : "";
		String phone = req.getParameter("phone") != null ? req.getParameter("phone") : "";
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.searchId(name, phone);
		dao.close();
		if(dto.getMemberIdx() != 0) {
			String id = "";
			if(dto.getMemberId().length() >= 4) {
				id = dto.getMemberId().substring(0, 4) + "****";
			} else {
				id = dto.getMemberId();
			}
			
			req.setAttribute("memberId", id);
			req.setAttribute("interest", dto.getInterest());
			req.setAttribute("regDate", dto.getRegDate());
			
			req.getRequestDispatcher("./ySearchId.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("./nSearchId.jsp").forward(req, resp);
		}
	}
}
