package Task;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Task
 */
@WebServlet(name = "GetReg", urlPatterns = { "/GetReg" })
public class GetReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final int SECONDS_PER_YEAR = 60*60*24*365;
       
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
		doPost(request,response);
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
				HttpSession session = request.getSession();
				
				String username=null;
				String pwd=null;
				
				/*登陆逻辑（通过cookies）*/
				boolean isLogged = false;
			    
			    username=(getCookie(request,"c-username")==null?null:getCookie(request,"c-username").getValue());
				pwd=(getCookie(request,"c-pwd")==null?null:getCookie(request,"c-pwd").getValue());
				
				isLogged = pwd!=null && username!=null;//检查用户名和密码的cookies
				
				if (isLogged){//登陆成功，去往简历
					request.setAttribute("success","登陆成功<br>");
				    request.getRequestDispatcher("resume.jsp").forward(request, response);
				    return;
				}
				
				
				/*注册逻辑*/
				boolean isValid = true;
				
				username=request.getParameter("username");
				pwd=request.getParameter("password");
				
				StringBuffer msg = new StringBuffer("");
				
				//处理异常
				if(username==null||pwd==null) {
					request.getRequestDispatcher("register.jsp").forward(request, response);
					return;
				}
				
				//检查用户名
				if(username.equals("aaa")) {
					isValid=false;
					msg.append("[EXISTED]用户名已存在<br>");
				}
				if(username.isBlank()) {
					isValid=false;
					msg.append("[BLANK]用户名不能为空<br>");
				}
				
				
				//检查密码
				if(pwd.isBlank()) {
					isValid=false;
					msg.append("[BLANK]密码不能为空<br>");
				}
				
				/*登陆逻辑（通过session）*/
                if(isValid) {
                	if(pwd.equals(session.getAttribute("pwd")) && username.equals(session.getAttribute("username"))) {
                		request.setAttribute("success","登陆成功<br>");
                		request.getRequestDispatcher("resume.jsp").forward(request, response);
                		return;
    				}
                }
				
				if(isValid) {//注册成功，注册cookie，去往设置简历
					request.setAttribute("success","注册成功<br>");
					
					//注册cookie
				    Cookie usernameCookie = new Cookie("c-username", username);
				    usernameCookie.setMaxAge(SECONDS_PER_YEAR);
					response.addCookie(usernameCookie);
					Cookie pwdCookie = new Cookie("c-pwd", pwd);
					pwdCookie.setMaxAge(SECONDS_PER_YEAR);
					response.addCookie(pwdCookie);
					
					//创建新session
					session.invalidate();
					HttpSession newSession = request.getSession();
					newSession.setAttribute("username",username);
					newSession.setAttribute("pwd",pwd);
					
					request.getRequestDispatcher("resume.jsp").forward(request, response);
					return;
				}
				else{//返回
					request.setAttribute("error","注册失败<br>");
					request.setAttribute("msg",msg);
					
					session.setAttribute("username",username);
					session.setAttribute("pwd",pwd);
					
					request.getRequestDispatcher("register.jsp").forward(request, response);
					return;
				}
	}
	protected Cookie getCookie(HttpServletRequest request,String cookieName) {
		  Cookie[] cookies = request.getCookies();
		  if (cookies != null) {
			for(Cookie c:cookies) {
				if (cookieName.equals(c.getName())) {
				return c;
				}
			}
		 }
		 return null;
	}
}
