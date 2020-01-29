<%@page import="poly.dto.CommentDTO"%>
<%@page import="poly.dto.QnADTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.NoticeDTO"%>
<%@page import="poly.util.EncryptUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	QnADTO qnadetail = (QnADTO) request.getAttribute("qdto");
	String user_email = EncryptUtil.decAES128CBC((String) session.getAttribute("SS_USER_EMAIL"));
	CommentDTO commupdateform = (CommentDTO) request.getAttribute("commupdateform");
	String user_name = (String) session.getAttribute("SS_USER_NAME");
	int CPgNum = (int) request.getAttribute("CPgNum");
	int Ctotal = (int) request.getAttribute("Ctotal");
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Welcome to SPORnSER</title>

<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">
<link href="/css/freelancer.min.css" rel="stylesheet">
<link href="/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<style type="text/css">
.Comm_uploadname {
	width: 30%;
}

.Comm_content {
	width: 68%;
}

.Qna_num {
	width: 10%;
}

.Qna_title {
	width: 30%;
}

.Qna_cnt {
	width: 5%;
}

.Qna_uploadname {
	width: 25%;
}

.Qna_upday {
	width: 25%;
}

.pagingBox {
	width: 100%;
	font-size: 16px;
}

.pagingBox ul {
	padding: 0;
	margin: 0;
}

.pagingBox ul li {
	display: inline-block;
	margin-bottom: 4px;
	font-weight: 400;
}

.pagingBox ul li a, .pagingBox ul li span {
	color: #2C3E50;
	text-align: center;
	display: inline-block;
	width: 40px;
	height: 40px;
	line-height: 40px;
	border-radius: 50%;
	border: 1px solid #e6e6e6;
}

hr {
	border-top: 1px solid #9C9C9C;
	border-bottom: 1px solid #F6F6F6;
}
</style>
</head>

