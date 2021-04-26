package report.model.vo;

import java.sql.Date;

public class Report {
	private int reportNo;
	private String memberId;
	private String memberReportId;
	private Date regDate;
	private String content;
<<<<<<< Updated upstream
=======
	private RAttach attach;
>>>>>>> Stashed changes
	
	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Report(int reportNo, String memberId, String memberReportId, Date regDate, String content) {
		super();
		this.reportNo = reportNo;
		this.memberId = memberId;
		this.memberReportId = memberReportId;
		this.regDate = regDate;
		this.content = content;
	}
<<<<<<< Updated upstream
=======
	
	public Report(int reportNo, String memberId, String memberReportId, Date regDate, String content, RAttach attach) {
		super();
		this.reportNo = reportNo;
		this.memberId = memberId;
		this.memberReportId = memberReportId;
		this.regDate = regDate;
		this.content = content;
		this.attach = attach;
	}
>>>>>>> Stashed changes

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberReportId() {
		return memberReportId;
	}

	public void setMemberReportId(String memberReportId) {
		this.memberReportId = memberReportId;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

<<<<<<< Updated upstream
	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", memberId=" + memberId + ", memberReportId=" + memberReportId
				+ ", regDate=" + regDate + ", content=" + content + "]";
	}
	
=======
	public RAttach getAttach() {
		return attach;
	}

	public void setAttach(RAttach attach) {
		this.attach = attach;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", memberId=" + memberId + ", memberReportId=" + memberReportId
				+ ", regDate=" + regDate + ", content=" + content + ", attach=" + attach + "]";
	}

>>>>>>> Stashed changes
}
