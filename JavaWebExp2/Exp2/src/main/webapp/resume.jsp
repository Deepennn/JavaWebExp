<%@ page language="java" import="java.util.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.time.ZoneOffset" pageEncoding="gb2312"%>
<%@ page contentType="text/html; charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 
����˵����
1.����˳������˳�������ɾ��cookies����˻���Ϊ��cookies�����µ�½
2.����˳���ɾ��cookies�����˳���Ҳ��ɾ��cookies�������Ҫ���µ�½
 -->

<!DOCTYPE HTML>
<html>
  <head>
    <title>���ü���</title>	
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  </head>
  
  <body>
    
    <form name="f1" id="f1" action="GetLogout" method="post" >
    <p align="right"> 
    <input type="submit" value="�˳�">
    <input type="submit" value="�˳���ɾ��cookies" onclick="delCookies()">
    </form>
    
    <script type="text/javascript">
    function delCookies(){
      var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        document.cookie="c-username="+null+";expires="+exp.toGMTString();
        document.cookie="c-pwd="+null+";expires="+exp.toGMTString();
    }
    </script>
    
    <!-- //cookie����
    <h3 align="center"><span style="color:grey"><%--=getCookie(request,"c-username")==null?"":"username��"+getCookie(request,"c-username").getValue() --%></span></h3>
    <h3 align="center"><span style="color:grey"><%--=getCookie(request,"c-pwd")==null?"":"pwd��"+getCookie(request,"c-pwd").getValue() --%></span></h3>
    -->
    
    <h2 align="center"><span style="color:green">${success}</span></h2>
    <h2 align="center"><span style="color:red">${error}</span></h2>
  
    <h1 align="center">���ü���</h1>
      
    <h3 align="center"><span style="color:red">${msg}</span></h3>
    
    <form name="f1" id="f1" action="GetResume" method="post" >
        
      <p align="center"><span style="vertical-align:top">ͷ��</span>
                             <input type="image" name="ͷ��" src="img\profile.jpg" width="100" height="100">
      <p align="center">������<input type="text" name="����" size="7" maxlength=5 value="${����}">
      <p align="center">�Ա� <%if(session.getAttribute("�Ա�")==null){%>
                              <input type="radio" name="�Ա�" value="��">��
                              <input type="radio" name="�Ա�" value="Ů">Ů 
                              <%}else if(session.getAttribute("�Ա�").equals("��")){%>
                             <input type="radio" name="�Ա�" value="��" checked="checked">��
                             <input type="radio" name="�Ա�" value="Ů">Ů 
                             <%}else{%>
                             <input type="radio" name="�Ա�" value="��">��
                             <input type="radio" name="�Ա�" value="Ů" checked="checked">Ů
                             <%}%>
      <p align="center">�������ڣ�<input type="date" name="��������" size="10" value="${��������}">
      <p align="center">��ҵԺУ��<input type="text" name="��ҵԺУ" size="15" value="${��ҵԺУ}">
      <p align="center">���ѧ����
                             <select  name="���ѧ��" size="1">
	                          <%if(session.getAttribute("���ѧ��")==null){%>
                              <option value="˶ʿ" > ˶ʿ </option>
	                          <option value="��ʿ" > ��ʿ </option>
                              <%}else if(session.getAttribute("���ѧ��").equals("˶ʿ")){%>
                              <option value="˶ʿ" selected> ˶ʿ </option>
	                          <option value="��ʿ" > ��ʿ </option>
	                           <%}else{%>
                              <option value="˶ʿ" > ˶ʿ </option>
	                          <option value="��ʿ" selected> ��ʿ </option>
                             <%}%>
                             </select>
      <!-- <p align="center">�о�����
                             <%--if(session.getAttribute("�о�����")==null){--%>
                              <input type="checkbox" name="�о�����" value="������Ӿ�"> ������Ӿ�
                             <input type="checkbox" name="�о�����" value="��Ȼ���Դ���"> ��Ȼ���Դ���
                              <%--}else if(session.getAttribute("�о�����").equals("������Ӿ�")){--%>
                             <input type="checkbox" name="�о�����" value="������Ӿ�" checked="checked"> ������Ӿ�
                             <input type="checkbox" name="�о�����" value="��Ȼ���Դ���"> ��Ȼ���Դ���
                              <%--}else{--%>
                             <input type="checkbox" name="�о�����" value="������Ӿ�"> ������Ӿ�
                             <input type="checkbox" name="�о�����" value="��Ȼ���Դ���" checked="checked"> ��Ȼ���Դ���
                             <%--}--%> -->
      <p align="center"><span style="vertical-align:top">���˼�飺</span><textarea name="���˼��" rows=5  cols=50><%=session.getAttribute("���˼��")==null?"":session.getAttribute("���˼��") %></textarea>
      
      <br><br>

      <input type="submit" value="�ύ">
      <!--<input type="reset" value="����"> --><%-- session.inValidate() --%>
        
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
    
    <h3 align="center"><span style="color:grey"><%=session.getAttribute("lastLoginTime")==null?"":"�ϴε�½ʱ�䣺" + session.getAttribute("lastLoginTime")%></span></h3>
    <h3 align="center"><span style="color:grey"><%=session.getAttribute("lastLogoutTime")==null?"":"�ϴ��˳�ʱ�䣺" + session.getAttribute("lastLogoutTime")%></span></h3>

    <%//��¼��½ʱ��
    DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("y��M��d��kʱm��s��");//���ø�ʽ����ʽ
    //LocalDateTime lastLoginTime = LocalDateTime.ofEpochSecond((session.getLastAccessedTime()/1000),0,ZoneOffset.ofHours(8)); //��ȡ�ϴε�½ʱ��,���������Ǻ����ʱ��UNIXʱ��,Ȼ����ת��Ϊ��������LocalDateTime
    LocalDateTime lastLoginTime = LocalDateTime.now();
    session.setAttribute("lastLoginTime", dateFormat.format(lastLoginTime));
    %>

    </body>
</html>