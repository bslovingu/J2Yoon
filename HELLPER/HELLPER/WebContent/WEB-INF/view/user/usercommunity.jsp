<%@page import="java.util.List"%>
<%@page import="poly.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String user_name = (String) session.getAttribute("SS_USER_NAME");
	List<NoticeDTO> nlist = (List<NoticeDTO>) request.getAttribute("nlist");
	int NPgNum = (int) request.getAttribute("NPgNum");
	int Ntotal = (int) request.getAttribute("Ntotal");
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
				<a class="navbar-brand" href="/user/usermain.do"><font size="7">SPORnSER</font></a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li class="page-scroll"><a href="/user/usermain.do"><%=user_name + "님 환영합니다."%></a>
					</li>
					<li class="page-scroll"><a href="#notice">공지사항</a></li>
					<li class="page-scroll"><a href="/userevent/usereventlist.do">체육시설
							조회</a></li>
					<li class="page-scroll"><a
						href="/userexercise/userexerlist.do">체육시설 예약정보</a></li>
					<li class="page-scroll"><a
						href="/userqna/userqnalist.do">신고게시판</a></li>
					<li class="page-scroll"><a href="/member/logout.do"><font
							size="1">logout</font></a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Header -->
	<header>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="intro-text"></div>
				</div>
			</div>
		</div>
	</header>

	<!--------------------------------------------------------------------------notice list start------------------------------------------------------------------------------------------>

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
				<hr>
				<div class="div_content_container"
					style="color: #666666; font-weight: bold;">
					<%
						for (int i = 0; i < nlist.size(); i++) {
					%>
					<div style="display: table-row;">
						<div class="table_1st div_content_box"><%=nlist.get(i).getNotice_seq()%></div>
						<div class="table_2nd div_content_box">
							<a
								href="/usernotice/usernoticedetail.do?nseq=<%=nlist.get(i).getNotice_seq()%>"><%=nlist.get(i).getNotice_title().replaceAll("& #40;", "(").replaceAll("& #41;", ")").replaceAll("& gt;", ">").replaceAll("& lt;", "<")%></a>
						</div>
						<div class="table_3rd div_content_box"><%=nlist.get(i).getNotice_cnt()%></div>
						<div class="table_4th div_content_box"><%=nlist.get(i).getNotice_uploadname()%></div>
						<div class="table_5th div_content_box"><%=nlist.get(i).getNotice_upday()%></div>
					</div>
					<%
						}
					%>
				</div>
				<div class="pagingBox" style="margin-top:15px; margin-bottom:15px;">
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
								href="/usernotice/usernoticelist.do?NPgNum=<%=NPgNum - 1%>"><</a></span></li>
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
								href="/usernotice/usernoticelist.do?NPgNum=<%=i%>"><%=i%></a></span></li>
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
								href="/usernotice/usernoticelist.do?NPgNum=<%=i%>"><%=i%></a></span></li>
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
								href="/usernotice/usernoticelist.do?NPgNum=<%=NPgNum + 1%>">></a></span></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<!--------------------------------------------------------------------------notice list end------------------------------------------------------------------------------------------>

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

	<script type="text/javascript">
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>
</body>

</html>
