package graph.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


import graph.model.service.GraphService;
import graph.model.vo.Graph;

/**
 * Servlet implementation class GraphServlet
 */
@WebServlet("/graph/graph")
public class GraphServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private GraphService graphService = new GraphService();
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
		
		String keyword = request.getParameter("keyword");
		
		List <Graph> list = graphService.selectList(keyword);
		
		for(Graph g : list) {
			System.out.println(g);
		}
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);
		
		System.out.println(jsonStr);
		PrintWriter out = response.getWriter();
		out.print(jsonStr);
		
		
		request.getRequestDispatcher("/WEB-INF/views/graph/graph.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
