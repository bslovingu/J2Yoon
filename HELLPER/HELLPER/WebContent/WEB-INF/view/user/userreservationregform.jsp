<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.SPOFACDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.ReservationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String user_email = (String) session.getAttribute("SS_USER_EMAIL");
	String user_name = (String) session.getAttribute("SS_USER_NAME");
	String user_seq = (String) session.getAttribute("SS_MEM_SEQ");
	String fseq = (String) request.getAttribute("fseq");
	SPOFACDTO fDTO = (SPOFACDTO) request.getAttribute("fDTO");
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
	width: 60%;
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
	width: 80px;
	text-align: center;
}

.table_2nd {
	width: 240px;
	text-align: center;
}

.table_3rd {
	width: 240px;
	text-align: center;
}

.table_4th {
	width: 240px;
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

	<section id="event">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>체육시설 예약등록</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="div_content_container"
						style="color: #666666; font-weight: bold;">
						<div style="display: table-row;">
							<div class="table_2nd div_content_box"><%=fDTO.getSpo_kind()%></div>
							<div class="table_3rd div_content_box"><%=fDTO.getFac_name()%></div>
							<div class="table_4th div_content_box"><%=fDTO.getFac_loc()%></div>
						</div>
					</div>
					<hr>

					<form action="/userreservation/userreservationregproc.do" onsubmit="return reservation();" method="post">
						<input type="hidden" name="fseq" value="<%=fseq %>">
						<span id="sel1box" class="select_box"
							style="display: inline-block; width: 8em;"><select
							id="sel1" name="stime"
							class="custom-select form-control search_form">
								<option>시작시간</option>
								<option value="8">08:00</option>
								<option value="9">09:00</option>
								<option value="10">10:00</option>
								<option value="11">11:00</option>
								<option value="12">12:00</option>
								<option value="13">13:00</option>
								<option value="14">14:00</option>
								<option value="15">15:00</option>
								<option value="16">16:00</option>
								<option value="17">17:00</option>
								<option value="18">18:00</option>
								<option value="19">19:00</option>
								<option value="20">20:00</option>
								<option value="21">21:00</option>
						</select> </span> <span id="sel2box" class="select_box"
							style="display: inline-block; width: 8em;"> <select
							id="sel2" name="usetime"
							class="custom-select form-control search_form">
								<option>이용시간</option>
								<option value="1">1시간</option>
								<option value="2">2시간</option>
						</select>
						</span> <span id="sel3box" class="select_box"
							style="display: inline-block; width: 8em;"> <select
							id="sel3" name="maxmember"
							class="custom-select form-control search_form">
								<option>최대인원</option>
								<option value="16">16명</option>
								<option value="18">18명</option>
								<option value="20">20명</option>
								<option value="22">22명</option>
								<option value="24">24명</option>
								<option value="26">26명</option>
								<option value="28">28명</option>
						</select>
						</span>

						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12">
								<input type="submit" class="btn btn-success btn-lg" value="등록"
									style="margin-top: 15px; margin-bottom: 15px">
							</div>
						</div>
					</form>
					<div class="container">
						<div class="row">
							<div class="col-lg-12"
								style="margin-top: 15px; font-weight: bold; font-size: 20px">체육시설
								예약등록의 시작시간/이용시간/최대인원의 정보는 수정이 불가능합니다.</div>
							<br>
							<div class="col-lg-12" style="font-weight: bold; font-size: 20px">등록확인
								전 다시 한번 확인하시길 바랍니다.</div>
						</div>
					</div>
				</div>
			</div>
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
	<script>
		function reservation(){
			if($("#sel1 option:selected").text()=='시작시간'){
				alert("시작시간을 선택해주세요.")
				return false;
			}
			if($("#sel2 option:selected").text()=='이용시간'){
				alert("이용시간을 선택해주세요.")
				return false;
			}
			if($("#sel3 option:selected").text()=='최대인원'){
				alert("최대인원을 선택해주세요.")
				return false;
			}
			return true;
		}
	</script>
</body>
</html>