<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<html>
<%
	String exerRedirect = (String)request.getAttribute("exercise");	
	String userexer = (String)request.getAttribute("userexercise");
	
	if(exerRedirect != null && exerRedirect.equals("success")){
%>
		<script type="text/javascript">
			alert("���ε� ����")
			location.href="/exercise/redirectExer.do";
		</script>
<%
	}else if(exerRedirect != null && exerRedirect.equals("fail")){

%>
		<script type="text/javascript">
			alert("���ε� ����!!");
			history.back(-1);
		</script>	
<%
	}else if(exerRedirect != null && exerRedirect.equals("exercise")){
%>

			<script type="text/javascript">
				alert("��� ���� �Ϸ�!!");
				location.href="/exercise/adminexercise.do";
			</script>
<%
	}else if(userexer != null){
		if(userexer.equals("success")){
%>
			<script type="text/javascript">
				alert("��� ���ε� �Ϸ�!!");
				location.href="/userexercise/userexerlist.do";
			</script>
<% 
		}else{
%>
			<script type="text/javascript">
				alert("���ε� ����!!");
				history.back(-1);
			</script>				
<%			
		}
	}else{
%>	
	<script type="text/javascript">
		location.href="/admin/adminmain.do";
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