<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page contentType="text/html; charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>��½/ע��</title>	
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  </head>
  <body>
   <h2 align="center"><span style="color:red">${error}</span></h2>
  <h1 align="center">��½/ע��</h1>
  <h3 align="center"><span style="color:red">${msg}</span></h3>
    <form name="f1" id="f1" action="GetReg" method="post" >
      <table align="center">
        <tr> 
          <td>�û���:</td>
          <td><input type="text" name="username" value="${username}"></td>
        </tr>
        <tr>
          <td>����:</td>
          <td><input type="password" name="password" value="${pwd}"></td>
        </tr> 
        <tr>
          <td><br/></td>
        </tr> 
        <tr align="center">
          <td colspan="2"><input type="submit" value="�ύ"></td>
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
    //��½�߼���ͨ��cookies��
    String username=(getCookie(request,"c-username")==null?null:getCookie(request,"c-username").getValue());
	String pwd=(getCookie(request,"c-pwd")==null?null:getCookie(request,"c-pwd").getValue());
	if (pwd!=null && username!=null){
	    //���û����������cookies����һ�����ж�
	    //request.setAttribute("success","��½�ɹ�<br>");
	    request.getRequestDispatcher("GetReg").forward(request, response);
	}
	else{
	    //û���û����������cookies��ͣ��
	}
    %>
  </body>
</html>