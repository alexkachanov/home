<%@ page 
	language="java"
	contentType="text/html; charset=UTF-8"
	session="true"
	import="org.apache.catalina.*" 
	import=" java.net.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
request.setCharacterEncoding("UTF-8");
Host host = (Host)application.getAttribute("host");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<style>
	html {
		-webkit-text-size-adjust: 100%;
	}
	
	body {
		padding: 0;
		margin: 0;
	}
	
	div.block { 
			padding: 1em;
			margin: 1em;
			border: 1px solid #cccccc; 
			width: 70%;
			display: inline-block;
		}
	</style>
	<title>List of Applications - MyInfoServer</title>
</head>

<body>

<div style='background-color: #eeeeee; padding: .4em; font-family: sans-serif;'>

<a href="/home/">Home</a>

<% if (request.getRemoteUser() != null) {%>
	| user: <%= request.getRemoteUser()%>
<%} else {%>
	| <a href="/home/login/">Login</a>
<%} %>

</div>

<h1>List of Applications</h1>

<div style="width: 70%">
	<div class="block">
	<a target="_blank" href="http://<%= InetAddress.getLocalHost().getHostAddress() %>:8080/">Japan Wiki</a><br/>
	available: true
	</div>

<c:forEach var="context" items="<%= host.findChildren() %>">
	<c:if test="${context.path != '/manager' && context.path != '/host-manager'}">
	<div class="block">
	<a href="${empty context.path ? '' : context.path}/">${empty context.displayName ? "unknown" : context.displayName}</a><br/>
	available: ${context.configured}
	</div>
	</c:if>
</c:forEach>

</div>

</body>
</html>