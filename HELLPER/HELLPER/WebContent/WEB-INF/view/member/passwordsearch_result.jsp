<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String passwordsearch = (String)request.getAttribute("passwordsearch");

	if(passwordsearch == null){
%>
		<script>
			alert("��ϵ� ������ �����ϴ�.");
			location.href="/";
		</script>
<%
	}
%>


<script>
	alert("�̸��Ϸ� �ӽ� ��й�ȣ�� �߱��Ͽ����ϴ�. �ӽú�й�ȣ�� �α����� ��й�ȣ�� ������ �ּ���.");
	location.href="/";
</script>

</body>
</html>