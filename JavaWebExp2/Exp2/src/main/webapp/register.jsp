<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page contentType="text/html; charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>登陆/注册</title>	
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  </head>
  <body>
   <h2 align="center"><span style="color:red">${error}</span></h2>
  <h1 align="center">登陆/注册</h1>
  <h3 align="center"><span style="color:red">${msg}</span></h3>
    <form name="f1" id="f1" action="GetReg" method="post" >
      <table align="center">
        <tr> 
          <td>用户名:</td>
          <td><input type="text" name="username" value="${username}"></td>
        </tr>
        <tr>
          <td>密码:</td>
          <td><input type="password" name="password" value="${pwd}"></td>
        </tr> 
        <tr>
          <td><br/></td>
        </tr> 
        <tr align="center">
          <td colspan="2"><input type="submit" value="提交"></td>
        </tr>
      </table>
    </form>
    <%!
    Cookie getCookie(HttpServletRequest request,String cookieName) {
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
    %>
    <%
    //登陆逻辑（通过cookies）
    String username=(getCookie(request,"c-username")==null?null:getCookie(request,"c-username").getValue());
	String pwd=(getCookie(request,"c-pwd")==null?null:getCookie(request,"c-pwd").getValue());
	if (pwd!=null && username!=null){
	    //有用户名和密码的cookies，进一步能判断
	    //request.setAttribute("success","登陆成功<br>");
	    request.getRequestDispatcher("GetReg").forward(request, response);
	}
	else{
	    //没有用户名和密码的cookies，停留
	}
    %>
  </body>
</html>