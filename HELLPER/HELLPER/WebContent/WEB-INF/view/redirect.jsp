<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String url = (String) request.getAttribute("url");
	String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	window.onload=function(){
		alert('<%=msg%>');
		location.href='<%=url%>';
	}
</script>
</body>
</html>