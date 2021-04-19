package graph.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import graph.model.dao.GraphDao;
import graph.model.vo.Graph;


public class GraphService {
	
	private GraphDao graphDao = new GraphDao();

	public List<Graph> selectList(String keyword) {
		
		Connection conn = getConnection();
		
		List<Graph> list = graphDao.selectList(conn, keyword);
		
		close(conn);
		
		return list;
	}

	
	
	
	
	
}
