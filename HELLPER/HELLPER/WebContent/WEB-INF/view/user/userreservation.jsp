<%@page import="poly.util.CmmUtil"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.ReservationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String user_email = CmmUtil.nvl((String) session.getAttribute("SS_USER_EMAIL"));
	String user_name = (String) session.getAttribute("SS_USER_NAME");
	String user_seq = (String) session.getAttribute("SS_MEM_SEQ");
	String fseq = (String) request.getAttribute("fseq");
	List<ReservationDTO> rlist = (List<ReservationDTO>) request.getAttribute("rlist");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Welcome to SPORnSER</title>

<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/freelancer.min.css" rel="stylesheet">
<link href="/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<style type="text/css">
.div_content_container {
	display: table;
	table-layout: fixed;
	width: 80%;
	margin: auto;
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
	text-align: center;
}

.table_4th {
	width: 280px;
	text-align: center;
}

.table_5th {
	width: 120px;
	text-align: center;
}
</style>
</head>
<body>
<body id="page-top" class="index">

	<!-- Navigation -->
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
	<section id="notice">
		<div class="container" style="margin: auto; text-align: center;">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>예 약 현 황</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="div_content_container"
					style="color: #666666; font-weight: bold;">
					<div style="display: table-row;">
						<div class="table_1st div_content_box">예약번호</div>
						<div class="table_2nd div_content_box">시작시간</div>
						<div class="table_3rd div_content_box">종료시간</div>
						<div class="table_5th div_content_box">인원</div>
						<div class="table_4th div_content_box">등록자</div>
						<div class="table_1st div_content_box">참여하기</div>
					</div>
				</div>
				<hr>
				<div class="div_content_container"
					style="color: #666666; font-weight: bold;">
					<%
						for (int i = 0; i < rlist.size(); i++) {
					%>
					<%
						if (rlist.get(i).getReserv_member() != 0) {
					%>
					<div style="display: table-row;">
						<div class="table_1st div_content_box"><%=rlist.get(i).getReserv_seq()%></div>
						<div class="table_2nd div_content_box"><%=rlist.get(i).getStime()%></div>
						<div class="table_3rd div_content_box"><%=rlist.get(i).getEtime()%></div>
						<div class="table_5th div_content_box"><%=rlist.get(i).getReserv_member()%>/<%=rlist.get(i).getMax_member()%></div>
						<div class="table_4th div_content_box"><%=rlist.get(i).getReserv_uploadname()%></div>
						<div class="table_1st div_content_box">
							<%
								if (rlist.get(i).getFlag().equals("0")) {
							%>
							<%if(rlist.get(i).getReserv_member()==Integer.parseInt(rlist.get(i).getMax_member())){ %>
							<button
									class="btn btn-success" disabled>참여</button>
							<%}else{ %>
							<a
								href="/userreservation/userreservationjoinproc.do?fseq=<%=fseq%>&rseq=<%=rlist.get(i).getReserv_seq()%>"><button
									class="btn btn-success">참여</button></a>
							<%} %>
							<%
								} else if (rlist.get(i).getFlag().equals("1")) {
							%>
							<a
								href="/userreservation/userreservationcancelproc.do?fseq=<%=fseq%>&rseq=<%=rlist.get(i).getReserv_seq()%>"><button
									class="btn btn-success">취소</button></a>
							<%
								}
							%>
						</div>
					</div>
					<%
						}
					%>
					<%
						}
					%>

				</div>
			</div>
			<br> <a
				href="/userreservation/userreservationreg.do?fseq=<%=fseq%>"><button
					class="btn btn-success btn-lg">예약등록</button></a>
		</div>

	</section>
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

</body>
</html>