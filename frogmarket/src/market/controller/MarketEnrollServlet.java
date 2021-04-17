package market.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;


import common.MvcFileRenamePolicy;
import market.model.service.MarketService;
import market.model.vo.Product;
import market.model.vo.pAttach;

/**
 * Servlet implementation class MarketEnrollServlet
 */
@WebServlet("/market/marketEnroll")
public class MarketEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MarketService marketService = new MarketService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. MultipartRequest객체 생성
		// /WebContent/upload/board/업로드파일명.jpg
		// getRealPath :  web root dir를 절대경로로 반환
		
		String saveDirectory = getServletContext().getRealPath("/upload/market");
		System.out.println("saveDirectory@servlet ="+saveDirectory);
		
		//최대 파일 허용 크기 10mb = 10 * 1kb * 1kb
		int maxPostSize = 10*1024*1024;
		
		//인코딩
		String encoding = "utf-8";
		
		//파일명 변경정책 객체
		//중복파일인 경우, numbering처리
		//filerename : 20210406191919_123.jpg
//		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		FileRenamePolicy policy = new MvcFileRenamePolicy();
		
		MultipartRequest multipartRequest = 
				new MultipartRequest(
						request,
						saveDirectory, 
						maxPostSize, 
						encoding, 
						policy
					);

		try {
			//2. db에 게시글/첨부파일 정보 저장
			
			//2-1. 사용자 입력값처리
			// title writer upFile content
			String id = multipartRequest.getParameter("writer");
			String title = multipartRequest.getParameter("title");
			String status = multipartRequest.getParameter("status");
			int price = Integer.parseInt(multipartRequest.getParameter("price"));
			String description = multipartRequest.getParameter("description");
			String area = multipartRequest.getParameter("local");

			//업로드한 파일명
			String originalFileName = multipartRequest.getOriginalFileName("upFile");
			String renamedFileName =  multipartRequest.getFilesystemName("upFile");
			
			System.out.println("id@servlet = "+id);
			System.out.println("title@servlet = "+title);
			System.out.println("status@servlet = "+status);
			System.out.println("price@servlet = "+price);
			System.out.println("description@servlet = "+description);
			System.out.println("area@servlet = "+area);

			Product product = new Product();

			product.setId(id);
			product.setTitle(title);
			product.setStatus(status);
			product.setPrice(price);
			product.setDescription(description);
			product.setArea(area);
			
			//첨부파일이 있는 경우
			//multipartRequest.getFile("upFile"):File !=null 이것은 또다른 방법
			if(originalFileName!=null) {
				pAttach attach = new pAttach();
				attach.setOriginalFileName(originalFileName);
				attach.setRenamedFileName(renamedFileName);
				product.setAttach(attach);
			}
			
			//2. 업무로직 : db에 insert		
			int result = marketService.insertProduct(product);
			System.out.println("처리결과 = "+result);
			
			//가입 성공/실패여부 판단
			//1. 가입 성공: result==1
			//2. 가입 실패 : result==0 || result==null
			
			HttpSession	session = request.getSession();
			
			String msg = (result>0) ? "게시글 등록 성공!" : "게시글 등록 실패!";
			String location = request.getContextPath();
			location+= (result>0) ? "/market/marketView?no="+product.getNo() : "/market/marketList";
			
			session.setAttribute("msg", msg);
			response.sendRedirect(location);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
