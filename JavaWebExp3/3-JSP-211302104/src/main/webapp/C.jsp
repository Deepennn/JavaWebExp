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
<p>������<%=session.getAttribute("name")%>
<p>�Ա�<%=session.getAttribute("sex")%>
<p>�������ڣ�<%=session.getAttribute("birthday")%>
<p>���ѧ����<%=session.getAttribute("degree")%>
<p>���˼�飺<%=session.getAttribute("bio")%>
</body>
</html>