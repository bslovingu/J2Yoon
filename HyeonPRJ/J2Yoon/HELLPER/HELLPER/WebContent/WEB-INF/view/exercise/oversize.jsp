<%@page import="poly.dto.ExerciseDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	ExerciseDTO xupdate = (ExerciseDTO)request.getAttribute("xupdate");
	ExerciseDTO xreg = (ExerciseDTO)request.getAttribute("xreg");
	
%>


<html>
<%
	if(xreg != null){
%>
<script type="text/javascript">
	alert("������ �뷮�� �ʹ� Ů�ϴ�.");
	location.href="/exercise/exerciseuploadform.do";
</script>
<%
	}else if(xupdate != null){
%>
<script type="text/javascript">
	alert("������ �뷮�� �ʹ� Ů�ϴ�.");
	location.href="/exercise/exerupdateform.do?xseq=" + <%=xupdate.getExer_seq()%>;
</script>
<%
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>