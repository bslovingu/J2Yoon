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
