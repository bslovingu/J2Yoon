<%@page import="poly.dto.MemberDTO"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.EncryptUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_name = (String)session.getAttribute("SS_USER_NAME");
	String user_seq = (String)session.getAttribute("SS_USER_SEQ");
	MemberDTO detail = (MemberDTO)request.getAttribute("memberdetail");
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

</head>

<body id="page-top" class="index">

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

<!--------------------------------------------------------------------------user update start------------------------------------------------------------------------------------------>

    <section id="userInfo">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>UserInfo</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<form name="sentMessage" action="/usermember/updateusermemberinfo.do" method="post">
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Name</label>
                                <input type="text" class="form-control" placeholder="Name" name="name" value="<%=detail.getName() %>" required data-validation-required-message="Please enter your name.">
                                <input type="hidden" name="mem_seq" value="<%=detail.getMem_seq()%>">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email Address</label>
                                <input type="email" class="form-control" placeholder="Email Address" name="email" value="<%=detail.getEmail() %>" required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Phone Number</label>
                                <input type="tel" class="form-control" placeholder="Phone Number" name="phone" value="<%=detail.getPhone() %>" required data-validation-required-message="Please enter your phone number.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-success btn-lg">Send</button>
                                
                            </div>
                        </div>
                    </form>
                    <a href="/usermember/userdeletemember.do?mem_seq=<%=detail.getMem_seq() %>"><button class="btn btn-success btn-lg">Delete</button></a>
                    <a href="/usermember/userchpassword.do"><button class="btn btn-success btn-lg">비밀번호 변경</button></a>
			</div>
		</div>
	</section>
	
<!--------------------------------------------------------------------------user update end------------------------------------------------------------------------------------------>

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

</body>
</html>