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
<title>Dbean</title>
</head>
<body>
<h1>Dbean</h1>
<%
request.setCharacterEncoding("gb2312"); 
response.setCharacterEncoding("gb2312"); 
response.setContentType("text/html;charset=gb2312");
%>
<jsp:useBean id="Dbeaninfo" type="bean.Abean" scope="application"/>
<p>姓名：<jsp:getProperty name="Dbeaninfo" property="name" />
<p>性别：<jsp:getProperty name="Dbeaninfo" property="sex" />
<p>出生日期：<jsp:getProperty name="Dbeaninfo" property="birthday" />
<p>最高学历：<jsp:getProperty name="Dbeaninfo" property="degree" />
<p>个人简介：<jsp:getProperty name="Dbeaninfo" property="bio" />
</body>
</html>