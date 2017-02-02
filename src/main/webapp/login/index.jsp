<%@ page 
      language="java"
      contentType="text/html; charset=UTF-8" 
      import = "java.lang.*,java.util.*, java.text.*"
%><%
if (request.getRemoteUser() != null) {
	response.sendRedirect(request.getContextPath() + "/");      
} 
%>