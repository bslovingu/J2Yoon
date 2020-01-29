<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="/member/idsearch_proc.do" method="post">
	성명<input type="text" name="name"><br/>
	email<input type="email" name="email"><br/>
	전화번호 <input type="text" name="phone"><br/>
	<input type="submit" value="확인"/>
</form>
</body>
</html>