<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page contentType="text/html; charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>设置简历</title>	
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  </head>
  
  <body>
  
    <h2 align="center"><span style="color:green"><%=request.getAttribute("success")==null?"":request.getAttribute("success") %></span></h2>
    <h2 align="center"><span style="color:red"><%=request.getAttribute("error")==null?"":request.getAttribute("error") %></span></h2>
  
    <h1 align="center">设置简历</h1>
      
    <h3 align="center"><span style="color:red"><%=request.getAttribute("msg")==null?"":request.getAttribute("msg") %></span></h3>
    
    <form name="f1" id="f1" action="GetResume" method="post" >
        
      <p align="center"><span style="vertical-align:top">头像：</span>
                             <input type="image" name="头像" src="img\profile.jpg" width="100" height="100">
      <p align="center">姓名：<input type="text" name="姓名" size="7" maxlength=5 value="<%=request.getAttribute("姓名")==null?"":request.getAttribute("姓名") %>">
      <p align="center">性别： <%if(request.getAttribute("性别")==null){%>
                              <input type="radio" name="性别" value="男">男
                              <input type="radio" name="性别" value="女">女 
                              <%}else if(request.getAttribute("性别").equals("男")){%>
                             <input type="radio" name="性别" value="男" checked="checked">男
                             <input type="radio" name="性别" value="女">女 
                             <%}else{%>
                             <input type="radio" name="性别" value="男">男
                             <input type="radio" name="性别" value="女" checked="checked">女
                             <%}%>
      <p align="center">出生日期：<input type="date" name="出生日期" size="10" value="<%=request.getAttribute("出生日期")==null?"":request.getAttribute("出生日期") %>">
      <p align="center">毕业院校：<input type="text" name="毕业院校" size="15" value="<%=request.getAttribute("毕业院校")==null?"":request.getAttribute("毕业院校") %>">
      <p align="center">最高学历：
                             <select  name="最高学历" size="1">
	                          <%if(request.getAttribute("最高学历")==null){%>
                              <option value="硕士" > 硕士 </option>
	                          <option value="博士" > 博士 </option>
                              <%}else if(request.getAttribute("最高学历").equals("硕士")){%>
                              <option value="硕士" selected> 硕士 </option>
	                          <option value="博士" > 博士 </option>
	                           <%}else{%>
                              <option value="硕士" > 硕士 </option>
	                          <option value="博士" selected> 博士 </option>
                             <%}%>
                             </select>
      <p align="center">研究领域：
                             <%if(request.getAttribute("研究领域")==null){%>
                              <input type="checkbox" name="研究领域" value="计算机视觉"> 计算机视觉
                             <input type="checkbox" name="研究领域" value="自然语言处理"> 自然语言处理
                              <%}else if(request.getAttribute("研究领域").equals("计算机视觉")){%>
                             <input type="checkbox" name="研究领域" value="计算机视觉" checked="checked"> 计算机视觉
                             <input type="checkbox" name="研究领域" value="自然语言处理"> 自然语言处理
                              <%}else{%>
                             <input type="checkbox" name="研究领域" value="计算机视觉"> 计算机视觉
                             <input type="checkbox" name="研究领域" value="自然语言处理" checked="checked"> 自然语言处理
                             <%}%> 
      <p align="center"><span style="vertical-align:top">个人简介：</span><textarea name="个人简介" rows=5  cols=50><%=request.getAttribute("个人简介")==null?"":request.getAttribute("个人简介") %></textarea>
      
      <br><br>

      <input type="submit" value="提交">
      <input type="reset" value="重置" onclick="window.location.href='resume.jsp'">
        
    </form>
  </body>
</html>

