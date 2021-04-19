package market.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import market.model.vo.Product;
import market.model.vo.pAttach;

public class MarketDao {
	private Properties prop = new Properties();
	
	public MarketDao() {
		//board-query.properties의 내용 읽어와서 prop에 저장
		
		String fileName = MarketDao.class	//클래스 객체
				.getResource("/sql/market/market-query.properties") //url객체
				.getPath(); //String객체 : 절대경로
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertProduct(Connection conn, Product product) {
		PreparedStatement pstmt = null;
		//String sql = prop.getProperty("insertBoard");
		String sql = "insert into p_board values( seq_p_board_no.nextval ,?,?,?,?,?,default,?)";
		int result = 0;

		try {
			//3. PreparedStatement 객체 생성(미완성쿼리)
			pstmt = conn.prepareStatement(sql);
			//3-1) 미완성쿼리의 '?'에 값 대입
			pstmt.setString(1, product.getId());
			pstmt.setString(2, product.getTitle());
			pstmt.setString(3, product.getStatus());
			pstmt.setInt(4, product.getPrice());
			pstmt.setString(5, product.getDescription());
			pstmt.setString(6, product.getArea());
			//4. 실행 DML(executeUpdate) -> int , DQL(executeQuery) -> REsultSet
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
//			throw new BoardException("게시물 첨부파일 등록 오류",e);
			e.printStackTrace();
		}finally {
			//5. 자원반납(pstmt)
			close(pstmt);
		}
		
		return result;
	}


	public int selectLastProductNo(Connection conn) {
		int boardNo = 0;		
		PreparedStatement pstmt = null;
		ResultSet rset=null;
//		String sql = prop.getProperty("selectLastBoardNo");
		String sql = "select seq_p_board_no.currval board_no from dual";
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				boardNo= rset.getInt("board_no");
			}
		} catch (SQLException e) {
//			throw new BoardException("게시물 첨부파일 등록 오류",e);
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}		
		return boardNo;
	}
	
	public int insertAttachment(Connection conn, pAttach attach) {
		PreparedStatement pstmt = null;
		int result = 0;
//		String sql = prop.getProperty("insertPattach");
		String sql = "insert into p_attach(no, board_no, original_filename, renamed_filename) values(seq_p_attach_no.nextval,?,?,?)";
		try {
			//3. PreparedStatement 객체 생성(미완성쿼리)
			pstmt = conn.prepareStatement(sql);
			//3-1) 미완성쿼리의 '?'에 값 대입
			pstmt.setInt(1, attach.getProductNo());
			pstmt.setString(2, attach.getOriginalFileName());
			pstmt.setString(3, attach.getRenamedFileName());
			//4. 실행 DML(executeUpdate) -> int , DQL(executeQuery) -> REsultSet
			result = pstmt.executeUpdate();

		} catch (Exception e) {
//			throw new BoardException("게시물 첨부파일 등록 오류",e);
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Product selectProduct(Connection conn, int no) {
		PreparedStatement pstmt = null;
//		String sql = prop.getProperty("selectProduct");
		String sql = "select * from p_board where board_no=?";
		ResultSet rset=null;
		Product product = null;
		try {
			//3. PreparedStatement 객체 생성(미완성쿼리)
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);

			//4. 실행 DML(executeUpdate) -> int , DQL(executeQuery) -> REsultSet
			rset = pstmt.executeQuery();
			//4-1) ResultSet -> Java객체 옮겨담기
			while(rset.next()) {
				product = new Product();
				product.setNo(rset.getInt("board_no"));
				product.setId(rset.getString("seller_id"));
				product.setTitle(rset.getString("title"));
				product.setStatus(rset.getString("status"));
				product.setPrice(rset.getInt("sell_price"));
				product.setDescription(rset.getString("description"));
				product.setRegDate(rset.getDate("reg_date"));
				product.setArea(rset.getString("area_info"));
			}			
		} catch (SQLException e) {
//			throw new BoardException("게시글 조회 오류",e);
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return product;
	}

	public pAttach selectAttach(Connection conn, int no) {
		PreparedStatement pstmt = null;
//		String sql = prop.getProperty("selectAttach");
		String sql = "select * from p_attach where board_no=?";
		ResultSet rset=null;
		pAttach attach = null;
		try {
			//3. PreparedStatement 객체 생성(미완성쿼리)
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);

			//4. 실행 DML(executeUpdate) -> int , DQL(executeQuery) -> REsultSet
			rset = pstmt.executeQuery();
			//4-1) ResultSet -> Java객체 옮겨담기
			while(rset.next()) {
				attach = new pAttach();
				
				attach.setNo(rset.getInt("no"));
				attach.setProductNo(rset.getInt("board_no"));
				attach.setOriginalFileName(rset.getString("original_filename"));
				attach.setRenamedFileName(rset.getString("renamed_filename"));
			}
			
		} catch (Exception e) {
//			throw new BoardException("첨부파일 조회 오류",e);
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return attach;
	}

	public List<Product> selectList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
//		String sql = prop.getProperty("selectList");
		String sql = "select * from(select row_number() over(order by b.board_no desc) rnum,  b.*, a.no attach_no, a.original_filename, a.renamed_filename from p_board b left join p_attach a on b.board_no = a.board_no) B where rnum between ? and ?";
		ResultSet rset=null;
		List<Product> list = new ArrayList<Product>();
		Product product = null;
		try {
			//3. PreparedStatement 객체 생성(미완성쿼리)
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			//4. 실행 DML(executeUpdate) -> int , DQL(executeQuery) -> REsultSet
			rset = pstmt.executeQuery();
			//4-1) ResultSet -> Java객체 옮겨담기
			while(rset.next()) {
				product = new Product();
				product.setNo(rset.getInt("board_no"));
				product.setTitle(rset.getString("title"));
				product.setStatus(rset.getString("status"));
				product.setPrice(rset.getInt("sell_price"));
				product.setArea(rset.getString("area_info"));
				
//				product.setId(rset.getString("seller_id"));
//				product.setDescription(rset.getString("description"));
//				product.setRegDate(rset.getDate("reg_date"));

				
				//첨부파일이 있는 경우
				if(rset.getInt("attach_no")!=0) {
					pAttach attach = new pAttach();
					attach.setProductNo(rset.getInt("board_no"));
					attach.setNo(rset.getInt("no"));
					attach.setOriginalFileName(rset.getString("original_filename"));
					attach.setRenamedFileName(rset.getString("renamed_filename"));
					product.setAttach(attach);
				}
				
				list.add(product);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int selectProductCount(Connection conn) {
		PreparedStatement pstmt = null;
//		String sql = prop.getProperty("selectProductCount");
		String sql = "select count(*) cnt from p_board";
		int count = 0;		
		ResultSet rset=null;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				count= rset.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);			
		}
		
		return count;
	}


}