<body id="page-top" class="index">

	<%
		if (user_email.equals("sincethe1997@naver.com")) {
	%>
	<!-- Navigation -->
	<nav id="mainNav"
		class="navbar navbar-default navbar-fixed-top navbar-custom">
		<div class="container">
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="/admin/adminmain.do"><font
					size="7">SPORnSER</font></a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><%=user_name%> 관리자님 환영합니다.</a></li>
					<li class="page-scroll"><a href="/admin/NoticeList.do">공지사항</a></li>
					<li class="page-scroll"><a href="/userevent/usereventlist.do">체육시설
							조회 및 예약</a></li>
					<li class="page-scroll"><a href="/userqna/userqnalist.do">신고게시판</a>
					</li>
					<li class="page-scroll"><a href="/member/logout.do"><font
							size="1">logout</font></a></li>
				</ul>
			</div>
		</div>
	</nav>

	<%
		} else {
	%>
	<nav id="mainNav"
		class="navbar navbar-default navbar-fixed-top navbar-custom">
		<div class="container">
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="/user/usermain.do"><font size="7">SPORnSER</font></a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="page-scroll"><a href="/user/usermain.do"><%=user_name + "님 환영합니다."%></a>
					</li>
					<li class="page-scroll"><a
						href="/usernotice/usernoticelist.do">공지사항</a></li>
					<li class="page-scroll"><a href="/userevent/usereventlist.do">체육시설
							조회 및 예약</a></li>
					<li class="page-scroll"><a href="/userqna/userqnalist.do">신고게시판</a></li>
					<li class="page-scroll"><a href="/member/logout.do"><font
							size="1">logout</font></a></li>
				</ul>
			</div>
		</div>
	</nav>


	<%
		}
	%>

	<!-- Header -->
	<header>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="intro-text">
						<hr class="star-light">
						<span class="name">S P O R n S E R</span>
						<hr class="star-light">
						<span class="skills">시설 사용시간 : 08:00 ~ 22:00 </span> <br> <span
							class="skills">예약/예약취소 가능시간 : 당일예약/취소 </span>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!--------------------------------------------------------------------------Header end------------------------------------------------------------------------------------------>

	<!--------------------------------------------------------------------------QnA detail start------------------------------------------------------------------------------------------>

	<section id="qna">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>신 고 게 시 판</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<form action="/QnA/QnAupdatefrom.do" method="post">
						<input type="hidden" value="<%=qnadetail.getQna_seq()%>">
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Title</label>
								<p class="help-block text-danger">제목</p>
								<%=qnadetail.getQna_title()%>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Message</label>
								<p class="help-block text-danger">내용</p>
								<%=qnadetail.getQna_content()%>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12"></div>
						</div>
					</form>
					<a href="/userqna/userqnalist.do"><button
							class="btn btn-success btn-lg">목록</button></a>

					<%
						if (user_email.equals(EncryptUtil.decAES128CBC(qnadetail.getQna_uploadname()))) {
					%>
					<a
						href="/userqna/updateuserqnaform.do?qseq=<%=qnadetail.getQna_seq()%>"><button
							class="btn btn-success btn-lg">수정</button></a> <a
						href="/userqna/deleteuserqna.do?qseq=<%=qnadetail.getQna_seq()%>"><button
							class="btn btn-success btn-lg">삭제</button></a>
					<%
						}
					%>
					<!--------------------------------------------------------------------------QnA detail end------------------------------------------------------------------------------------------>
					<!--------------------------------------------------------------------------QnA comment start------------------------------------------------------------------------------------------>
					<%
						if (commupdateform == null) {
					%>
					<form action="/usercomment/userqnacomminsert.do" method="post">
						<input type="hidden" name="qseq"
							value="<%=qnadetail.getQna_seq()%>"> <input type="hidden"
							name="user_email" value="<%=user_email%>">
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>comment</label>
								<p class="help-block text-danger">댓글달기</p>
								<textarea rows="5" class="form-control" placeholder="comment"
									name="comment" required
									data-validation-required-message="Please enter a message."></textarea>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-xs-12">
								<input type="submit" class="btn btn-success btn-lg" value="댓글달기">
							</div>
						</div>
					</form>
					<%
						} else {
					%>
					<form action="/usercomment/updateusercomm.do" method="post">
						<input type="hidden" name="cseq"
							value="<%=commupdateform.getComm_seq()%>"> <input
							type="hidden" name="qseq" value="<%=qnadetail.getQna_seq()%>">
						<input type="hidden" name="user_email" value="<%=user_email%>">
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>comment</label>
								<p class="help-block text-danger">수정하기</p>
								<textarea rows="5" class="form-control" placeholder="comment"
									name="comment" required
									data-validation-required-message="Please enter a message."><%=commupdateform.getComm_content()%></textarea>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-xs-12">
								<input type="submit" class="btn btn-success btn-lg" value="수정하기">
							</div>
						</div>
					</form>
					<%
						}
					%>
					<p class="help-block text-danger">댓글</p>
					<hr />
					<div class="row control-group">
						<div class="col-lg-12 text-left">
							<div class="table-responsive">
								<div class="table table-striped table-sm"
									style="display: flex; justify-content: space-between;">
									<div class="Comm_uploadname">아이디</div>
									<div class="Comm_content">내용</div>
								</div>
								<hr>
								<div class="table table-striped table-sm" style="height: 400px">
									<%
										for (int i = 0; i < qnadetail.getClist().size(); i++) {
									%>
									<div style="display: flex; justify-content: space-between;">
										<div class="Comm_uploadname"><%=qnadetail.getClist().get(i).getComm_uploadname()%></div>
										<div class="Comm_content"><%=qnadetail.getClist().get(i).getComm_content()%></div>
									</div>
									<%
										}
									%>
								</div>
								<div class="pagingBox">
									<ul style="list-style: none;">
										<%
											int CtotalPage = (Ctotal - 1) / 10 + 1;
											int CstartPage = ((CPgNum - 1) / 5) * 5 + 1;
											int Ctemp = ((CtotalPage - 1) / 5) * 5 + 1;
										%>
										<!-- < 이전 찍기 -->
										<%
											if (CPgNum == 1) {
										%>
										<li><span><</span></li>
										<%
											} else {
										%>
										<li><span><a
												href="/userqna/userqnadetail.do?CPgNum=<%=CPgNum - 1%>&qseq=<%=qnadetail.getQna_seq()%>"><</a></span></li>
										<%
											}
										%>
										<!-- 숫자 찍기 -->
										<%
											if (CstartPage == Ctemp) {
										%>
										<%
											for (int i = CstartPage; i <= CtotalPage; i++) {
										%>
										<%
											if (i == CPgNum) {
										%>
										<li><span style="background-color: #18BC9C"><%=i%></span></li>
										<%
											} else {
										%>
										<li><span><a
												href="/userqna/userqnadetail.do?CPgNum=<%=i%>&qseq=<%=qnadetail.getQna_seq()%>"><%=i%></a></span></li>
										<%
											}
										%>
										<%
											}
										%>
										<%
											} else {
										%>
										<%
											for (int i = CstartPage; i <= CstartPage + 4; i++) {
										%>
										<%
											if (i == CPgNum) {
										%>
										<li><span style="background-color: #18BC9C"><%=i%></span></li>
										<%
											} else {
										%>
										<li><span><a
												href="/userqna/userqnadetail.do?CPgNum=<%=i%>&qseq=<%=qnadetail.getQna_seq()%>"><%=i%></a></span></li>
										<%
											}
										%>
										<%
											}
										%>
										<%
											}
										%>
										<!-- > 다음 찍기 -->
										<%
											if (CPgNum == CtotalPage) {
										%>
										<li><span>></span></li>
										<%
											} else {
										%>
										<li><span><a
												href="/userqna/userqnadetail.do?CPgNum=<%=CPgNum + 1%>&qseq=<%=qnadetail.getQna_seq()%>">></a></span></li>
										<%
											}
										%>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--------------------------------------------------------------------------QnA comment end------------------------------------------------------------------------------------------>

	<!--------------------------------------------------------------------------footer start----------------------------------------------------------------------------------------->
	<footer>
		<div class="text-center">
			<div class="footer-above">
				<div class="container">
					<div class="row">
						<div class="footer-col col-md-50">
							<h1>운동친구가 진짜친구다.</h1>
							<h7></h7>
							<h7></h7>
							<h7></h7>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-below">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">서울시 공공체육시설 가이드 &copy; SPORnSER</div>
				</div>
			</div>
		</div>
	</footer>
	<!--------------------------------------------------------------------------footer end------------------------------------------------------------------------------------------>

	<!-- jQuery -->
	<script src="/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="/js/jqBootstrapValidation.js"></script>
	<script src="/js/contact_me.js"></script>

	<!-- Theme JavaScript -->
	<script src="/js/freelancer.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script src="/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	<script src="/vendor/datatables-responsive/dataTables.responsive.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});

		$(document).ready(function() {
			$('#dataTables-example3').DataTable({
				responsive : true
			});
		});
	</script>
</body>

</html>
