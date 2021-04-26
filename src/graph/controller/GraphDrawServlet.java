package graph.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
<<<<<<< Updated upstream
=======
import javax.servlet.http.HttpSession;
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
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
String keyword = request.getParameter("keyword");
		
		List <Graph> list = graphService.selectList(keyword);
		
		
		for(Graph g : list) {
			System.out.println(g.getRegDate());
	}
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyyMMdd").create();
		String jsonStr = gson.toJson(list);
		
		System.out.println(jsonStr);
		PrintWriter out = response.getWriter();
		out.print(jsonStr);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
=======

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GraphDrawServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			HttpSession session = request.getSession();
			String keyword = (String) session.getAttribute("searchKeyword");
			
			//String graphKeyword = request.getParameter("header-search");
			//System.out.println("그래프 키워드" + graphKeyword);
			System.out.println(keyword);
		
			// List <Graph> list = graphService.selectList(keyword);
			List<Graph> list =graphService.searchProductList(keyword);
			//if(keyword !=null || graphKeyword!=null) {
				 
			//}
//			 for(Graph g : list) {
//			 System.out.println(g.getRegDate());
//			 }

			
			response.setContentType("application/json; charset=utf-8");
			Gson gson = new GsonBuilder().setDateFormat("yyyyMMdd").create();
			String jsonStr = gson.toJson(list);

			System.out.println(jsonStr);
			PrintWriter out = response.getWriter();
			out.print(jsonStr);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
>>>>>>> Stashed changes
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
