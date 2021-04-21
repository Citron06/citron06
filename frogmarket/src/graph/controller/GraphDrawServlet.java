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
import com.google.gson.GsonBuilder;

import graph.model.service.GraphService;
import graph.model.vo.Graph;

/**
 * Servlet implementation class GraphDrawServlet
 */
@WebServlet("/graph/drawGraph")
public class GraphDrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GraphService graphService = new GraphService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GraphDrawServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		HttpSession session = request.getSession();
		String keyword  = (String) session.getAttribute("searchKeyword");
		
		String graphKeyword = (String) session.getAttribute("graphKeyword");
		
		System.out.println(request.getRequestURI());
		System.out.println("유알엘 드로우" + request.getRequestURL());
		if(graphKeyword!=null) {
			keyword = (String) session.getAttribute("graphKeyword");
		}
				
		//List <Graph> list = graphService.selectList(keyword);
		List<Graph> list = graphService.searchProductList(keyword);
		
		//for(Graph g : list) {
			//System.out.println(g.getRegDate());
		//}
		
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyyMMdd").create();
		String jsonStr = gson.toJson(list);
		
		System.out.println(jsonStr);
		PrintWriter out = response.getWriter();
		out.print(jsonStr);
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
