<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page contentType="text/html; charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>C</title>
</head>
<body>
<h1>C</h1>
<%
request.setCharacterEncoding("gb2312"); 
response.setCharacterEncoding("gb2312"); 
response.setContentType("text/html;charset=gb2312");
%>  
<p>姓名：<%=session.getAttribute("name")%>
<p>性别：<%=session.getAttribute("sex")%>
<p>出生日期：<%=session.getAttribute("birthday")%>
<p>最高学历：<%=session.getAttribute("degree")%>
<p>个人简介：<%=session.getAttribute("bio")%>
</body>
</html>