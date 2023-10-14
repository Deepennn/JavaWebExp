package Task;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class GetLogout
 */
@WebServlet("/GetLogout")
public class GetLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetLogout() {
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
		HttpSession session = request.getSession();
		
		//删除用户名和密码的cookies
		//此方法不及时,还是会重新登陆
		/*
	    Cookie usernameCookie = new Cookie("c-username", null);
	    usernameCookie.setMaxAge(0);
	    response.addCookie(usernameCookie);
	    Cookie pwdCookie = new Cookie("c-pwd", null);
	    pwdCookie.setMaxAge(0);
	    response.addCookie(pwdCookie);
	    */
	    
	    //记录退出时间
	    DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("y年M月d日k时m分s秒");//设置格式化方式
	    LocalDateTime lastLogoutTime = LocalDateTime.now();
	    session.setAttribute("lastLogoutTime", dateFormat.format(lastLogoutTime));
	    
	    //跳转
	    request.getRequestDispatcher("register.jsp").forward(request, response);
	    return;
	}

}
