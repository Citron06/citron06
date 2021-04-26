package graph.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import graph.model.dao.GraphDao;
import graph.model.vo.Graph;
<<<<<<< Updated upstream
=======
import market.model.vo.Product;
>>>>>>> Stashed changes


public class GraphService {
	
	private GraphDao graphDao = new GraphDao();

	public List<Graph> selectList(String keyword) {
		
		Connection conn = getConnection();
		
		List<Graph> list = graphDao.selectList(conn, keyword);
		
		close(conn);
		
		return list;
	}

<<<<<<< Updated upstream
	
=======
	public List<Graph> searchProductList(String searchKeyword) {
		Connection conn = getConnection();
		//검색어를 나눠서 배열로 넘김
		String[] keywordArr = searchKeyword.split(",|\\s+");		
		List<Graph> list = graphDao.searchProductList(conn,keywordArr);

		close(conn);
		return list;
	}
>>>>>>> Stashed changes
	
	
	
	
}
