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
<title>Cbean</title>
</head>
<body>
<h1>Cbean</h1>
<%
request.setCharacterEncoding("gb2312"); 
response.setCharacterEncoding("gb2312"); 
response.setContentType("text/html;charset=gb2312");
%>
<jsp:useBean id="Cbeaninfo" type="bean.Abean" scope="session"/>
<p>������<jsp:getProperty name="Cbeaninfo" property="name" />
<p>�Ա�<jsp:getProperty name="Cbeaninfo" property="sex" />
<p>�������ڣ�<jsp:getProperty name="Cbeaninfo" property="birthday" />
<p>���ѧ����<jsp:getProperty name="Cbeaninfo" property="degree" />
<p>���˼�飺<jsp:getProperty name="Cbeaninfo" property="bio" />
</body>
</html>