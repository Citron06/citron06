package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberAccountServlet
 */
@WebServlet("/member/account")
public class MemberAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String MEMBER_ROLE = "U";
	
	private MemberService memberService = new MemberService();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/memberAccount.jsp")
	 	   .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member member = new Member();
		
		member.setMemberId(request.getParameter("memberId"));
		member.setPassword(request.getParameter("password"));
		member.setMemberRole(request.getParameter("memberRole"));
		member.setEmail(request.getParameter("email"));
		member.setPhone(request.getParameter("phone"));
		member.setNickId(request.getParameter("nickId"));
		member.setMemberRole(MEMBER_ROLE);
		
		int result = memberService.insertMember(member);
<<<<<<< Updated upstream
=======
		System.out.println("member@servlet = " + member);
>>>>>>> Stashed changes
		
		HttpSession session = request.getSession(true);
		session.setAttribute("AccountUser", member);
		
		System.out.println(member.toString());
		request.getRequestDispatcher("/WEB-INF/views/member/accountResult.jsp").forward(request, response);
	}

}
