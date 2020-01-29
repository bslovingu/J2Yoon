<%@page import="poly.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<%
NoticeDTO ndetail = (NoticeDTO)request.getAttribute("ndetail"); 
String user_email = (String)session.getAttribute("SS_USER_EMAIL");
String user_name = (String)session.getAttribute("SS_USER_NAME");
%>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome to SPORnSER</title>

    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/freelancer.min.css" rel="stylesheet">
    <link href="/vendor/font-awesome/cs  s/font-awesome.min.css" rel="stylesheet" type="text/css">
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
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="/user/usermain.do"><%=user_name + "�� ȯ���մϴ�." %></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#notice">��������</a>
                    </li>
                    <li class="page-scroll">
                        <a href="/userevent/usereventlist.do">ü���ü� ��ȸ</a>
                    </li>
                    <li class="page-scroll">
                        <a href="/userexercise/userexerlist.do">ü���ü� ��������</a>
                    </li>
                    <li class="page-scroll">
                        <a href="/userqna/userqnalist.do">�Ű�Խ���</a>
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

<!--------------------------------------------------------------------------NOTICE DETAIL START------------------------------------------------------------------------------------------>

<section id="notice">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>�� �� �� ��</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    	<input type="hidden" name="nseq" value="<%=ndetail.getNotice_seq() %>">
                    	<input type="hidden" name="nflag" value="1">
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Title</label>
                                <p class="help-block text-danger">����</p>
                                <%=ndetail.getNotice_title() %>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Message</label>
                                <p class="help-block text-danger">����</p>
                                <%=ndetail.getNotice_content() %>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                    <div class="row">
                </div>
                <a href="/usernotice/usernoticelist.do"><button class="btn btn-success btn-lg">���</button></a>
            </div>
        </div>
    </section>

<!--------------------------------------------------------------------------NOTICE DETAIL END------------------------------------------------------------------------------------------>



<!--------------------------------------------------------------------------footer start----------------------------------------------------------------------------------------->
 
    <footer>
    <div class="text-center">
        <div class="footer-above">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-50">
                        <h1>�ģ���� ��¥ģ����.</h1>
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
                        ����� ����ü���ü� ���̵� &copy; SPORnSER
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