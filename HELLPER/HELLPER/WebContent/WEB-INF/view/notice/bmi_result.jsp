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
	
	DecimalFormat f = new DecimalFormat(".##");
	String bmi = (String)request.getAttribute("bmi");
	String bmiresult = CmmUtil.nvl((String)request.getAttribute("bmiresult"));
	List<BmiDTO> blist = (List<BmiDTO>)request.getAttribute("blist");
	
	
	
	String[] barr = null;
	if (blist != null) {
		barr = new String[blist.size()];
		if(blist.size()<10){
			int index = blist.size();
			
			for (int i = 0; i < blist.size(); i++) {
				index--;
				barr[i] = blist.get(index).getBmi_result();
			}
			
		}else{
			int index = 9;
			for (int i = 0; i < blist.size(); i++) {
				barr[i] = blist.get(index).getBmi_result();
				index--;
			}
		}
		
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
                <a class="navbar-brand" href="/admin/adminmain.do"><font size="7">SPORnSER</font></a>
            </div>

           <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#"><%=user_name %> 관리자님 환영합니다.</a>
                    </li> 
                    <li class="page-scroll">
                        <a href="/admin/adminmain.do">UserInfo</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#bmi">이용 현황</a>
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
				

    <section id="bmi" >
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>B M I</h2>
                    <hr class="star-primary">
                </div>
            </div>
             <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <form name="sentMessage" action="/bmi/bmicalc.do" method="post">
                    	<div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>키</label>
                                <input type="text" class="form-control" placeholder="cm" name="cm" required data-validation-required-message="Please enter your name address." onkeypress="InpuOnlyNumber(this)">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>몸무게</label>
                                <input type="text" class="form-control" placeholder="kg" name="kg" required data-validation-required-message="Please enter your phonenumber" onkeypress="InpuOnlyNumber(this)">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-success btn-lg" style="background-color: #2C3E50; ">Send</button>
                            </div>
                        </div>
                    </form>
                </div>
            <div class="row">
            <div class="col-lg-12 text-center">
                    <h2>결과</h2>
                </div>
                <div class="col-lg-8 col-lg-offset-2">
                    	<div class="row control-group">
                    	 <h3><%="당신의 BMI 수치는" + f.format(Double.parseDouble(bmi))  + "입니다."%></h3>
                        </div>
                        <div id="graph" align="center" style="width:600px; height:300px;"></div>
                </div>
            </div>
        </div>
    </section>


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
    <link class="include" rel="stylesheet" type="text/css" href="/jquery.jqplot.min.css" />
	<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="/jquery.jqplot.min.js"></script>

</body>
<script type="text/javascript">
function InpuOnlyNumber(obj) 
{
    if (event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode == 46) { //숫자키만 입력
        return true;
    } else {
		event.returnValue = false;        	
        alert("숫자만 입력 가능합니다.")
    }
}



<%
	if(blist != null){
%>
			var ary = new Array();
			<%for(int i = 0; i<blist.size(); i ++ ){%>
				ary.push(Number('<%=barr[i]%>'));
			<%}%>
			
			$(function(){
			    //1번째 입력값 (그려진 영역의 id값)
			    //2번째 입력값 (그래프내에 들어갈 데이터 값)
			     $.jqplot ('graph', [ary]);
			});
<%
	}
%>
</script>