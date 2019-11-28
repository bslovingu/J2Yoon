<%@page import="poly.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	List<MemberDTO> mlist = (List<MemberDTO>)request.getAttribute("allMemberInfo");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="1" style="width:100%">
	<tr>
		<td>회원번호</td>
		<td>id</td>
		<td>password</td>
		<td>name</td>
		<td>email</td>
		<td>phone</td>
		<td>birthday</td>

	</tr>
<%
	for(MemberDTO a : mlist){
%>
	<tr>
		<td><%=a.getMem_seq() %></td>
		<td><%=a.getPassword() %></td>
		<td><%=a.getName() %></td>
		<td><%=a.getEmail() %></td>
		<td><%=a.getPhone() %></td>

	</tr>
<%
	} 
%>
</table>
</body>
</html>