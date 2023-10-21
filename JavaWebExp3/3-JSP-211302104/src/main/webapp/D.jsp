<%@ page language="java" import="java.util.*,java.util.Date,java.text.SimpleDateFormat" pageEncoding="gb2312"%>
<%@ page contentType="text/html; charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%-- 计数器和时间记录器 --%>
<%
  if (application.getAttribute("visitCount") == null) {
    application.setAttribute("visitCount", 1);
  } else {
    int visitCount = (int) application.getAttribute("visitCount");
    application.setAttribute("visitCount", visitCount + 1);
  }

  if (application.getAttribute("visitTimes") == null) {
    application.setAttribute("visitTimes", new ArrayList<String>());
  }
  ArrayList<String> visitTimes = (ArrayList<String>) application.getAttribute("visitTimes");
  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  visitTimes.add(dateFormat.format(new Date()));
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>D</title>
</head>
<body>
<h1>D</h1>
<p>总访问次数: <%= application.getAttribute("visitCount") %></p>
<p>访问时间记录:</p>
<ul>
   <% for (String time : visitTimes) { %>
      <li><%= time %></li>
   <% } %>
</ul>
</body>
</html>