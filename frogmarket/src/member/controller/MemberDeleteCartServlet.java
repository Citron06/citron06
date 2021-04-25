package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Cart;

/**
 * Servlet implementation class MemberAddCartServlet
 */
@WebServlet("/member/deleteCart")
public class MemberDeleteCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
 
	public MemberDeleteCartServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String memberId = request.getParameter("memberId");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		System.out.println(boardNo);
		System.out.println(memberId);
		
		Cart cart = new Cart();
		
		cart.setMemberId(memberId);
		cart.setBoardNo(boardNo);
		
		int result = memberService.deleteCart(cart);
		String msg = result >0? "장바구니 삭제 성공" : "장바구니 삭제 실패!";
		
		//피드백
		request.getRequestDispatcher("/WEB-INF/views/member/cartList.jsp").forward(request, response);
		
	}
	
	
}
