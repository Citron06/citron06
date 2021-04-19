package report.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import report.model.vo.Report;

public class ReportDao {

	private Properties prop = new Properties();
	
	public ReportDao() {
		String fileName = "/sql/report/report-query.properties";
		String absPath = ReportDao.class.getResource(fileName).getPath();
		try {
			prop.load(new FileReader(absPath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public List<Report> selectList(Connection conn) {
		List<Report> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, start);
//			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Report report = new Report();
				report.setReportNo(rset.getInt("report_no"));
				report.setMemberId(rset.getString("member_id"));
				report.setMemberReportId(rset.getString("member_report_id"));
				report.setRegDate(rset.getDate("reg_date"));
				report.setContent(rset.getString("content"));
				
				//첨부파일이 있는 경우
//				if(rset.getInt("attach_no") != 0) {
//					Attachment attach = new Attachment();
//					attach.setNo(rset.getInt("attach_no"));
//					attach.setBoardNo(rset.getInt("no"));
//					attach.setOriginalFileName(rset.getString("original_filename"));
//					attach.setRenamedFileName(rset.getString("renamed_filename"));
//					attach.setStatus("Y".equals(rset.getString("status")) ? true : false);
//					board.setAttach(attach);
//				}
				
				list.add(report);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
