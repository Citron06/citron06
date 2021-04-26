package member.model.vo;

import java.sql.Date;

<<<<<<< Updated upstream
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

=======
>>>>>>> Stashed changes
/**
 * 
 * VO클래스
 * 
 * DB테이블의 한행의 정보를 가지고 있는 객체
 */
public class Member {
	
	private String memberId;
	private String password;
	private String memberRole;
	private String email;
	private String phone;
	private Date enrollDate;
	private String nickId;
	private double goodScore;
<<<<<<< Updated upstream
=======
<<<<<<<< Updated upstream:src/member/model/vo/Member.java
	private String icon;
========
>>>>>>>> Stashed changes:frogmarket/src/member/model/vo/Member.java
>>>>>>> Stashed changes
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String memberId, String password, String memberRole, String email, String phone, Date enrollDate,
<<<<<<< Updated upstream
			String nickId, double goodScore) {
=======
<<<<<<<< Updated upstream:src/member/model/vo/Member.java
			String nickId, double goodScore, String icon) {
========
			String nickId, double goodScore) {
>>>>>>>> Stashed changes:frogmarket/src/member/model/vo/Member.java
>>>>>>> Stashed changes
		super();
		this.memberId = memberId;
		this.password = password;
		this.memberRole = memberRole;
		this.email = email;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.nickId = nickId;
		this.goodScore = goodScore;
<<<<<<< Updated upstream
=======
<<<<<<<< Updated upstream:src/member/model/vo/Member.java
		this.icon = icon;
========
>>>>>>>> Stashed changes:frogmarket/src/member/model/vo/Member.java
>>>>>>> Stashed changes
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemberRole() {
		return memberRole;
	}

	public void setMemberRole(String memberRole) {
		this.memberRole = memberRole;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getNickId() {
		return nickId;
	}

	public void setNickId(String nickId) {
		this.nickId = nickId;
	}

	public double getGoodScore() {
		return goodScore;
	}
<<<<<<< Updated upstream
=======
<<<<<<<< Updated upstream:src/member/model/vo/Member.java
>>>>>>> Stashed changes

	public void setGoodScore(double goodScore) {
		this.goodScore = goodScore;
	}

<<<<<<< Updated upstream
=======
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

========
	
	public void setGoodScore(double goodScore) {
		this.goodScore = goodScore;
	}
	
>>>>>>>> Stashed changes:frogmarket/src/member/model/vo/Member.java
>>>>>>> Stashed changes
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", password=" + password + ", memberRole=" + memberRole + ", email="
				+ email + ", phone=" + phone + ", enrollDate=" + enrollDate + ", nickId=" + nickId + ", goodScore="
<<<<<<< Updated upstream
				+ goodScore + "]";
	}
=======
<<<<<<<< Updated upstream:src/member/model/vo/Member.java
				+ goodScore + ", icon=" + icon + "]";
	}

========
				+ goodScore + "]";
	}
>>>>>>>> Stashed changes:frogmarket/src/member/model/vo/Member.java
>>>>>>> Stashed changes
}