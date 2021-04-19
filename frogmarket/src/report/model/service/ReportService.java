package report.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import report.model.dao.ReportDao;
import report.model.vo.Report;

public class ReportService {

	private ReportDao boardDao = new ReportDao();

	public List<Report> selectList() {
		Connection conn = getConnection();
		List<Report> list = boardDao.selectList(conn);
		close(conn);
		return list;
	}

}
