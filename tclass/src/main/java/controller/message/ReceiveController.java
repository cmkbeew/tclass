package controller.message;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/message/receiveList.do")
public class ReceiveController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getSession().getAttribute("memberIdx") != null){
			req.getRequestDispatcher("./receiveList.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("../member/login.do");
		}
	}

	
}
