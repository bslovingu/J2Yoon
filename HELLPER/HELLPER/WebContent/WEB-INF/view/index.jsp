<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#login">Login</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#idsearch">아이디 찾기</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#passwordsearch">비밀번호 찾기</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#memberreg">회원 가입</a>
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
                        <hr class="star-light">
                        <span class="name">S P O R n S E R</span>
                        <hr class="star-light">
                        <span class="skills">서울시 공공체육시설 예약시스템 SPORnSER입니다.<br>
                        <br>
                        좋은 사람들과 공통된 취미를 즐기시길 바랍니다.
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </header>
<!--------------------------------------------------------------------------Header end------------------------------------------------------------------------------------------>


<!--------------------------------------------------------------------------longin start---------------------------------------------------------------------------------------->
    <section id="login">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Login</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                    <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                    <form name="sentMessage" action="/member/login.do" method="post">
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email Address</label>
                                <input type="email" class="form-control" placeholder="Email Address" name="email" required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>password</label>
                                <input type="password" class="form-control" placeholder="password" name="password" required data-validation-required-message="Please enter your password">
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
        </div>
    </section>
<!--------------------------------------------------------------------------longin end---------------------------------------------------------------------------------------->

<!------------------------------------------------------------------------idsearch start---------------------------------------------------------------------------------------->
    <section id="idsearch" class="success">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>아이디 찾기</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                    <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                    <form name="sentMessage" action="/member/idsearch_proc.do" method="post">
                    	<div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>NAME</label>
                                <input type="text" class="form-control" placeholder="name" name="name" required data-validation-required-message="Please enter your name address.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>phone</label>
                                <input type="text" class="form-control" placeholder="phone" name="phone" required data-validation-required-message="Please enter your phonenumber" onkeypress="InpuOnlyNumber(this)">
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
            </div>
        </div>
    </section>
<!------------------------------------------------------------------------idsearch end---------------------------------------------------------------------------------------->


<!------------------------------------------------------------------------passwordsearch start---------------------------------------------------------------------------------------->
    <section id="passwordsearch">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>비밀번호 찾기</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <form name="sentMessage" action="/member/passwordsearch_proc.do" method="post" >
                    	<div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>NAME</label>
                                <input type="text" class="form-control" placeholder="name" name="name" required data-validation-required-message="Please enter your name address.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email Address</label>
                                <input type="email" class="form-control" placeholder="Email Address" name="email" required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>phone</label>
                                <input type="text" class="form-control" placeholder="phone" name="phone" required data-validation-required-message="Please enter your phonenumber" onkeypress="InpuOnlyNumber(this)">
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
        </div>
    </section>
<!------------------------------------------------------------------------passwordsearch end---------------------------------------------------------------------------------------->

	
<!------------------------------------------------------------------------memberreg start---------------------------------------------------------------------------------------->	
    <section class="success" id="memberreg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>회원가입</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                    <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                    <form name="memreg" action="/member/regproc.do" method="post" onsubmit="return doSubmit(this);">
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Name</label>
                                <input type="text" class="form-control" placeholder="Name" name="name" required data-validation-required-message="Please enter your name.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email Address</label>
                                <input type="email" class="form-control" placeholder="Email Address" name="email" required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Phone Number</label>
                                <input type="tel" class="form-control" placeholder="Phone Number" name="phone" required data-validation-required-message="Please enter your phone number." onkeypress="InputOnlyNumber(this)">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>password</label>
                                <input type="password" class="form-control" placeholder="password" name="password1" required data-validation-required-message="Please enter your password" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>password</label>
                                <input type="password" class="form-control" placeholder="passwordCheck" name="password2" required data-validation-required-message="Please enter your password" >
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
            </div>
        </div>
    </section>
<!------------------------------------------------------------------------memberreg end---------------------------------------------------------------------------------------->

    <!-- Footer -->
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
    <!-- Footer -->
	
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="/js/jqBootstrapValidation.js"></script>
    <script src="/js/contact_me.js"></script>
    <script src="/js/freelancer.min.js"></script>
    <script type="text/javascript">
    
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
    
    function InputOnlyNumber(obj) 
    {
        if (event.keyCode >= 48 && event.keyCode <= 57) { //only number
            return true;
        } else {
			event.returnValue = false;        	
            alert("숫자만 입력 가능합니다.")
        }
        if (f.phone.value.length != 10)
        	{
        	alert("전화번호를 재입력해주세요.")
        	}
    }
    
</script>

</body>
</html>
