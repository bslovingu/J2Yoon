<%@page import="poly.dto.CommentDTO"%>
<%@page import="poly.dto.QnADTO"%>
<%@page import="poly.dto.EventDTO"%>
<%@page import="poly.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String user_email = (String) session.getAttribute("SS_USER_EMAIL");
	String user_name = (String) session.getAttribute("SS_USER_NAME");

	NoticeDTO ndetail = (NoticeDTO) request.getAttribute("ndetail");
	List<NoticeDTO> nlist = (List<NoticeDTO>) request.getAttribute("nlist");
	NoticeDTO updateform = (NoticeDTO) request.getAttribute("updateform");

	List<EventDTO> elist = (List<EventDTO>) request.getAttribute("elist");
	EventDTO edetail = (EventDTO) request.getAttribute("eventdetail");
	String eventform = (String) request.getAttribute("eventform");
	EventDTO upeventform = (EventDTO) request.getAttribute("upeventform");

	List<QnADTO> qlist = (List<QnADTO>) request.getAttribute("qlist");
	String qnaform = (String) request.getAttribute("qnaform");
	QnADTO qnadetail = (QnADTO) request.getAttribute("qnadetail");
	QnADTO qnaupdateform = (QnADTO) request.getAttribute("qnaupdateform");

	CommentDTO commupdateform = (CommentDTO) request.getAttribute("commupdateform");
	int NPgNum = 1;
	if (request.getAttribute("NPgNum") != null) {
		NPgNum = (int) request.getAttribute("NPgNum");
	}
	int Ntotal = 1;
	if (request.getAttribute("Ntotal") != null) {
		Ntotal = (int) request.getAttribute("Ntotal");
	}
	int FPgNum = 1;
	if (request.getAttribute("FPgNum") != null) {
		FPgNum = (int) request.getAttribute("FPgNum");
	}
	int Ftotal = 1;
	if (request.getAttribute("Ftotal") != null) {
		Ftotal = (int) request.getAttribute("Ftotal");
	}
	int PgNum = 1;
	if (request.getAttribute("PgNum") != null) {
		PgNum = (int) request.getAttribute("PgNum");
	}
	int total = 1;
	if (request.getAttribute("total") != null) {
		total = (int) request.getAttribute("total");
	}
	int CPgNum = 1;
	if (request.getAttribute("CPgNum") != null) {
		CPgNum = (int) request.getAttribute("CPgNum");
	}
	int Ctotal = 1;
	if (request.getAttribute("Ctotal") != null) {
		Ctotal = (int) request.getAttribute("Ctotal");
	}
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
.chart-area {
	height: 350px;
}

.div_content_container {
	display: table;
	table-layout: fixed;
	width: 100%;
	border: 1px solid #dee2e6;
}

.div_content_box {
	display: table-cell;
	border: 1px solid #dee2e6;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	padding-top: 12px;
	padding-bottom: 12px;
}

.table_1st {
	width: 60px;
	text-align: center;
}

.table_2nd {
	text-align: center;
}

.table_3rd {
	width: 60px;
	text-align: center;
}

.table_4th {
	width: 240px;
	text-align: center;
}

