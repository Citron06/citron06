package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
<<<<<<< HEAD
=======
<<<<<<< Updated upstream
=======
>>>>>>> 8b396b6ab3b271e398e56ae6b6a1ba61dd76c2d4
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
<<<<<<< HEAD
=======
>>>>>>> Stashed changes
>>>>>>> 8b396b6ab3b271e398e56ae6b6a1ba61dd76c2d4

/**
 * Servlet implementation class MemberLoginServlet
 */
<<<<<<< HEAD
=======
<<<<<<< Updated upstream
@WebServlet("/member/MemberLogin")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
=======
>>>>>>> 8b396b6ab3b271e398e56ae6b6a1ba61dd76c2d4
@WebServlet("/member/login")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService service = new MemberService();
<<<<<<< HEAD
=======
>>>>>>> Stashed changes
>>>>>>> 8b396b6ab3b271e398e56ae6b6a1ba61dd76c2d4
       
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
<<<<<<< HEAD
=======
<<<<<<< Updated upstream
		   .forward(request, response);
=======
>>>>>>> 8b396b6ab3b271e398e56ae6b6a1ba61dd76c2d4
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
		
		System.out.println(loginMember.toString());
		
		HttpSession session = request.getSession(true);
		session.setAttribute("loginUser", loginMember);
		
		request.getRequestDispatcher("/WEB-INF/views/member/memberLogin.jsp")
		.forward(request, response);
		
<<<<<<< HEAD
=======
>>>>>>> Stashed changes
>>>>>>> 8b396b6ab3b271e398e56ae6b6a1ba61dd76c2d4
	}

}
