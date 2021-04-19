package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
<<<<<<< HEAD
=======
<<<<<<< Updated upstream
 * Servlet implementation class MemberAcount
 */
@WebServlet("/member/MemberAccount")
public class MemberAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
=======
>>>>>>> 8b396b6ab3b271e398e56ae6b6a1ba61dd76c2d4
 * Servlet implementation class MemberAccountServlet
 */
@WebServlet("/member/account")
public class MemberAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
<<<<<<< HEAD
=======
>>>>>>> Stashed changes
>>>>>>> 8b396b6ab3b271e398e56ae6b6a1ba61dd76c2d4

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
=======
<<<<<<< Updated upstream
		request.getRequestDispatcher("/WEB-INF/views/member/memberAccount.jsp")
			   .forward(request, response);
=======
>>>>>>> 8b396b6ab3b271e398e56ae6b6a1ba61dd76c2d4
		request.getRequestDispatcher("/WEB-INF/views/member/memberAcount.jsp")
	 	   .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
<<<<<<< HEAD
=======
>>>>>>> Stashed changes
>>>>>>> 8b396b6ab3b271e398e56ae6b6a1ba61dd76c2d4
	}

}
