package Task;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Task1
 */
@WebServlet(name = "GetReg", urlPatterns = { "/GetReg" })
public class GetReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetReg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		//指定输出的编码格式，输出中文
				response.setCharacterEncoding("gb2312"); 
				response.setContentType("text/html;charset=gb2312");
				String username=request.getParameter("username");
				String pwd=request.getParameter("password");
				
				boolean isValid = true;
				StringBuffer msg = new StringBuffer();
				
				//检查用户名
				if(username.equals("aaa")) {
					isValid=false;
					msg.append("[EXISTED]用户名已存在<br>");
				}
				if(username.isBlank()) {
					isValid=false;
					msg.append("[BLANK]用户名不能为空<br>");
				}
				//用于反显，可以在原来基础上修改
				request.setAttribute("username",username);
				
				//检查密码
				if(pwd.isBlank()) {
					isValid=false;
					msg.append("[BLANK]密码不能为空<br>");
				}
				
				if(isValid) {//去往设置简历
					request.setAttribute("success","注册成功<br>");
					request.getRequestDispatcher("resume.jsp").forward(request, response);
				}
				else{//返回注册
					request.setAttribute("error","注册失败<br>");
					request.setAttribute("msg",msg);
					request.getRequestDispatcher("register.jsp").forward(request, response);
				}
	}

}
