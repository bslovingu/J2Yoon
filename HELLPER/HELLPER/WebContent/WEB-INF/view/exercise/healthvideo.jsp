<%@page import="poly.dto.BmiDTO"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_email = (String)session.getAttribute("SS_USER_EMAIL");
	String user_name = (String)session.getAttribute("SS_USER_NAME");
	String user_seq = (String)session.getAttribute("SS_MEM_SEQ");	
	
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
                <a class="navbar-brand" href="#page-top"><font size="7">SPORnSER</font></a>
            </div>

            <<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#"><%=user_name %> 관리자님 환영합니다.</a>
                    </li>
                    <li>
                        <a href="/admin/adminmain.do">main</a>
                    </li>
                    <li class="page-scroll">
                        <a href="/notice/admincommunity.do">커뮤니티</a>
                    </li>
                    <li class="page-scroll">
                        <a href="/exercise/adminexercise.do">체육시설 예약정보</a>
                    </li>
                    <li class="page-scroll">
                        <a href="/exercise/healthvideo.do">???</a>
                    </li>
                    <li >
                    	<a href="/member/logout.do"><font size="1">logout</font></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header -->
  <!--------------------------------------------------------------------------Header start---------------------------------------------------------------------------------------->
    <header>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-text">
                        <hr class="star-light">
                        <span class="name">운동친구가 진짜친구다.</span>
                        <hr class="star-light">
                        <span class="skills">스포앤서에 오신걸 환영합니다.<br>
                        서울시 공공체육시설 이용에 도움을 주는 스포앤서입니다.<br>
                        다른 사람들과의 체육활동을 즐기세요!
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </header>
<!--------------------------------------------------------------------------Header end------------------------------------------------------------------------------------------>

    
<!--------------------------------------------------------------------------health video start---------------------------------------------------------------------------------------->

   <section id="healthvideo">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>H e a l t h V i d e o</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 portfolio-item">
                        <video src="/video/video1.mp4" controls="controls" height="300px" width="300px" ></video>
                </div>
                <div class="col-sm-4 portfolio-item">
                        <video src="/video/video2.mp4" controls="controls" height="300px" width="300px" ></video>
                </div>
                <div class="col-sm-4 portfolio-item">
                        <video src="/video/video3.mp4" controls="controls" height="300px" width="300px" ></video>
                </div>
                <div class="col-sm-4 portfolio-item">
                        <video src="/video/video4.mp4" controls="controls" height="300px" width="300px" ></video>
                </div>
                <div class="col-sm-4 portfolio-item">
                        <video src="/video/video5.mp4" controls="controls" height="300px" width="300px" ></video>
                </div>
                <div class="col-sm-4 portfolio-item">
                        <video src="/video/video6.mp4" controls="controls" height="300px" width="300px" ></video>
                </div>
               <div class="row">
                <div class="col-lg-12 text-right">
                    <b>출처 youtube</b>
                </div>
            </div>
            </div>
        </div>
    </section>
    
<!--------------------------------------------------------------------------health video end---------------------------------------------------------------------------------------->

<!--------------------------------------------------------------------------BMI start---------------------------------------------------------------------------------------->


<!--------------------------------------------------------------------------bmi end---------------------------------------------------------------------------------------->

<!--------------------------------------------------------------------------footer start----------------------------------------------------------------------------------------->

    <footer>
    <div class="text-center">
        <div class="footer-above">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-50">
                        <h1>먹는 즐거움은 잠시,   뱃살은 영원히 !</h1>
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
                        Copyright &copy; 박수용, 김규민, 김상훈
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
    <link class="include" rel="stylesheet" type="text/css" href="/jquery.jqplot.min.css" />
	<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="/jquery.jqplot.min.js"></script>

</body>
<script type="text/javascript">

</script>
</html>
