<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String idsearch = (String)request.getAttribute("idsearch");
	if(idsearch == null){
%>
		<script>
			alert("������ ã���� �����ϴ�...");
			location.href="/";
		</script>
<%
	}
%>
<script>
	alert("����� ID�� <%=idsearch%> �Դϴ�.");
	location.href="/";
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>