package report.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MvcUtils;
import report.model.service.ReportService;
import report.model.vo.Report;

/**
 * Servlet implementation class ReportListServlet
 */
@WebServlet("/report/reportList")
public class ReportListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ReportService reportService = new ReportService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
<<<<<<< Updated upstream
		// 0. 인코딩처리는 EncodingFilter가 선처리
		// 1. 사용자 입력값
//		final int numPerPage = 5;
//		int cPage = 1;
//		try {
//			cPage = Integer.parseInt(request.getParameter("cPage"));
//		} catch (NumberFormatException e) {
//
//		}

		// 2. 업무로직
		// a. contents영역 : start ~ end
		// cPage 1, numPerPage 5 -> 1 ~ 5
		// cPage 2, numPerPage 5 -> 6 ~ 10
//		int start = (cPage - 1) * numPerPage + 1;
//		int end = cPage * numPerPage;
		List<Report> list = reportService.selectList();
		System.out.println("list@servlet = " + list);

		// b. pageBar영역
//		int totalContents = boardService.selectBoardCount();
//		String url = request.getRequestURI();
//		String pageBar = MvcUtils.getPageBar(cPage, numPerPage, totalContents, url);

		// 3. 응답 html처리 jsp에 위임.
		request.setAttribute("reportList", list);
//		request.setAttribute("pageBar", pageBar);
=======

		List<Report> list = reportService.selectList();
		System.out.println("list@servlet = " + list);

		request.setAttribute("reportList", list);
>>>>>>> Stashed changes
		request.getRequestDispatcher("/WEB-INF/views/report/reportList.jsp").forward(request, response);

	}

}
