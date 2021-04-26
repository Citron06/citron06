package market.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MvcUtils;
import market.model.service.MarketService;
import market.model.vo.Product;
<<<<<<< Updated upstream
=======
import market.model.vo.ProductCommentExt;
>>>>>>> Stashed changes
import market.model.vo.pAttach;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MarketViewServlet
 */
@WebServlet("/market/marketView")
public class MarketViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MarketService marketService = new MarketService();
	private MemberService memberService = new MemberService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< Updated upstream
		//1. 사용자 입력값 : no
		int no = 0;
		try {
			no = Integer.parseInt(request.getParameter("no"));
			//2. 업무로직 : board객체 조회 (첨부파일 attach조회)
			Product product = marketService.selectProduct(no);
			if(product == null) {
//				throw new BoardException("해당 게시글이 존재하지 않습니다.");
=======
		
		int no = 0;
		try {
			no = Integer.parseInt(request.getParameter("no"));
			
			Product product = marketService.selectProduct(no);
			if(product == null) {
>>>>>>> Stashed changes
				System.out.println("게시글이 존재하지 않음. 임시경고.");
			}
			String id = product.getId();
			Member member = memberService.selectMemberId(id);
<<<<<<< Updated upstream
=======
			
			List<pAttach> attachList = marketService.selectAttachList(no);
			
			
>>>>>>> Stashed changes
			//xss 공격방지
			product.setTitle(MvcUtils.escapeHtml(product.getTitle()));
			product.setDescription(MvcUtils.escapeHtml(product.getDescription()));

			
			// \n 개행문자를 <br/>태그로 변경해주기
			product.setDescription(MvcUtils.convertLineFeedToBr(product.getDescription()));
			
			
			//이 게시글의 댓글 가져오기
<<<<<<< Updated upstream
//			List<BoardComment> commentList = boardService.selectBoardCommentList(no); 
//			System.out.println("commentList@servlet = "+commentList);
=======
//			List<ProductComment> commentList = marketService.selectCommentList(no);
			List<ProductCommentExt> commentList = marketService.selectCommentExtList(no);
>>>>>>> Stashed changes

			//3. jsp forwarding
			request.setAttribute("product", product);
			request.setAttribute("member", member);
<<<<<<< Updated upstream
//			request.setAttribute("commentList", commentList);
			request.getRequestDispatcher("/WEB-INF/views/market/marketView.jsp")
					.forward(request, response);
		} catch (Exception e) {	
			//로깅
			e.printStackTrace();
			//관리자이메일 알림
			//다시 예외를 던져서 WAS가 정한 예외페이지에서 응답메시지를 작성
=======
			request.setAttribute("attachList", attachList);
			request.setAttribute("commentList", commentList);
			request.getRequestDispatcher("/WEB-INF/views/market/marketView.jsp")
					.forward(request, response);
		} catch (Exception e) {	
			e.printStackTrace();
>>>>>>> Stashed changes
			throw e;
		} 		
		
	}

}
