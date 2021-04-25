package member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

@WebServlet ("/member/memberUpdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MemberService memberService = new MemberService();
	NoticeService noticeService = new NoticeService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("newPassword");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String nickId = request.getParameter("nickId");
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setPassword(password);
		member.setEmail(email);
		member.setPhone(phone);
		member.setNickId(nickId);
		System.out.println("member@servlet = " + member);
		//3.업무로직
		int result = memberService.updateMember(member);
		System.out.println(result);
		//4. 사용자피드백 및 리다이렉트 처리
		HttpSession session = request.getSession();
		String msg = "";

		if(result > 0){
			msg = "성공적으로 회원정보를 수정했습니다.";
			//세션의 정보도 갱신
			session.setAttribute("loginMember", memberService.selectOne(member));
		}
		else {
			msg = "회원정보수정에 실패했습니다.";
		}	
		
		session.setAttribute("msg", msg);
//		response.sendRedirect(request.getContextPath() + "/member/memberView.jsp");
		request.getRequestDispatcher("/WEB-INF/views/member/memberView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//회원정보 수정을 누르면 이 doGet함수를 호출해요 이유는 아까 form에서 get방식으로 넘겨줬기 때문이예요
		//이건 값을 받아오기만 해서 get을 쓴거고 이 정보를 전달하려면 post를 써야해요
		//그래서 memberUpdate.jsp에서 회원정보를 수정 후에 submit을 누르면 msg나 msmber값 등 필요한 값을 전달해야하니까 Post로 보내게 될겁니다
		
		//1. 회워정보 수정을 눌렀을 때 memberId 값을 받아오기
		String memberId = request.getParameter("memberId");

		//2. 받아온 memberId로 회원의 정보값 받아오기
		Member member = memberService.selectMemberId(memberId);
		List<Notice> noticeList = noticeService.selectNoticeList(memberId);
//		int result = noticeService.deleteNotice(5);
//		System.out.println("삭제결과 : "+result);
				
		request.setAttribute("noticeList", noticeList);

		//3. 회원 정보값을 memberUpdate.jsp에 넘기도록 하기
		request.setAttribute("member", member);
		
		//4. memberUpdate.jsp 호출
		request.getRequestDispatcher("/WEB-INF/views/member/memberUpdate.jsp").forward(request, response);
		
		//이 순서로 memberUpdate.jsp로 갑니다
	}

}
