<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page contentType="text/html; charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>ע��</title>	
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  </head>
  <body>
   <h2 align="center"><span style="color:red"><%=request.getAttribute("error")==null?"":request.getAttribute("error") %></span></h2>
  <h1 align="center">ע��</h1>
  <h3 align="center"><span style="color:red"><%=request.getAttribute("msg")==null?"":request.getAttribute("msg") %></span></h3>
    <form name="f1" id="f1" action="GetReg" method="post" >
      <table align="center">
        <tr> 
          <td>�û���:</td>
          <td><input type="text" name="username" value="<%=request.getAttribute("username")==null?"":request.getAttribute("username") %>"></td>
        </tr>
        <tr>
          <td>����:</td>
          <td><input type="password" name="password"></td>
        </tr> 
        <tr>
          <td><br/></td>
        </tr> 
        <tr align="center">
          <td colspan="2"><input type="submit" value="�ύ"></td>
        </tr>
      </table>
    </form>
  </body>
</html>