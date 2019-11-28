<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.ExerciseDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String user_email = (String)session.getAttribute("SS_USER_EMAIL");
	String user_name = (String)session.getAttribute("SS_USER_NAME");
	
	ExerciseDTO xdetail = (ExerciseDTO)request.getAttribute("xdto");
	ExerciseDTO xupdateform = (ExerciseDTO)request.getAttribute("xupdateform");
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
    <link href="/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/css/freelancer.min.css" rel="stylesheet">
    <link href="/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body id="page-top" class="index">

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="/user/usermain.do"><font size="7">SPORnSER</font></a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="page-scroll">
                        <a href="/user/usermain.do"><%=user_name + "님 환영합니다." %></a>
                    </li>
                    <li class="page-scroll">
                        <a href="/usernotice/usernoticelist.do">공지사항</a>
                    </li>
                    <li class="page-scroll">
                        <a href="/userevent/usereventlist.do">체육시설 조회</a>
                    </li>
                    <li class="page-scroll">
                        <a href="/userexercise/userexerlist.do">체육시설 예약정보</a>
                    </li>
                    <li class="page-scroll">
                        <a href="/userqna/userqnalist.do">신고게시판</a>
                    </li>
                    <li class="page-scroll">
                    	<a href="/member/logout.do"><font size="1">logout</font></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<!--------------------------------------------------------------------------Header start---------------------------------------------------------------------------------------->
    
    <header>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-text">
                    </div>
                </div>
            </div>
        </div>
    </header>

<!--------------------------------------------------------------------------Header end------------------------------------------------------------------------------------------>

<!--------------------------------------------------------------------------exercise start------------------------------------------------------------------------------------------>

	<section id="exercise">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>e x e r c i  s e</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls">
							<p class="help-block text-danger">제목</p>
							<%=xdetail.getExer_title()%>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls">
							<p class="help-block text-danger">내용</p>
							<%=xdetail.getExer_content()%>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-4 portfolio-item">
						<%
							if(!CmmUtil.nvl(xdetail.getExer_url()).equals("/video/")){
						%>
							<video src="<%=xdetail.getExer_url()%>" controls="controls"
								height="300px" width="500px"></video>
						<%
							}
						%>
						</div>
					</div>
					
					<div class="row">
					<%
					if(user_email.equals(xdetail.getExer_uploadname())){
					%>	
						<div class="form-group col-xs-12">
						<a href="/userexercise/userexerupdateform.do?xseq=<%=xdetail.getExer_seq() %>" class="btn btn-success btn-lg">수정</a>
						<a href="/userexercise/userexerdelete.do?xseq=<%=xdetail.getExer_seq() %>" class="btn btn-success btn-lg">삭제</a>
					<%
					}
					%>
	               <a href="/userexercise/userexerlist.do"><button class="btn btn-success btn-lg">목록</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<!--------------------------------------------------------------------------exercise end------------------------------------------------------------------------------------------>

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
                    <div class="col-lg-12">
                        서울시 공공체육시설 가이드 &copy; SPORnSER
                    </div>
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

<script type="text/javascript">
$(document).ready(function() {
    $('#dataTables-example').DataTable({
        responsive: true
    });
});

</script>
</body>

</html>
