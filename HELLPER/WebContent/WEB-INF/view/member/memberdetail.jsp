<%@page import="poly.dto.MemberDTO"%>
<%@page import="poly.util.EncryptUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	MemberDTO mdto = (MemberDTO) request.getAttribute("memberdetail");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#testDatepicker").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
</script>
</head>
<body>
	<form action="/member/updatememberinfo.do" method="post">
		password<input type="password" name="password" required="required"
			value="<%=mdto.getPassword()%>"><br /> 이름<input type="text"
			name="name" required="required" value="<%=mdto.getName()%>"><br />
		email <input type="email" name="email" required="required"
			value="<%=EncryptUtil.decAES128CBC(mdto.getEmail())%>"><br /> phone<input type="text"
			name="phone" required="required" value="<%=EncryptUtil.decAES128CBC(mdto.getPhone())%>"><br />
		<input type="hidden" name="mem_seq" value="<%=mdto.getMem_seq()%>">
		<input type="submit" class="btn btn-success btn-lg" value="수정" />
	</form>
</body>
</html>
<script>
	function idcheck() {
		window.open("/member/idcheck.do", "c", "width=350,height=130");
	}
</script>