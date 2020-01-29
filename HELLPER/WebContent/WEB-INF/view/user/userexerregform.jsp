<%@page import="poly.dto.CommentDTO"%>
<%@page import="poly.dto.QnADTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String user_name = (String)session.getAttribute("SS_USER_NAME");

%>

<!DOCTYPE html>
<html lang="en">

<head>
<script type="text/javascript">
   
   	var filesize = 0;
		//파일 업로드
		function doFileUpload(fileValue) {
			var f = document.getElementById("form");
			
			if(f.title.value == ""){
				alert("제목을 입력해 주세요");
				f.title.focus();
				return;
			}
			
			if(f.content.value == ""){
				alert("내용을 입력해 주세요");
				f.content.focus();
				return;
			}
			//if (f.exerfile.value==""){alert("업로드할 파일을 선택하시길 바랍니다.");f.exerfile.focus();return;}
			if (!f.exerfile.value == "") {
				//이미지 파일 확장자 체크
				if (doImgFileCheck(f.exerfile.value) == false) {
					alert("동영상파일 (.mp4, .avi, .mkv, .wmv)만 업로드 가능합니다.");
					f.exerfile.focus();
					return;
				}
			}
			
			var fileSize = Math.round(fileValue.fileSize);
			
			var maxSize = 31457280;
			
			if(fileSize > maxSize){
				alert("첨부파일 사이즈는 30mb이내로 가능합니다.");
				return;
			}
			
			f.submit();

		}

		//이미지 파일 확장자 체크
		function doImgFileCheck(fileNm) {

			if (fileNm != "") {

				var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1)
						.toLowerCase();

				if (ext == "mp4" || ext == "avi" || ext == "mkv" || ext=="wmv") {
					return true;

				} else {
					return false;
				}
			}
		}

		function fileCheck(file) {
			// 사이즈체크
			var maxSize = 1024 * 1024 * 100 //30MB
			var fileSize = 0;

			// 브라우저 확인
			var browser = navigator.appName;

			// 익스플로러일 경우
			if (browser == "Microsoft Internet Explorer") {
				var oas = new ActiveXObject("Scripting.FileSystemObject");
				fileSize = oas.getFile(file.value).size;
				if(fileSize > maxSize){
					$('#file').val('');
				}
			}
			// 익스플로러가 아닐경우
			else {
				fileSize = file.files[0].size;
			}

			if (fileSize > maxSize) {
				alert("용량이 너무 큽니다. ");
				resetFile();
				$('#file').val('');
				return 0;
			}

		}

		function resetFile() {
			document.getElementById("file").select();
			document.execCommand('Delete');
		}
	</script>
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
                        <a href="exercise">체육시설 예약정보</a>
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

    
		 <section id="exercise">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12 text-center">
	                    <h2>e x e r c i s e</h2>
	                    <hr class="star-primary">
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-lg-8 col-lg-offset-2">
	                    <form action="/userexercise/userexercisereg.do" method="post" enctype="multipart/form-data" id="form" name="form">
	                        <div class="row control-group">
	                            <div class="form-group col-xs-12 floating-label-form-group controls">
	                                <label>Title</label>
	                                <input type="text" class="form-control" placeholder="title" name="title"  required="required">
	                                 <p class="help-block text-danger"></p>
	                            </div>
	                        </div>
	                        <div class="row control-group">
	                            <div class="form-group col-xs-12 floating-label-form-group controls">
	                                <label>Message</label>
	                                <textarea rows="5" class="form-control" placeholder="Message" name="content" required="required"></textarea>
	                                <p class="help-block text-danger"></p>
	                            </div>
	                        </div>
	                        <br>
	                        <div class="row control-group">
	                            <div class="form-group col-xs-12 floating-label-form-group controls">
	                                <label>동영상 업로드</label>
	                                <input type="file" name="exerfile" id="file"  onchange="javascript:fileCheck(this.form.exerfile)" style="color: White; background-color: #18BC9C" >
	                                <p class="help-block text-danger"></p>
	                            </div>
	                        </div>
	                        <div id="success"></div>
	                        <div class="row">
	                            <div class="form-group col-xs-12">
								<a href="javascript:doFileUpload(document.form.exerfile.value)" class="btn btn-success btn-lg">등록</a>
	                            </div>
	                        </div>
	                    </form>
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
    <script src="/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/vendor/datatables-responsive/dataTables.responsive.js"></script>


</body>

</html>
