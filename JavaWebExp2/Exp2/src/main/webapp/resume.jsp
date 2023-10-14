<%@ page language="java" import="java.util.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.time.ZoneOffset" pageEncoding="gb2312"%>
<%@ page contentType="text/html; charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 
操作说明：
1.点击退出，会退出但不会删除cookies，因此会因为有cookies又重新登陆
2.点击退出并删除cookies，会退出但也会删除cookies，因此需要重新登陆
 -->

<!DOCTYPE HTML>
<html>
  <head>
    <title>设置简历</title>	
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  </head>
  
  <body>
    
    <form name="f1" id="f1" action="GetLogout" method="post" >
    <p align="right"> 
    <input type="submit" value="退出">
    <input type="submit" value="退出并删除cookies" onclick="delCookies()">
    </form>
    
    <script type="text/javascript">
    function delCookies(){
      var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        document.cookie="c-username="+null+";expires="+exp.toGMTString();
        document.cookie="c-pwd="+null+";expires="+exp.toGMTString();
    }
    </script>
    
    <!-- //cookie测试
    <h3 align="center"><span style="color:grey"><%--=getCookie(request,"c-username")==null?"":"username："+getCookie(request,"c-username").getValue() --%></span></h3>
    <h3 align="center"><span style="color:grey"><%--=getCookie(request,"c-pwd")==null?"":"pwd："+getCookie(request,"c-pwd").getValue() --%></span></h3>
    -->
    
    <h2 align="center"><span style="color:green">${success}</span></h2>
    <h2 align="center"><span style="color:red">${error}</span></h2>
  
    <h1 align="center">设置简历</h1>
      
    <h3 align="center"><span style="color:red">${msg}</span></h3>
    
    <form name="f1" id="f1" action="GetResume" method="post" >
        
      <p align="center"><span style="vertical-align:top">头像：</span>
                             <input type="image" name="头像" src="img\profile.jpg" width="100" height="100">
      <p align="center">姓名：<input type="text" name="姓名" size="7" maxlength=5 value="${姓名}">
      <p align="center">性别： <%if(session.getAttribute("性别")==null){%>
                              <input type="radio" name="性别" value="男">男
                              <input type="radio" name="性别" value="女">女 
                              <%}else if(session.getAttribute("性别").equals("男")){%>
                             <input type="radio" name="性别" value="男" checked="checked">男
                             <input type="radio" name="性别" value="女">女 
                             <%}else{%>
                             <input type="radio" name="性别" value="男">男
                             <input type="radio" name="性别" value="女" checked="checked">女
                             <%}%>
      <p align="center">出生日期：<input type="date" name="出生日期" size="10" value="${出生日期}">
      <p align="center">毕业院校：<input type="text" name="毕业院校" size="15" value="${毕业院校}">
      <p align="center">最高学历：
                             <select  name="最高学历" size="1">
	                          <%if(session.getAttribute("最高学历")==null){%>
                              <option value="硕士" > 硕士 </option>
	                          <option value="博士" > 博士 </option>
                              <%}else if(session.getAttribute("最高学历").equals("硕士")){%>
                              <option value="硕士" selected> 硕士 </option>
	                          <option value="博士" > 博士 </option>
	                           <%}else{%>
                              <option value="硕士" > 硕士 </option>
	                          <option value="博士" selected> 博士 </option>
                             <%}%>
                             </select>
      <!-- <p align="center">研究领域：
                             <%--if(session.getAttribute("研究领域")==null){--%>
                              <input type="checkbox" name="研究领域" value="计算机视觉"> 计算机视觉
                             <input type="checkbox" name="研究领域" value="自然语言处理"> 自然语言处理
                              <%--}else if(session.getAttribute("研究领域").equals("计算机视觉")){--%>
                             <input type="checkbox" name="研究领域" value="计算机视觉" checked="checked"> 计算机视觉
                             <input type="checkbox" name="研究领域" value="自然语言处理"> 自然语言处理
                              <%--}else{--%>
                             <input type="checkbox" name="研究领域" value="计算机视觉"> 计算机视觉
                             <input type="checkbox" name="研究领域" value="自然语言处理" checked="checked"> 自然语言处理
                             <%--}--%> -->
      <p align="center"><span style="vertical-align:top">个人简介：</span><textarea name="个人简介" rows=5  cols=50><%=session.getAttribute("个人简介")==null?"":session.getAttribute("个人简介") %></textarea>
      
      <br><br>

      <input type="submit" value="提交">
      <!--<input type="reset" value="重置"> --><%-- session.inValidate() --%>
        
    <%!
    Cookie getCookie(HttpServletRequest request,String cookieName) {
	  Cookie[] cookies = request.getCookies();
	  if (cookies != null) {
		for(Cookie c:cookies) {
			if (cookieName.equals(c.getName())) {
			return c;
			}
		}
	 }
	 return null;
    }
    %>
    </form>
    
    <h3 align="center"><span style="color:grey"><%=session.getAttribute("lastLoginTime")==null?"":"上次登陆时间：" + session.getAttribute("lastLoginTime")%></span></h3>
    <h3 align="center"><span style="color:grey"><%=session.getAttribute("lastLogoutTime")==null?"":"上次退出时间：" + session.getAttribute("lastLogoutTime")%></span></h3>

    <%//记录登陆时间
    DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("y年M月d日k时m分s秒");//设置格式化方式
    //LocalDateTime lastLoginTime = LocalDateTime.ofEpochSecond((session.getLastAccessedTime()/1000),0,ZoneOffset.ofHours(8)); //获取上次登陆时间,返回数据是毫秒计时的UNIX时间,然后将其转换为东八区的LocalDateTime
    LocalDateTime lastLoginTime = LocalDateTime.now();
    session.setAttribute("lastLoginTime", dateFormat.format(lastLoginTime));
    %>

    </body>
</html>