.table_5th {
	width: 140px;
	text-align: center;
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
</style>

</head>

<body id="page-top" class="index">

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
					<li class="page-scroll"><a href="#notice">공지사항</a></li>
					<li class="page-scroll"><a href="#event">체육시설 조회</a></li>
					<li class="page-scroll"><a href="/exercise/adminexercise.do">체육시설
							예약정보</a></li>
					<li class="page-scroll"><a href="/userqna/userqnalist.do">신고게시판</a>
					</li>
					<li class="page-scroll"><a href="/member/logout.do"><font
							size="1">logout</font></a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!--------------------------------------------------------------------------Header start---------------------------------------------------------------------------------------->
	<header>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="intro-text"></div>
				</div>
			</div>
		</div>
	</header>
	<!--------------------------------------------------------------------------Header end------------------------------------------------------------------------------------------>


	<!--------------------------------------------------------------------------notice update start------------------------------------------------------------------------------------------>

	<%
		if (updateform != null) {
	%>
	<section id="notice">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>공 지 사 항</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<form action="/notice/updatenoticedetail.do" method="post">
						<input type="hidden" name="nseq"
							value="<%=updateform.getNotice_seq()%>">
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Title</label> <input type="text" class="form-control"
									placeholder="title" name="title"
									value="<%=updateform.getNotice_title().replaceAll("& #40;", "(").replaceAll("& #41;", ")")
						.replaceAll("& gt;", ">").replaceAll("& lt;", "<")%>"
									required
									data-validation-required-message="Please enter your name.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Message</label>
								<textarea rows="5" class="form-control" placeholder="Message"
									name="content" required
									data-validation-required-message="Please enter a message."><%=updateform.getNotice_content().replaceAll("& #40;", "(").replaceAll("& #41;", ")")
						.replaceAll("& gt;", ">").replaceAll("& lt;", "<")%></textarea>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12">
								<input type="submit" class="btn btn-success btn-lg" value="send">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!--------------------------------------------------------------------------notice update end------------------------------------------------------------------------------------------>

	<!--------------------------------------------------------------------------notice detail start------------------------------------------------------------------------------------------>

	<%
		} else if (ndetail != null) {
	%>

	<section id="notice">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>공 지 사 항</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<form action="/notice/updatenoticedetail.do" method="post">
						<input type="hidden" name="nseq"
							value="<%=ndetail.getNotice_seq()%>"> <input
							type="hidden" name="nflag" value="1">
						<!-- nflag는 같이 noticedetail로 넘어가는데 거기서 다른데로 리턴할수 있도록 -->
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Title</label>
								<p class="help-block text-danger">제목</p>
								<%=ndetail.getNotice_title().replaceAll("& #40;", "(").replaceAll("& #41;", ")")
						.replaceAll("& gt;", ">").replaceAll("& lt;", "<")%>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Message</label>
								<p class="help-block text-danger">내용</p>
								<%=ndetail.getNotice_content().replaceAll("& #40;", "(").replaceAll("& #41;", ")")
						.replaceAll("& gt;", ">").replaceAll("& lt;", "<")%>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12">
								<input type="submit" class="btn btn-success btn-lg" value="수정">
							</div>
						</div>
					</form>
					<a href="/notice/deletenotice.do?nseq=<%=ndetail.getNotice_seq()%>"><button
							class="btn btn-success btn-lg">삭제</button></a>
				</div>
			</div>
		</div>
	</section>

	<!--------------------------------------------------------------------------notice detail end------------------------------------------------------------------------------------------>

	<!--------------------------------------------------------------------------notice list start----------------------------------------------------------------------------------------->

	<%
		} else if (nlist != null) {
	%>
	<section id="notice">
		<div class="container" style="margin: auto; text-align: center;">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>공 지 사 항</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="div_content_container"
					style="color: #666666; font-weight: bold;">
					<div style="display: table-row;">
						<div class="table_1st div_content_box">글번호</div>
						<div class="table_2nd div_content_box">제목</div>
						<div class="table_3rd div_content_box">조회수</div>
						<div class="table_4th div_content_box">글쓴이</div>
						<div class="table_5th div_content_box">날짜</div>
					</div>
				</div>
				<div class="div_content_container"
					style="color: #666666; font-weight: bold;">
					<%
						for (int i = 0; i < nlist.size(); i++) {
					%>
					<div style="display: table-row;">
						<div class="table_1st div_content_box"><%=nlist.get(i).getNotice_seq()%></div>
						<div class="table_2nd div_content_box">
							<a
								href="/notice/noticedetail.do?nseq=<%=nlist.get(i).getNotice_seq()%>"><%=nlist.get(i).getNotice_title().replaceAll("& #40;", "(").replaceAll("& #41;", ")")
							.replaceAll("& gt;", ">").replaceAll("& lt;", "<")%></a>
						</div>
						<div class="table_3rd div_content_box"><%=nlist.get(i).getNotice_cnt()%></div>
						<div class="table_4th div_content_box"><%=nlist.get(i).getNotice_uploadname()%></div>
						<div class="table_5th div_content_box"><%=nlist.get(i).getNotice_upday()%></div>
					</div>
					<%
						}
					%>
				</div>
				<div class="pagingBox"
					style="margin-top: 15px; margin-bottom: 15px;">
					<ul style="list-style: none;">
						<%
							int NtotalPage = (Ntotal - 1) / 10 + 1;
								int NstartPage = ((NPgNum - 1) / 5) * 5 + 1;
								int Ntemp = ((NtotalPage - 1) / 5) * 5 + 1;
						%>
						<!-- < 이전 찍기 -->
						<%
							if (NPgNum == 1) {
						%>
						<li><span><</span></li>
						<%
							} else {
						%>
						<li><span><a
								href="/notice/admincommunity.do?NPgNum=<%=NPgNum - 1%>"><</a></span></li>
						<%
							}
						%>
						<!-- 숫자 찍기 -->
						<%
							if (NstartPage == Ntemp) {
						%>
						<%
							for (int i = NstartPage; i <= NtotalPage; i++) {
						%>
						<li><span><a
								href="/notice/admincommunity.do?NPgNum=<%=i%>"><%=i%></a></span></li>
						<%
							}
						%>
						<%
							} else {
						%>
						<%
							for (int i = NstartPage; i <= NstartPage + 4; i++) {
						%>
						<li><span><a
								href="/notice/admincommunity.do?NPgNum=<%=i%>"><%=i%></a></span></li>
						<%
							}
						%>
						<%
							}
						%>
						<!-- > 다음 찍기 -->
						<%
							if (NPgNum == NtotalPage) {
						%>
						<li><span>></span></li>
						<%
							} else {
						%>
						<li><span><a
								href="/notice/admincommunity.do?NPgNum=<%=NPgNum + 1%>">></a></span></li>
						<%
							}
						%>
					</ul>
				</div>
				<a href="/notice/admincommunity.do?flag=1"><button
						class="btn btn-success btn-lg">글쓰기</button></a>
			</div>
		</div>
	</section>

	<!--------------------------------------------------------------------------notice list end------------------------------------------------------------------------------------------>

	<!--------------------------------------------------------------------------notice reg start------------------------------------------------------------------------------------------>

	<%
		} else {
	%>
	<section id="notice">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>공 지 사 항</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<form action="/notice/noticereg.do" method="post">
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Title</label> <input type="text" class="form-control"
									placeholder="title" name="title" required
									data-validation-required-message="Please enter your name.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Message</label>
								<textarea rows="5" class="form-control" placeholder="Message"
									name="content" required
									data-validation-required-message="Please enter a message."></textarea>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12">
								<input type="submit" class="btn btn-success btn-lg" value="send">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<%
		}
	%>

	<!--------------------------------------------------------------------------notice reg end------------------------------------------------------------------------------------------>

	<!--------------------------------------------------------------------------event list start------------------------------------------------------------------------------------------>

	<%
		if (elist != null) {
	%>
	<section id="event" class="success">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>체육시설 조회</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row" style="text-align: center;">
				<div class="table-responsive">
					<div class="div_content_container"
						style="color: #666666; font-weight: bold;">
						<div style="display: table-row;">
							<div class="table_1st div_content_box">시설번호</div>
							<div class="table_2nd div_content_box">종목</div>
							<div class="table_3rd div_content_box">시설위치</div>
							<div class="table_4th div_content_box">시설명</div>
						</div>
					</div>
					<hr>
					<!-- 테이블 만들기 -->
					<!-- 페이징 시작 -->
					<div class="pagingBox"
						style="margin-top: 15px; margin-bottom: 15px;">
						<ul style="list-style: none;">
							<%
								int FtotalPage = (Ftotal - 1) / 10 + 1;
									int FstartPage = ((FPgNum - 1) / 5) * 5 + 1;
									int Ftemp = ((FtotalPage - 1) / 5) * 5 + 1;
							%>
							<!-- < 이전 찍기 -->
							<%
								if (FPgNum == 1) {
							%>
							<li><span><</span></li>
							<%
								} else {
							%>
							<li><span><a
									href="/userevent/usereventlist.do?FPgNum=<%=FPgNum - 1%>"><</a></span></li>
							<%
								}
							%>
							<!-- 숫자 찍기 -->
							<%
								if (FstartPage == Ftemp) {
							%>
							<%
								for (int i = FstartPage; i <= FtotalPage; i++) {
							%>
							<li><span><a
									href="/userevent/usereventlist.do?FPgNum=<%=i%>"><%=i%></a></span></li>
							<%
								}
							%>
							<%
								} else {
							%>
							<%
								for (int i = FstartPage; i <= FstartPage + 4; i++) {
							%>
							<li><span><a
									href="/userevent/usereventlist.do?FPgNum=<%=i%>"><%=i%></a></span></li>
							<%
								}
							%>
							<%
								}
							%>
							<!-- > 다음 찍기 -->
							<%
								if (FPgNum == FtotalPage) {
							%>
							<li><span>></span></li>
							<%
								} else {
							%>
							<li><span><a
									href="/userevent/usereventlist.do?FPgNum=<%=FPgNum + 1%>">></a></span></li>
							<%
								}
							%>
						</ul>
					</div>
				</div>
				<a href="/event/eventregform.do"><button
						class="btn btn-success btn-lg" style="background-color: #2C3E50;">글쓰기</button></a>
			</div>
		</div>
	</section>

	<!--------------------------------------------------------------------------event list end------------------------------------------------------------------------------------------>

	<!--------------------------------------------------------------------------event reg start------------------------------------------------------------------------------------------>

	<%
		} else if (eventform != null) {
	%>
	<section id="event" class="success">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>체육시설 조회</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<form action="/event/eventregproc.do" method="post">
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Title</label> <input type="text" class="form-control"
									placeholder="title" name="title" required
									data-validation-required-message="Please enter your name.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Message</label>
								<textarea rows="5" class="form-control" placeholder="Message"
									name="content" required
									data-validation-required-message="Please enter a message."></textarea>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12">
								<input type="submit" class="btn btn-success btn-lg" value="send"
									style="background-color: #2C3E50;">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!--------------------------------------------------------------------------event reg end------------------------------------------------------------------------------------------>

	<!--------------------------------------------------------------------------event detail start------------------------------------------------------------------------------------------>

	<%
		} else if (edetail != null) {
	%>
	<section id="event" class="success">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>체육시설 조회</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<form action="/event/updateeventform.do" method="post">
						<input type="hidden" name="eseq"
							value="<%=edetail.getEvent_seq()%>">
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Title</label>
								<p class="help-block text-danger">제목</p>
								<%=edetail.getEvent_cnt()%>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Message</label>
								<p class="help-block text-danger">내용</p>
								<%=edetail.getEvent_content().replaceAll("& #40;", "(").replaceAll("& #41;", ")")
						.replaceAll("& gt;", ">").replaceAll("& lt;", "<")%>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12">
								<input type="submit" class="btn btn-success btn-lg" value="수정"
									style="background-color: #2C3E50;">
							</div>
						</div>
					</form>
					<a href="/event/deleteevent.do?eseq=<%=edetail.getEvent_seq()%>"><button
							class="btn btn-success btn-lg" style="background-color: #2C3E50;">삭제</button></a>
				</div>
			</div>
		</div>
	</section>

	<!--------------------------------------------------------------------------event detail end------------------------------------------------------------------------------------------>

	<!--------------------------------------------------------------------------event update start------------------------------------------------------------------------------------------>

	<%
		} else if (upeventform != null) {
	%>
	<section id="event" class="success">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>e v e n t</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<form action="/event/updateeventproc.do" method="post">
						<input type="hidden" name="eseq"
							value="<%=upeventform.getEvent_seq()%>">
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Title</label>
								<p class="help-block text-danger">제목</p>
								<input type="text"
									value="<%=upeventform.getEvent_title().replaceAll("& #40;", "(").replaceAll("& #41;", ")")
						.replaceAll("& gt;", ">").replaceAll("& lt;", "<")%>"
									class="form-control" placeholder="title" name="title" required
									data-validation-required-message="Please enter your name.">
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Message</label>
								<p class="help-block text-danger">내용</p>
								<textarea rows="5" class="form-control" placeholder="Message"
									name="content" required
									data-validation-required-message="Please enter a message."><%=upeventform.getEvent_content().replaceAll("& #40;", "(").replaceAll("& #41;", ")")
						.replaceAll("& gt;", ">").replaceAll("& lt;", "<")%></textarea>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12">
								<input type="submit" class="btn btn-success btn-lg" value="send"
									style="background-color: #2C3E50;">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<%
		}
	%>

	<!--------------------------------------------------------------------------event update end------------------------------------------------------------------------------------------>

	<!--------------------------------------------------------------------------qna list start------------------------------------------------------------------------------------------>

	<%
		if (qlist != null) {
	%>
	<section id="qna">
		<div class="container" style="margin: auto; text-align: center;">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>신고게시판</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="div_content_container"
					style="color: #666666; font-weight: bold;">
					<div style="display: table-row;">
						<div class="table_1st div_content_box">글번호</div>
						<div class="table_2nd div_content_box">제목</div>
						<div class="table_3rd div_content_box">조회수</div>
						<div class="table_4th div_content_box">글쓴이</div>
						<div class="table_5th div_content_box">날짜</div>
					</div>
				</div>
				<hr>
				<div class="div_content_container"
					style="color: #666666; font-weight: bold;">
					<%
						for (int i = 0; i < qlist.size(); i++) {
					%>
					<div style="display: table-row;">
						<div class="table_1st div_content_box"><%=qlist.get(i).getQna_seq()%></div>
						<div class="table_2nd div_content_box">
							<a
								href="/userqna/userqnadetail.do?qseq=<%=qlist.get(i).getQna_seq()%>"><%=qlist.get(i).getQna_title().replaceAll("& #40;", "(").replaceAll("& #41;", ")")
							.replaceAll("& gt;", ">").replaceAll("& lt;", "<")%></a>
						</div>
						<div class="table_3rd div_content_box"><%=qlist.get(i).getQna_cnt()%></div>
						<div class="table_4th div_content_box"><%=qlist.get(i).getQna_uploadname()%></div>
						<div class="table_5th div_content_box"><%=qlist.get(i).getQna_upday()%></div>
					</div>
					<%
						}
					%>
				</div>
				<div class="pagingBox"
					style="margin-top: 15px; margin-bottom: 15px;">
					<ul style="list-style: none;">
						<%
							int totalPage = (total - 1) / 10 + 1;
								int startPage = ((PgNum - 1) / 5) * 5 + 1;
								int temp = ((totalPage - 1) / 5) * 5 + 1;
						%>
						<!-- < 이전 찍기 -->
						<%
							if (PgNum == 1) {
						%>
						<li><span><</span></li>
						<%
							} else {
						%>
						<li><span><a
								href="/userqna/userqnalist.do?PgNum=<%=PgNum - 1%>"><</a></span></li>
						<%
							}
						%>
						<!-- 숫자 찍기 -->
						<%
							if (startPage == temp) {
						%>
						<%
							for (int i = startPage; i <= totalPage; i++) {
						%>
						<li><span><a
								href="/userqna/userqnalist.do?PgNum=<%=i%>"><%=i%></a></span></li>
						<%
							}
						%>
						<%
							} else {
						%>
						<%
							for (int i = startPage; i <= startPage + 4; i++) {
						%>
						<li><span><a
								href="/userqna/userqnalist.do?PgNum=<%=i%>"><%=i%></a></span></li>
						<%
							}
						%>
						<%
							}
						%>
						<!-- > 다음 찍기 -->
						<%
							if (PgNum == totalPage) {
						%>
						<li><span>></span></li>
						<%
							} else {
						%>
						<li><span><a
								href="/userqna/userqnalist.do?PgNum=<%=PgNum + 1%>">></a></span></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
			<a href="/QnA/QnAregform.do"><button
					class="btn btn-success btn-lg">글쓰기</button></a>
		</div>
		</div>
	</section>

	<!--------------------------------------------------------------------------qna list end------------------------------------------------------------------------------------------>

	<!--------------------------------------------------------------------------event reg start------------------------------------------------------------------------------------------>

	<%
		} else if (qnaform != null) {
	%>
	<section id="qna">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>신고게시판</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<form action="/QnA/QnAregproc.do" method="post">
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Title</label> <input type="text" class="form-control"
									placeholder="title" name="title" required
									data-validation-required-message="Please enter your name.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Message</label>
								<textarea rows="5" class="form-control" placeholder="Message"
									name="content" required
									data-validation-required-message="Please enter a message."></textarea>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12">
								<input type="submit" class="btn btn-success btn-lg" value="send">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!--------------------------------------------------------------------------event reg end------------------------------------------------------------------------------------------>

	<!--------------------------------------------------------------------------event detail start------------------------------------------------------------------------------------------>

	<%
		} else if (qnadetail != null) {
	%>
	<section id="qna">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>게시판</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
					<!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
					<form action="/QnA/QnAupdatefrom.do" method="post">
						<input type="hidden" value="<%=qnadetail.getQna_seq()%>">
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Title</label>
								<p class="help-block text-danger">제목</p>
								<%=qnadetail.getQna_title().replaceAll("& #40;", "(").replaceAll("& #41;", ")")
						.replaceAll("& gt;", ">").replaceAll("& lt;", "<")%>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Message</label>
								<p class="help-block text-danger">내용</p>
								<%=qnadetail.getQna_content().replaceAll("& #40;", "(").replaceAll("& #41;", ")")
						.replaceAll("& gt;", ">").replaceAll("& lt;", "<")%>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12"></div>
						</div>
					</form>
					<a href="/QnA/qnaupdateform.do?qseq=<%=qnadetail.getQna_seq()%>"><button
							class="btn btn-success btn-lg">수정</button></a> <a
						href="/QnA/qnadelete.do?qseq=<%=qnadetail.getQna_seq()%>"><button
							class="btn btn-success btn-lg">삭제</button></a>
					<%
						if (commupdateform == null) {
					%>
					<form action="/Comment/QnAcomminsert.do" method="post">
						<input type="hidden" name="qseq"
							value="<%=qnadetail.getQna_seq()%>"> <input
							type="hidden" name="user_email" value="<%=user_email%>">
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
					<form action="/Comment/updatecomm.do" method="post">
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
										<div class="Comm_content"><%=qnadetail.getClist().get(i).getComm_content().replaceAll("& #40;", "(")
							.replaceAll("& #41;", ")").replaceAll("& gt;", ">").replaceAll("& lt;", "<")%></div>
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
										<li><span><a
												href="/userqna/userqnadetail.do?CPgNum=<%=i%>&qseq=<%=qnadetail.getQna_seq()%>"><%=i%></a></span></li>
										<%
											}
										%>
										<%
											} else {
										%>
										<%
											for (int i = CstartPage; i <= CstartPage + 4; i++) {
										%>
										<li><span><a
												href="/userqna/userqnadetail.do?CPgNum=<%=i%>&qseq=<%=qnadetail.getQna_seq()%>"><%=i%></a></span></li>
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

	<!--------------------------------------------------------------------------event detail end------------------------------------------------------------------------------------------>

	<!--------------------------------------------------------------------------event update start------------------------------------------------------------------------------------------>

	<%
		} else if (qnaupdateform != null) {
	%>
	<section id="qna">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>신고게시판</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<form action="/QnA/QnAUpdateProc.do" method="post">
						<input type="hidden" name="qseq"
							value="<%=qnaupdateform.getQna_seq()%>">
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Title</label>
								<p class="help-block text-danger">제목</p>
								<input type="text" class="form-control" placeholder="title"
									name="title" required
									data-validation-required-message="Please enter your name."
									value="<%=qnaupdateform.getQna_title()%>">
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Message</label>
								<p class="help-block text-danger">내용</p>
								<textarea rows="5" class="form-control" placeholder="Message"
									name="content" required
									data-validation-required-message="Please enter a message."><%=qnaupdateform.getQna_content()%></textarea>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12">
								<input type="submit" class="btn btn-success btn-lg" value="send">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<%
		}
	%>

	<!--------------------------------------------------------------------------event update end------------------------------------------------------------------------------------------>

	<!--------------------------------------------------------------------------footer start------------------------------------------------------------------------------------------>
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

	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="/js/jqBootstrapValidation.js"></script>
	<script src="/js/contact_me.js"></script>
	<script src="/js/freelancer.min.js"></script>
	<script src="/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script src="/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	<script src="/vendor/datatables-responsive/dataTables.responsive.js"></script>


</body>
</html>
