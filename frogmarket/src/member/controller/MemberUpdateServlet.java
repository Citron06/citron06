package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

@WebServlet ("/member/memberUpdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemberService memberService = new MemberService();
		
		request.setCharacterEncoding("UTF-8");
		
		//업데이크 jsp에서 입력값을 받아왔다고 치고 그 입력값을 일담 임의로 지정해 둡니다
		String memberId = "rabbit"; //<=이거처럼 member 변수 안에 들어갈 값을 일단 일일히 정해놓고
		//그럴려면 여기에 저 아래 member에 들어갈 변수를 모두 적어줘야겠죠?
		String password = "karrot";
		String memberRole = "U";
		String email = "";
		String phone = "";
		Date enrollDate = null;
		String nickId = "중고장인";
		Double goodScore = 2.1;
		
		//

		Member member = new Member(memberId, password, memberRole, email, phone, enrollDate, nickId, goodScore);
		
		//3.업무로직
//		int result = memberService.updateMember(member);
		System.out.println("member@servlet = " + member);

		//4. 사용자피드백 및 리다이렉트 처리
		HttpSession session = request.getSession();
		String msg = "";

//		if(result > 0){
//			msg = "성공적으로 회원정보를 수정했습니다.";
//			//세션의 정보도 갱신
//			session.setAttribute("loginMember", memberService.selectOne(member));
//		}
//		else 
//			msg = "회원정보수정에 실패했습니다.";	
		
		session.setAttribute("msg", msg);
//		response.sendRedirect(request.getContextPath() + "/member/memberView");
		
		request.getRequestDispatcher("/WEB-INF/views/member/memberUpdate.jsp").forward(request, response);
		
	}

}
