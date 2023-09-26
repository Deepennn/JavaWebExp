package Task;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetResume
 */
@WebServlet(name = "GetResume", urlPatterns = { "/GetResume" })
public class GetResume extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetResume() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//把Web服务器对请求Body部分的编码设为UTF-8，这样和输出编码一致，输出时就不必从ISO8859转换过来！
		//request设置的编码应该和前面表单网页设置的编码格式一致，这样才不会出现乱码！
		doProcessForm(request,response);
	}

    protected void doProcessForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("gb2312");
    	response.setContentType("text/html;charset=gb2312");
		
		String formHead="<HTML>\n" +
		"<HEAD><TITLE>"+ "我的简历" + "</TITLE></HEAD>\n" +
        "<BODY>\n" +
		"<h2 align=\"center\"><span style=\"color:green\">设置成功</span></h2>" +
        "<H1 ALIGN=CENTER>" + "我的简历" + "</H1>\n" +
        "<TABLE BORDER=1 ALIGN=CENTER>\n" +
        "<TH>字段名<TH>字段值";
		
		String formEnd="</TABLE>\n <p align=\"center\"> <input type=\"button\" value=\"设置\" onclick=\"window.history.back()\"> </body> </html>";
		
		String[] standardParamNames = {"姓名","性别","出生日期","毕业院校","最高学历","研究领域","个人简介"};
		int standardParamNamesLength = standardParamNames.length;
		
		boolean isValid = true;
		StringBuffer msg = new StringBuffer();
		
		PrintWriter out = response.getWriter();
		
		out.print(formHead);
		
		for(int i=0;i<standardParamNamesLength;i++) {
			  String standardParamName = standardParamNames[i];
		      out.print("<TR><TD>" + standardParamName + "\n<TD>");   
			  String[] paramValues = request.getParameterValues(standardParamName);
			  if (paramValues == null) {//检查NULL
				   isValid=false;
	  	        	msg.append("[NULL]请设置"+standardParamName+"<br>");
//				    out.println("<I style=\"color:red\">NULL<I>");
			  }
			  else if (paramValues.length == 1) {
		  	    String paramValue = paramValues[0];
		  	        if (isParameterNull(paramValue)) {
		  	        	isValid=false;
		  	        	msg.append("[NULL2]请设置"+standardParamName+"<br>");
//		  	            out.println("<I style=\"color:red\">NULL2<I>");
		  	        }
		  	        else if (isParameterBlank(paramValue)) {//检查BLANK
		  	        	isValid=false;
		  	        	msg.append("[BLANK]请设置"+standardParamName+"<br>");
//		  	  	        out.println("<I style=\"color:blue\">BLANK<I>");
		  	  	    }
		  	        else {
		  	        	request.setAttribute(standardParamName, paramValue);
		  	        	out.println(paramValue);
		  	        }
		  	  }
		  	  else {
		  		    request.setAttribute(standardParamName, paramValues);
		  	        out.println("<UL>");
		  	        for(int j=0; i<paramValues.length; j++) {
		  	          out.println("<LI>" + paramValues[j]);
		  	        }
		  	        out.println("</UL>");
	          }
		}
		
		out.print(formEnd);
		
		if(isValid) {
			
		}
		else {
			request.setAttribute("error","设置失败<br>");
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("resume.jsp").forward(request, response);
		}
		
      }
	
	protected boolean isParameterNull(String p){
		if (p.equals(null))
			return true;
		else return false;
	}
	
	protected boolean isParameterBlank(String p){
		if (p.isBlank())
			return true;
		else return false;
	}
    
}
