<%@page import="poly.dto.ExerciseDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String user_name = (String)session.getAttribute("SS_USER_NAME");
	List<ExerciseDTO> xlist = (List<ExerciseDTO >)request.getAttribute("xlist");

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
                        <a href="#">체육시설 예약정보</a>
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
                    <h2>e x e r c i s e</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="table-responsive">
					<table class="table table-striped table-bordered table-hover" id="dataTables-example" >
						<thead>
							<tr align="center" bgcolor="#FAFAFA">
								<td width="70px"><font color="#2E2E2E"><b>글번호</b></font></td>
								<td width="70px"><font color="#2E2E2E"><b>조회수</b></font></td>
								<td width="400px" align="center"><font color="#2E2E2E"><b>글 제목</b></font></td>
								<td><font color="#2E2E2E"><b>글쓴이</b></font></td>
								<td><font color="#2E2E2E"><b>날짜</b></font></td>
							</tr>
						</thead>
						<tbody>
							<%
								for (ExerciseDTO a : xlist) {
							%>
							<tr align="center">
								<td><%=a.getExer_seq()%></td>
								<td><%=a.getExer_cnt()%></td>
								<td><a href="/userexercise/userexercisedetail.do?xseq=<%=a.getExer_seq()%>"><%=a.getExer_title()%></a></td>
								<td><%=a.getExer_uploadname()%></td>
								<td><%=a.getExer_upday()%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<a href="/userexercise/userexercisereg.do"><button class="btn btn-success btn-lg">글쓰기</button></a>
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
