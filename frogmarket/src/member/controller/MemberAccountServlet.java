package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
<<<<<<< Updated upstream
 * Servlet implementation class MemberAcount
 */
@WebServlet("/member/MemberAccount")
public class MemberAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
=======
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
>>>>>>> Stashed changes

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< Updated upstream
		request.getRequestDispatcher("/WEB-INF/views/member/memberAccount.jsp")
			   .forward(request, response);
=======
		request.getRequestDispatcher("/WEB-INF/views/member/memberAcount.jsp")
	 	   .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
>>>>>>> Stashed changes
	}

}
