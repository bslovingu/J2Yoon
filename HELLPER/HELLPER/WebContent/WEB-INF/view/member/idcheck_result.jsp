<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String)request.getAttribute("id");
	String idcheck = (String )request.getAttribute("idcheck");
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%if(id == null){ %>
	[<%=idcheck %>] 은/는 <b>사용가능</b> 합니다.
	<hr/>
	<a href="javascript:apply()">적용하기</a>
<%} else{%>
	[<%=idcheck %>] 은/는 <b>사용불가능</b> 합니다.
	<hr/>
	<a href="/member/idcheck.do">재검색하기</a>
<%} %>
</body>
</html>
<script>
	function apply() {
		var nd = opener.document.getElementById("nid");
		nd.value= "<%=idcheck%>";
		window.close();
	}
</script>