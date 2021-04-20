package market.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import market.model.dao.MarketDao;
import market.model.vo.Product;
import market.model.vo.pAttach;

public class MarketService {
	private MarketDao marketDao = new MarketDao();

	public int insertProduct(Product product, pAttach[] attArr) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			result = marketDao.insertProduct(conn,product);
			
			//생성된 product_no를 가져오기
			int productNo =  marketDao.selectLastProductNo(conn);
			product.setNo(productNo);
			
//			if(product.getAttach()!=null) {
//				//참조할 marketNo 세팅
//				product.getAttach().setProductNo(productNo);
//				result = marketDao.insertAttachment(conn,product.getAttach());
//			}
			int i=0;
			while(attArr[i]!=null) {
				attArr[i].setProductNo(productNo);
				result = marketDao.insertAttachment(conn,attArr[i]);
				i++;
			}
			commit(conn);

		} catch (Exception e) {
//			e.printStackTrace();
			rollback(conn);
			result=0;
			throw e;
		} finally {
			close(conn);			
		}
	
//		if(result>0) commit(conn);
//		else rollback(conn);
		
		return result;
	}

	public Product selectProduct(int no) {
		Connection conn = getConnection();
		pAttach attach = null;
		Product product = null;

		try {
			product = marketDao.selectProduct(conn,no);
			
//			if(product.getAttach()!=null) {
//				attach = marketDao.selectAttach(conn,no);
//			}
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
		} finally {
			close(conn);
		}
		return product;
	}

	public List<Product> selectList(int start, int end) {
		Connection conn = getConnection();
		//--------Dao 요청----------
		List<Product> list = marketDao.selectList(conn,start,end);
		close(conn);
		
		return list;
	}

	public int selectProductCount() {
		Connection conn = getConnection();
		int totalContent = marketDao.selectProductCount(conn);
		close(conn);
		
		return totalContent;
	}

	public List<pAttach> selectAttachList(int no) {
		Connection conn = getConnection();
		//--------Dao 요청----------
		List<pAttach> list = marketDao.selectAttachList(conn,no);

		close(conn);
		
		return list;
	}

}
