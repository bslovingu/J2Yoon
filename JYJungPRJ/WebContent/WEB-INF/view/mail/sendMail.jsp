<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>이메일 보내자!</title>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Open+Sans:400,300,600,700,800" rel="stylesheet" /> <!-- 폰트 -->
<link href="/css/bootstrap/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/css/bootstrap/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/mail.css">
</head>
<body>
<%@include file="/layout/top.jsp" %>
<div id="page-wrapper">
	<div class="page_main">
		<form action="sendMailAction.do" method="post" name="f" id="f" class="mail_form">
			<div class="mail_table">
				<div class="mail_table_tr">
					<div class="mail_table_td"><b>받는 사람</b></div>
					<div class="mail_table_td"><input type="text" name="toMail" id="toMail" class="mail_input" placeholder="수신자를 기입하십시오."/></div>
				</div>
				<div class="mail_table_tr">
					<div class="mail_table_td"><b>제목</b></div>
					<div class="mail_table_td"><input type="text" name="title" id="title" class="mail_input" placeholder="게시글의 제목을 작성하십시오."/></div>
				</div>
				<div class="mail_table_tr">
					<div class="mail_table_td"><b>내용</b></div>
					<div class="mail_table_td"><textarea name="contents" id="contents" class="mail_textarea" placeholder="게시글의 내용을 작성하십시오."></textarea></div>
				</div>
			</div>
			<div class="mail_colspan">
				<button type="submit" class="mail_button mail_send_button">전송</button>
				<button type="reset" class="mail_button mail_reset_button">초기화</button>
			</div>
		</form>
	</div>
</div>
<%@include file="/layout/footer.jsp" %>
</body>
</html>