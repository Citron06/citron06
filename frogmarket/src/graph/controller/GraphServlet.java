package graph.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;


import graph.model.service.GraphService;
import graph.model.vo.Graph;

/**
 * Servlet implementation class GraphServlet
 */
@WebServlet("/graph/graphView")
public class GraphServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GraphServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String graphKeyword = request.getParameter("header-search");
		System.out.println("그래프 뷰 파라미터 " + graphKeyword);
		HttpSession session = request.getSession();
		String beforeKeyword = (String) session.getAttribute("searchKeyword");
		
		System.out.println("비포 키워드 " +beforeKeyword);
		
		
		
		session.setAttribute("graphKeyword", graphKeyword);
		request.getRequestDispatcher("/WEB-INF/views/graph/graph.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
