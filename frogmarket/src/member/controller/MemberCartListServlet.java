package member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MvcUtils;

import market.model.vo.Product;
import member.model.service.MemberService;
import member.model.vo.Cart;

/**
 * Servlet implementation class MemberCartList
 */
@WebServlet("/member/cartList")
public class MemberCartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberCartListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		final int numPerPage = 9;
		int cPage = 1;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			// 처리 코드 없음. 기본값 1 유지.
		}
		
		//2. 업무로직
		//a. contents영역 start ~ end
		int end = cPage * numPerPage;
		int start = (cPage-1)*numPerPage + 1;
		
		String memberId = request.getParameter("memberId");
		
		List<Cart> list = memberService.selectCartList(memberId);
		
		//Cart cart = 
		List<Product> pList = memberService.selectList(list, start, end);
		
		//b. pageBar영역 
				int totalContents = memberService.selectCartCount();
				String url = request.getRequestURI(); // /mvc/board/boardList
				String pageBar = MvcUtils.getPageBar(
							cPage,
							numPerPage,
							totalContents,
							url
						);
		
		System.out.println(pList);
		request.setAttribute("list", pList);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/WEB-INF/views//member/cartList.jsp").forward(request, response);
	}
	
	

}
