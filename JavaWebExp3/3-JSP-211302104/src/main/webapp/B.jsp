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
<p>������<%=request.getAttribute("name")%>
<p>�Ա�<%=request.getAttribute("sex")%>
<p>�������ڣ�<%=request.getAttribute("birthday")%>
<p>���ѧ����<%=request.getAttribute("degree")%>
<p>���˼�飺<%=request.getAttribute("bio")%>
<p><a href="C.jsp">��ת��Cҳ��</a>
<%--<jsp:forward page= "C.jsp" />--%>
</body>
</html>