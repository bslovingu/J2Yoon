<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<h3>사용할 아이디를 입력해 주세요...</h3>
<form action="/member/idcheck_proc.do" method="post">
	<input type="text" name="idcheck" /> <input type="submit" value="확인" />
</form>