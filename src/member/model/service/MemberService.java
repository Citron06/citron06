package member.model.service;

<<<<<<< Updated upstream
import static common.JDBCTemplate.*;
=======
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;
>>>>>>> Stashed changes

import java.sql.Connection;
import java.util.List;
import java.util.Map;

<<<<<<< Updated upstream
import member.model.dao.MemberDao;
=======
import market.model.vo.Product;
import member.model.dao.MemberDao;
import member.model.vo.Cart;
>>>>>>> Stashed changes
import member.model.vo.Member;

public class MemberService {

	private MemberDao memberDao = new MemberDao();

	public static final String MEMBER_ROLE = "U";
	public static final String ADMIN_ROLE = "A";
	
	public Member selectOne(Member loginMember) {
		Connection conn = getConnection();
		Member member = memberDao.selectOne(conn, loginMember);
		close(conn);
		return member;
	}
	
	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = memberDao.insertMember(conn, member);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}
	
    public int updateMember(Member member) {
		Connection conn = getConnection();
		int result = memberDao.updateMember(conn, member);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}
    
<<<<<<< Updated upstream
    public int deleteMember(String memberId) {
		Connection conn = getConnection();
		int result = memberDao.deleteMember(conn, memberId);
=======
    public int deleteMember(Member member) {
		Connection conn = getConnection();
		int result = memberDao.deleteMember(conn, member);
>>>>>>> Stashed changes
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}

<<<<<<< Updated upstream
	public int updatePassword(Member member) {
		Connection conn = getConnection();
		int result = memberDao.updatePassword(conn, member);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}

=======
>>>>>>> Stashed changes
	public List<Member> selectList() {
		Connection conn = getConnection();
		List<Member> list = memberDao.selectList(conn);
		close(conn);
		return list;
	}
	
	public List<Member> selectList(int start, int end) {
		Connection conn = getConnection();
		List<Member> list = memberDao.selectList(conn, start, end);
		close(conn);
		return list;
	}

	public int updateMemberRole(Member member) {
		Connection conn = getConnection();
		int result = memberDao.updateMemberRole(conn, member);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}

	public List<Member> searchMember(Map<String, String> param) {
		Connection conn = getConnection();
		List<Member> list = memberDao.searchMember(conn, param);
		close(conn);
		return list;
	}

	public int selectMemberCount() {
		Connection conn = getConnection();
		int totalContents = memberDao.selectMemberCount(conn);
		close(conn);
		return totalContents;
	}

	public int searchMemberCount(Map<String, String> param) {
		Connection conn = getConnection();
		int totalContents = memberDao.searchMemberCount(conn, param);
		close(conn);
		return totalContents;
	}

	public Member selectMemberId(String id) {
		Connection conn = getConnection();
		Member member = memberDao.selectMemberId(conn, id);
		close(conn);
		return member;
	}

<<<<<<< Updated upstream
	
=======
	public int addHeart(Member member) {
		Connection conn = getConnection();
		int result = memberDao.addHeart(conn, member);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}


	/**
	 * 장바구니 등록
	 * @param cart
	 * @return
	 */
	public int insertCart(Cart cart) {
		Connection conn = getConnection();
		int result = memberDao.insertCart(conn, cart);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}
	
	/**
	 * 장바구니 리스트 선택
	 * @param cart
	 * @return
	 */
	public List<Cart> selectCartList(String memberId) {
		Connection conn = getConnection();
		List<Cart> list = memberDao.selectCartList(conn, memberId);
		close(conn);
		
		return list;
	}

	/**
	 * 장바구니 삭제
	 * @param cart
	 * @return
	 */
	public int deleteCart(Cart cart) {
		Connection conn = getConnection();
		int result = memberDao.deleteCart(conn, cart);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}

	/**
	 * 장바구니 검색용 서비스
	 * @param start
	 * @param end
	 * @return
	 */
	public List<Product> selectList(List<Cart> cList, int start, int end) {
		Connection conn = getConnection();
		//--------Dao 요청----------
		List<Product> list = memberDao.selectList(conn, cList, start, end);
		
		close(conn);
		
		return list;
	}

	public int selectCartCount() {
		Connection conn = getConnection();
		int totalContent = memberDao.selectCartCount(conn);
		close(conn);
		
		return totalContent;
	}
>>>>>>> Stashed changes


}
