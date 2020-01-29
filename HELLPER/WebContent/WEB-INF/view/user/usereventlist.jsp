<%@page import="poly.dto.SPOFACDTO"%>
<%@page import="poly.dto.EventDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.NoticeDTO"%>
<%@page import="poly.util.EncryptUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String user_name = (String) session.getAttribute("SS_USER_NAME");
	String user_mail = EncryptUtil.decAES128CBC((String) session.getAttribute("SS_USER_EMAIL"));
	List<SPOFACDTO> elist = (List<SPOFACDTO>) request.getAttribute("elist");
	int FPgNum = (int) request.getAttribute("FPgNum");
	int Ftotal = (int) request.getAttribute("Ftotal");
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
<link rel="stylesheet" type="text/css"
	href="/resources/app-assets/css/bootstrap.css">
<!-- font icons-->
<link rel="stylesheet" type="text/css"
	href="/resources//app-assets/fonts/icomoon.css">
<link rel="stylesheet" type="text/css"
	href="/resources//app-assets/fonts/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources//app-assets/vendors/css/extensions/pace.css">
<!-- END VENDOR CSS-->
<!-- BEGIN ROBUST CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources//app-assets/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css"
	href="/resources//app-assets/css/app.css">
<link rel="stylesheet" type="text/css"
	href="/resources//app-assets/css/colors.css">
<!-- END ROBUST CSS-->
<!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources//app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css"
	href="/resources//app-assets/css/core/menu/menu-types/vertical-overlay-menu.css">
<!-- END Page Level CSS-->

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
	width: 300px;
	text-align: center;
}

.table_4th {
	width: 300px;
	text-align: center;
}

.table_5th {
	width: 80px;
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

.board-btn-2 {
	min-width: 128px;
	height: 36px;
	background-color: #bb66dd;
	padding: 0 15px;
	color: #fff;
	font-weight: 600;
	font-size: 15px;
	-webkit-transition-duration: 500ms;
	transition-duration: 500ms;
}

.board-btn-2:hover {
	min-width: 128px;
	height: 36px;
	background-color: #8d06c2;
	padding: 0 15px;
	color: #fff;
	font-weight: 600;
	font-size: 15px;
	-webkit-transition-duration: 500ms;
	transition-duration: 500ms;
}
</style>
<script>
	function test() {
		var gu = $("#sel1 option:selected").text();
		var type = $("#sel2 option:selected").text();

		location.href = "/userevent/usereventSearch.do?gu=" + gu + "&type="
				+ type;
	}
</script>
</head>

<body id="page-top" class="index">

	<%
		if (user_mail.equals("sincethe1997@naver.com")) {
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

	<section id="event">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>체육시설 조회</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div>
				<span id="sel1box" class="select_box"
					style="display: inline-block; width: 7em;"><select id="sel1"
					name="searchSelect" class="custom-select form-control search_form">
						<option>전체</option>
						<option>강남구</option>
						<option>강동구</option>
						<option>강북구</option>
						<option>강서구</option>
						<option>관악구</option>
						<option>광진구</option>
						<option>구로구</option>
						<option>금천구</option>
						<option>노원구</option>
						<option>도봉구</option>
						<option>동대문구</option>
						<option>동작구</option>
						<option>마포구</option>
						<option>서대문구</option>
						<option>서초구</option>
						<option>성동구</option>
						<option>성북구</option>
						<option>송파구</option>
						<option>양천구</option>
						<option>영등포구</option>
						<option>용산구</option>
						<option>은평구</option>
						<option>종로구</option>
						<option>중구</option>
						<option>중랑구</option>
				</select> </span> <span id="sel2box" class="select_box"
					style="display: inline-block; width: 7em;"> <select
					id="sel2" name="searchSelect"
					class="custom-select form-control search_form">
						<option>전체</option>
						<option>X-게임장</option>
						<option>간이운동장</option>
						<option>게이트볼장</option>
						<option>골프연습장</option>
						<option>구기체육관</option>
						<option>국궁장</option>
						<option>농구장</option>
						<option>다목적운동장</option>
						<option>레이싱경기장</option>
						<option>론볼장</option>
						<option>배구장</option>
						<option>배드민턴장</option>
						<option>빙상장</option>
						<option>사격장</option>
						<option>산악자전거체험장</option>
						<option>생활체육관</option>
						<option>수영장</option>
						<option>스크린사격장</option>
						<option>야구장</option>
						<option>양궁장</option>
						<option>육상경기장</option>
						<option>인라인스케이트장</option>
						<option>족구장</option>
						<option>축구장</option>
						<option>클라이밍장</option>
						<option>탁구장</option>
						<option>테니스장</option>
						<option>풋살장</option>
						<option>학교체육시설</option>
				</select>
				</span> <span class="search_box" style="display: inline-block;">
					<button onclick="test()" class="btn search_btn" type="button"
						style="height: 2.5em; width: 7em;">
						<span class="ion-ios-search icon-color">조회</span>
					</button>
				</span>
			</div>
			<br>
			<div class="row" style="text-align: center;">
				<div class="div_content_container"
					style="color: #666666; font-weight: bold;">
					<div style="display: table-row;">
						<div class="table_1st div_content_box">번호</div>
						<div class="table_2st div_content_box">지역구</div>
						<div class="table_2nd div_content_box">종목</div>
						<div class="table_3rd div_content_box">시설위치</div>
						<div class="table_4th div_content_box">시설명</div>
					</div>
				</div>
				<hr>
				<div class="div_content_container"
					style="color: #666666; font-weight: bold;">
					<%
						for (int i = 0; i < elist.size(); i++) {
					%>
					<div style="display: table-row;">
						<div class="table_1st div_content_box"><%=elist.get(i).getFac_seq()%></div>
						<div class="table_2nd div_content_box"><%=elist.get(i).getLoc_gu()%></div>
						<div class="table_2nd div_content_box">
							<a
								href="/userreservation/userreservationlist.do?fseq=<%=elist.get(i).getFac_seq()%>"><%=elist.get(i).getSpo_kind()%></a>
						</div>
						<div class="table_3rd div_content_box"><%=elist.get(i).getFac_loc()%></div>
						<div class="table_4th div_content_box"><%=elist.get(i).getFac_name()%></div>
					</div>
					<%
						}
					%>
				</div>

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
						<%
							if (i == FPgNum) {
						%>
						<li><span style="background-color: #18BC9C"><%=i%></span></li>
						<%
							} else {
						%>
						<li><span><a
								href="/userevent/usereventlist.do?FPgNum=<%=i%>"><%=i%></a></span></li>
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
							for (int i = FstartPage; i <= FstartPage + 4; i++) {
						%>
						<%	if (i == FPgNum) {
						%>
						<li><span style="background-color: #18BC9C"><%=i%></span></li>
						<%
							} else {
						%>
						<li><span><a
								href="/userevent/usereventlist.do?FPgNum=<%=i%>"><%=i%></a></span></li>
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
		</div>
	</section>

	<!----------------------------------------------------------eventlist end----------------------------------------------------->


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