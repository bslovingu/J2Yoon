<%@page import="java.util.List"%>
<%@page import="poly.dto.EventDTO"%>
<%@page import="poly.util.EncryptUtil" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String user_name = (String)session.getAttribute("SS_USER_NAME");
	String user_mail = EncryptUtil.decAES128CBC((String) session.getAttribute("SS_USER_EMAIL"));
	EventDTO edetail = (EventDTO)request.getAttribute("eventdetail");
	String eventform = (String)request.getAttribute("eventform");
	EventDTO upeventform = (EventDTO)request.getAttribute("upeventform");

%>
<html lang="en">
<head>

   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome to SPORnSER</title>
    
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/css/freelancer.min.css" rel="stylesheet">
    <link href="/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

</head>

<body id="page-top" class="index">

    <!-- Navigation -->
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
					<li class="page-scroll"><a href="/userevent/usereventlist.do">체육시설 조회</a></li>
					<li class="page-scroll"><a href="/userreservation/userreservationlist.do">체육시설
							예약정보</a></li>
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
							조회</a></li>
					<li class="page-scroll"><a
						href="/userreservation/userreservationlist.do">체육시설 예약정보</a></li>
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
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<input type="hidden" name="eseq"
					value="<%=edetail.getEvent_seq() %>">
				<div class="row control-group">
					<div
						class="form-group col-xs-12 floating-label-form-group controls">
						<label>Title</label>
						<p class="help-block text-danger">제목</p><%=edetail.getEvent_title()%>
					</div>
				</div>
				<div class="row control-group">
					<div
						class="form-group col-xs-12 floating-label-form-group controls">
						<label>Message</label>
						<p class="help-block text-danger">내용</p><%=edetail.getEvent_content()%>
					</div>
				</div>
               <a href="/userevent/usereventlist.do"><button class="btn btn-success btn-lg">목록</button></a>
			</div>
		</div>
	</div>
	</section>

<!--------------------------------------------------------------------------event detail end---------------------------------------------------------------------------------------->

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="/js/jqBootstrapValidation.js"></script>
    <script src="/js/contact_me.js"></script>
    <script src="/js/freelancer.min.js"></script>
    <script src="/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/vendor/datatables-responsive/dataTables.responsive.js"></script>


</body>

</html>
