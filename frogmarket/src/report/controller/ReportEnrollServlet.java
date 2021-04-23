package report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.MvcFileRenamePolicy;
import report.model.service.ReportService;
import report.model.vo.RAttach;
import report.model.vo.Report;

/**
 * Servlet implementation class ReportEnrollServlet
 */
@WebServlet("/report/reportEnroll")
public class ReportEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReportService reportService = new ReportService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String saveDirectory = getServletContext().getRealPath("/upload/report");
		System.out.println("saveDirectory@servlet =" + saveDirectory);

		int maxPostSize = 10 * 1024 * 1024;

		String encoding = "utf-8";

		FileRenamePolicy policy = new MvcFileRenamePolicy();

		MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);

		try {
			String id = multipartRequest.getParameter("writer");
			String target = multipartRequest.getParameter("target");
			String comment = multipartRequest.getParameter("comment");

			// 업로드한 파일명
			String originalFileName = multipartRequest.getOriginalFileName("upFile");
			String renamedFileName = multipartRequest.getFilesystemName("upFile");

			Report report = new Report();

			report.setMemberId(id);
			report.setMemberReportId(target);
			report.setContent(comment);

			if (originalFileName != null) {
				RAttach attach = new RAttach();
				attach.setOriginalFileName(originalFileName);
				attach.setRenamedFileName(renamedFileName);
				report.setAttach(attach);
			}

			// 2. 업무로직 : db에 insert
			int result = reportService.insertReport(report);

			HttpSession session = request.getSession();

			String msg = (result > 0) ? "신고가 접수되었습니다." : "신고 등록에 실패하였습니다.";
			String location = request.getContextPath();
			location += (result > 0) ? "/report/reportView?no=" + report.getReportNo() : "/report/reportList";

			session.setAttribute("msg", msg);
			response.sendRedirect(location);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
