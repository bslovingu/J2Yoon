<%@page import="java.text.DecimalFormat"%>
<%@page import="poly.dto.BmiDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_email = (String)session.getAttribute("SS_USER_EMAIL");
	String user_name = (String)session.getAttribute("SS_USER_NAME");
	String mem_seq = (String)request.getAttribute("mem_seq");
%>    
    

<!DOCTYPE html>
<html lang="en">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#page-top"><font size="7">SPORnSER</font></a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#"><%=user_name %> 관리자님 환영합니다.</a>
                    </li> 
                    <li class="page-scroll">
                        <a href="/notice/admincommunity.do">커뮤니티</a>
                    </li>
                    <li class="page-scroll">
                    	<a href="/member/logout.do"><font size="2">logout</font></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header -->
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

<!--------------------------------------------------------------------------user info list start------------------------------------------------------------------------------------------>

    
				
<!--------------------------------------------------------------------------user info list end------------------------------------------------------------------------------------------>
				
<!--------------------------------------------------------------------------user detail start------------------------------------------------------------------------------------------>
	<section id="userInfo">
		<div class="container">
			<div class="row">
		<form name="sentMessage" action="/member/adminchpassword.do" method="post" onsubmit="return doSubmit(this);">
    	    	<input type="hidden" name="mem_seq" value=<%=mem_seq %>>
               <div class="row control-group">
            	    <div class="form-group col-xs-12 floating-label-form-group controls">
                	    <label>password</label>
                    	    <input type="password" class="form-control" placeholder="password" name="password1"  required data-validation-required-message="Please enter your email address.">
                        	    <p class="help-block text-danger"></p>
                    </div>
                </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>password</label>
                	            <input type="password" class="form-control" placeholder="passwordcheck" name="password2" required data-validation-required-message="Please enter your phone number.">
                    	            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                        	<br>
                        		<div id="success"></div>
                        			<div class="row">
                            			<div class="form-group col-xs-12">
                                			<button type="submit" class="btn btn-success btn-lg">Send</button>
                        	    		</div>
                        			</div>
			                    </form>
    		</div>
    	</div>
    </section>

<!--------------------------------------------------------------------------user detail end------------------------------------------------------------------------------------------>


<!-------------------------------------------------------------------------Footer start-------------------------------------------------------------------------------------->

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
    
<!-------------------------------------------------------------------------Footer end-------------------------------------------------------------------------------------->

    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="/js/jqBootstrapValidation.js"></script>
    <script src="/js/contact_me.js"></script>
    <script src="/js/freelancer.min.js"></script>
    <script src="/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/vendor/datatables-responsive/dataTables.responsive.js"></script>
    
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    
    function doSubmit(f){
    	
    	if(f.password1.value.length > 10){
    		alert("비밀번호는 10자로 제한됩니다.");
    		f.password2.focus();
    		f.password1.focus();
    		return false;
    	}
    	
    	if(f.password1.value != f.password2.value){
    		alert("패스워드가 일치 하지 않습니다.");
    		f.password2.focus();
    		return false;
    	}
    	
    }
    
    
    function InpuOnlyNumber(obj) 
    {
        if (event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode == 46) { //숫자키만 입력
            return true;
        } else {
			event.returnValue = false;        	
            alert("숫자만 입력 가능합니다.")
        }
    }
    </script>
</body>
</html>