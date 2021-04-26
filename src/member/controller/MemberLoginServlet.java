package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

<<<<<<< Updated upstream
=======
import common.MvcUtils;
>>>>>>> Stashed changes
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/member/login")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService service = new MemberService();
<<<<<<< Updated upstream
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/memberLogin.jsp")
 	   .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Member loginMember = new Member();
		
		loginMember.setMemberId(request.getParameter("loginId"));
		loginMember.setPassword(request.getParameter("loginPw"));
		
		loginMember = service.selectOne(loginMember);
		
		//System.out.println(loginMember.toString());
		
		HttpSession session = request.getSession(true);
		session.setAttribute("loginUser", loginMember);
		if (loginMember != null) 
		{	System.out.println(loginMember.toString());
			request.getRequestDispatcher("/index.jsp")
			.forward(request, response);
		}
		else
		{
			request.getRequestDispatcher("/WEB-INF/views/member/memberLoginError.jsp")
			.forward(request, response);
		}
		
=======

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/memberLogin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String memberId = request.getParameter("loginId");
		String password = request.getParameter("loginPw");
//		String password = MvcUtils.getSha512(request.getParameter("loginPw"));
		
		Member loginMember = new Member();
		loginMember.setMemberId(memberId);
		loginMember.setPassword(password);
		
		Member member = service.selectOne(loginMember);

		HttpSession session = request.getSession(true);
		
		session.setAttribute("loginMember", member);
		
		if(member != null && password.equals(member.getPassword())) {
			response.sendRedirect(request.getContextPath());
		} else {
			request.getSession().setAttribute("msg", "로그인에 실패하셨습니다.");
			response.sendRedirect(request.getContextPath());
		}

>>>>>>> Stashed changes
	}

}
