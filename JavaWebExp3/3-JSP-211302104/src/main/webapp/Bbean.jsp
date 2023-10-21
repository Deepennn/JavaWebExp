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
<title>Bbean</title>
</head>
<body>
<h1>Bbean</h1>
<%
request.setCharacterEncoding("gb2312"); 
response.setCharacterEncoding("gb2312"); 
response.setContentType("text/html;charset=gb2312");
%>
<jsp:useBean id="Bbeaninfo" type="bean.Abean" scope="request"/>
<p>姓名：<jsp:getProperty name="Bbeaninfo" property="name" />
<p>性别：<jsp:getProperty name="Bbeaninfo" property="sex" />
<p>出生日期：<jsp:getProperty name="Bbeaninfo" property="birthday" />
<p>最高学历：<jsp:getProperty name="Bbeaninfo" property="degree" />
<p>个人简介：<jsp:getProperty name="Bbeaninfo" property="bio" />
<p><a href="Cbean.jsp">跳转到Cbean页面</a>
<%--<jsp:forward page= "Cbean.jsp" />--%>
</body>
</html>