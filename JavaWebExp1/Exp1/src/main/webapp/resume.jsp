<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page contentType="text/html; charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>���ü���</title>	
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  </head>
  
  <body>
  
    <h2 align="center"><span style="color:green"><%=request.getAttribute("success")==null?"":request.getAttribute("success") %></span></h2>
    <h2 align="center"><span style="color:red"><%=request.getAttribute("error")==null?"":request.getAttribute("error") %></span></h2>
  
    <h1 align="center">���ü���</h1>
      
    <h3 align="center"><span style="color:red"><%=request.getAttribute("msg")==null?"":request.getAttribute("msg") %></span></h3>
    
    <form name="f1" id="f1" action="GetResume" method="post" >
        
      <p align="center"><span style="vertical-align:top">ͷ��</span>
                             <input type="image" name="ͷ��" src="img\profile.jpg" width="100" height="100">
      <p align="center">������<input type="text" name="����" size="7" maxlength=5 value="<%=request.getAttribute("����")==null?"":request.getAttribute("����") %>">
      <p align="center">�Ա� <%if(request.getAttribute("�Ա�")==null){%>
                              <input type="radio" name="�Ա�" value="��">��
                              <input type="radio" name="�Ա�" value="Ů">Ů 
                              <%}else if(request.getAttribute("�Ա�").equals("��")){%>
                             <input type="radio" name="�Ա�" value="��" checked="checked">��
                             <input type="radio" name="�Ա�" value="Ů">Ů 
                             <%}else{%>
                             <input type="radio" name="�Ա�" value="��">��
                             <input type="radio" name="�Ա�" value="Ů" checked="checked">Ů
                             <%}%>
      <p align="center">�������ڣ�<input type="date" name="��������" size="10" value="<%=request.getAttribute("��������")==null?"":request.getAttribute("��������") %>">
      <p align="center">��ҵԺУ��<input type="text" name="��ҵԺУ" size="15" value="<%=request.getAttribute("��ҵԺУ")==null?"":request.getAttribute("��ҵԺУ") %>">
      <p align="center">���ѧ����
                             <select  name="���ѧ��" size="1">
	                          <%if(request.getAttribute("���ѧ��")==null){%>
                              <option value="˶ʿ" > ˶ʿ </option>
	                          <option value="��ʿ" > ��ʿ </option>
                              <%}else if(request.getAttribute("���ѧ��").equals("˶ʿ")){%>
                              <option value="˶ʿ" selected> ˶ʿ </option>
	                          <option value="��ʿ" > ��ʿ </option>
	                           <%}else{%>
                              <option value="˶ʿ" > ˶ʿ </option>
	                          <option value="��ʿ" selected> ��ʿ </option>
                             <%}%>
                             </select>
      <p align="center">�о�����
                             <%if(request.getAttribute("�о�����")==null){%>
                              <input type="checkbox" name="�о�����" value="������Ӿ�"> ������Ӿ�
                             <input type="checkbox" name="�о�����" value="��Ȼ���Դ���"> ��Ȼ���Դ���
                              <%}else if(request.getAttribute("�о�����").equals("������Ӿ�")){%>
                             <input type="checkbox" name="�о�����" value="������Ӿ�" checked="checked"> ������Ӿ�
                             <input type="checkbox" name="�о�����" value="��Ȼ���Դ���"> ��Ȼ���Դ���
                              <%}else{%>
                             <input type="checkbox" name="�о�����" value="������Ӿ�"> ������Ӿ�
                             <input type="checkbox" name="�о�����" value="��Ȼ���Դ���" checked="checked"> ��Ȼ���Դ���
                             <%}%> 
      <p align="center"><span style="vertical-align:top">���˼�飺</span><textarea name="���˼��" rows=5  cols=50><%=request.getAttribute("���˼��")==null?"":request.getAttribute("���˼��") %></textarea>
      
      <br><br>

      <input type="submit" value="�ύ">
      <input type="reset" value="����" onclick="window.location.href='resume.jsp'">
        
    </form>
  </body>
</html>

