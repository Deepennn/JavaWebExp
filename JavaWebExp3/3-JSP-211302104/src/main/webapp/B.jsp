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
<title>B</title>
</head>
<body>
<h1>B</h1>
<%
request.setCharacterEncoding("gb2312"); 
response.setCharacterEncoding("gb2312"); 
response.setContentType("text/html;charset=gb2312");
%>  
<p>姓名：<%=request.getAttribute("name")%>
<p>性别：<%=request.getAttribute("sex")%>
<p>出生日期：<%=request.getAttribute("birthday")%>
<p>最高学历：<%=request.getAttribute("degree")%>
<p>个人简介：<%=request.getAttribute("bio")%>
<p><a href="C.jsp">跳转到C页面</a>
<%--<jsp:forward page= "C.jsp" />--%>
</body>
</html>