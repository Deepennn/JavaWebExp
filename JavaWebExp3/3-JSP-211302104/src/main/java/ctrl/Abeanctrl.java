package ctrl;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Abean;

/**
 * Servlet implementation class Abeanctrl
 */
@WebServlet("/Abeanctrl")
public class Abeanctrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Abeanctrl() {
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
		
		//创建bean
		Abean bbean=new Abean();
		Abean cbean=new Abean();
		Abean dbean=new Abean();
		
		//获取各作用域对象
		HttpSession session = request.getSession();
		ServletContext application = request.getServletContext();
	    
		//获取表单属性+设置各作用域bean的属性
		setBeanProperties(bbean, request);
		setBeanProperties(cbean, request);
		setBeanProperties(dbean, request);
		
	    //存储bean
	    request.setAttribute("Bbeaninfo",bbean);
	    session.setAttribute("Cbeaninfo",cbean);
	    application.setAttribute("Dbeaninfo",dbean);
	    
	    //转发到Bbean
	    request.getRequestDispatcher("Bbean.jsp").forward(request, response);
	}
	public void setBeanProperties(Abean bean,HttpServletRequest request) {
		bean.setName(request.getParameter("name"));
	    bean.setSex(request.getParameter("sex"));
	    bean.setBirthday(request.getParameter("birthday"));
	    bean.setDegree(request.getParameter("degree"));
	    bean.setBio(request.getParameter("bio"));
	}
}