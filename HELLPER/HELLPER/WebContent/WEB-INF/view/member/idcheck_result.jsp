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
	[<%=idcheck %>] ��/�� <b>��밡��</b> �մϴ�.
	<hr/>
	<a href="javascript:apply()">�����ϱ�</a>
<%} else{%>
	[<%=idcheck %>] ��/�� <b>���Ұ���</b> �մϴ�.
	<hr/>
	<a href="/member/idcheck.do">��˻��ϱ�</a>
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