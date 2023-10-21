package ctrl;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Actrl
 */
@WebServlet("/Actrl")
public class Actrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Actrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("gb2312"); 
		response.setCharacterEncoding("gb2312"); 
		response.setContentType("text/html;charset=gb2312");
		
		//获取各作用域对象
		HttpSession session = request.getSession();
		
		//获取表单属性+设置各作用域对象的属性
		Enumeration paramNames = request.getParameterNames();
	    while(paramNames.hasMoreElements()) {
	      String paramName = (String)paramNames.nextElement();
	      String paramValue = request.getParameter(paramName);
	      request.setAttribute(paramName,paramValue);
      	  session.setAttribute(paramName,paramValue);
	    }
	    
	    //转发到B
	    request.getRequestDispatcher("B.jsp").forward(request, response);
	}
}