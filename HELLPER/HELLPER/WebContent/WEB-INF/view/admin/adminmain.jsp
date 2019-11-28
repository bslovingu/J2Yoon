<%@page import="java.text.DecimalFormat"%>
<%@page import="poly.dto.BmiDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.EncryptUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_email = (String)session.getAttribute("SS_USER_EMAIL");
	String user_name = (String)session.getAttribute("SS_USER_NAME");
	List<MemberDTO> mlist = (List<MemberDTO>)request.getAttribute("mlist");
	MemberDTO detail = (MemberDTO)request.getAttribute("memberdetail");
	
	if(mlist == null){
		mlist = new ArrayList<MemberDTO>();
	}
	String bmiresult = CmmUtil.nvl((String)request.getAttribute("bmiresult"));
	List<BmiDTO> blist = (List<BmiDTO>)request.getAttribute("blist");
	String bmi = (String)request.getAttribute("bmi");
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
	
	if(barr != null){
		for(int i = 0; i<barr.length; i++){
			System.out.println("barr[i]" + barr[i]);
		}
	}
	int MPgNum = 1;
	if (request.getAttribute("MPgNum") != null) {
		MPgNum = (int) request.getAttribute("MPgNum");
	}
	int Mtotal = 1;
	if (request.getAttribute("Mtotal") != null) {
		Mtotal = (int) request.getAttribute("Mtotal");
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
    <link href="/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/css/freelancer.min.css" rel="stylesheet">
    <link href="/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
<style type="text/css">
.chart-area{
	height:350px;
}

.div_content_container {
	display: table;
	table-layout: fixed;
	width: 100%;
	border: 1px solid #dee2e6;
}

.div_content_box {
	display: table-cell;
	border: 1px solid #dee2e6;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	padding-top: 12px;
	padding-bottom: 12px;
}
.table_1st {
   width: 60px;
   text-align: center;
}

.table_2nd {
	text-align: center;

}

.table_3rd {
   width: 180px;
   text-align: center;
}

.table_4th {
   width: 180px;
   text-align: center;
}

.table_5th {
  width: 80px;
   text-align: center;
}


.pagingBox {
	width: 100%;
	font-size: 16px;
}

.pagingBox ul {
	padding: 0;
	margin: 0;
}

.pagingBox ul li {
	display: inline-block;
	margin-bottom: 4px;
	font-weight: 400;
}

.pagingBox ul li a, .pagingBox ul li span {
	color: #2C3E50;
	text-align: center;
	display: inline-block;
	width: 40px;
	height: 40px;
	line-height: 40px;
	border-radius: 50%;
	border: 1px solid #e6e6e6;
}
</style>
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
                        <a href="#userInfo">UserInfo</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#BMI">이용 현황</a>
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

    <section id="userInfo">
		<div class="container"  style="margin: auto; text-align: center;">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>UserInfo</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<%
					if(detail == null){
				%>
				<div class="div_content_container"
					style="color: #666666; font-weight: bold;">
					<div style="display: table-row;">
						<div class="table_1st div_content_box">회원</div>
						<div class="table_2nd div_content_box">성명</div>
						<div class="table_3rd div_content_box">email</div>
						<div class="table_4th div_content_box">phone</div>
					</div>
				</div>
				<hr>
				<div class="div_content_container"
					style="color: #666666; font-weight: bold;">
					<%
						for (int i = 0; i < mlist.size(); i++) {
					%>
					<div style="display: table-row;">
						<div class="table_1st div_content_box"><%=mlist.get(i).getMem_seq().replaceAll("& #40;", "(").replaceAll("& #41;", ")").replaceAll("& gt;", ">").replaceAll("& lt;", "<")%></div>
						<div class="table_2nd div_content_box">
							<a
								href="/member/getmemberdetail.do?mem_seq=<%=mlist.get(i).getMem_seq()%>"><%=mlist.get(i).getName()%></a>
						</div>
						<div class="table_3rd div_content_box"><%=mlist.get(i).getEmail()%></div>
						<div class="table_4th div_content_box"><%=mlist.get(i).getPhone()%></div>
					</div>
					<%
						}
					%>
				</div>
				<!-- 페이징 시작 -->
				<div class="pagingBox" style="margin-top:15px; margin-bottom:15px;">
					<ul style="list-style: none;">
						<%
							int MtotalPage = (Mtotal - 1) / 10 + 1;
							int MstartPage = ((MPgNum - 1) / 5) * 5 + 1;
							int Mtemp = ((MtotalPage - 1) / 5) * 5 + 1;
						%>
						<!-- < 이전 찍기 -->
						<%
							if (MPgNum == 1) {
						%>
						<li><span><</span></li>
						<%
							} else {
						%>
						<li><span><a
								href="/admin/adminmain.do?MPgNum=<%=MPgNum - 1%>"><</a></span></li>
						<%
							}
						%>
						<!-- 숫자 찍기 -->
						<%
							if (MstartPage == Mtemp) {
						%>
						<%
							for (int i = MstartPage; i <= MtotalPage; i++) {
						%>
						<li><span><a
								href="/admin/adminmain.do?MPgNum=<%=i%>"><%=i%></a></span></li>
						<%
							}
						%>
						<%
							} else {
						%>
						<%
							for (int i = MstartPage; i <= MstartPage + 4; i++) {
						%>
						<li><span><a
								href="/admin/adminmain.do?MPgNum=<%=i%>"><%=i%></a></span></li>
						<%
							}
						%>
						<%
							}
						%>
						<!-- > 다음 찍기 -->
						<%
							if (MPgNum == MtotalPage) {
						%>
						<li><span>></span></li>
						<%
							} else {
						%>
						<li><span><a
								href="/admin/adminmain.do?MPgNum=<%=MPgNum + 1%>">></a></span></li>
						<%
							}
						%>
					</ul>
				</div>
				</div>
				
<!--------------------------------------------------------------------------user info list end------------------------------------------------------------------------------------------>
				
<!--------------------------------------------------------------------------user detail start------------------------------------------------------------------------------------------>
				
	<%
	}else{
	%>
		<form name="sentMessage" action="/member/updatememberinfo.do" method="post">
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
                        <div class="row control-group">
                        </div>
                        	
                        	<br>
                        		<div id="success"></div>
                        			<div class="row">
                            			<div class="form-group col-xs-12">
                                			<button type="submit" class="btn btn-success btn-lg">Send</button>
                        	    		</div>
                        	    		<button type="button" class="btn btn-success btn-lg" onclick="location.href='/member/deletemember.do?mem_seq=<%=detail.getMem_seq() %>'">Delete</button>
            			        		<button type="button" class="btn btn-success btn-lg" onclick="location.href='/member/memberchpassword.do?mem_seq=<%=detail.getMem_seq()%>'">비밀번호 변경</button>
                        			</div>
			                    </form>
            			      
    <%
	}
    %>
    		</div>
 
    </section>

<!--------------------------------------------------------------------------user detail end------------------------------------------------------------------------------------------>

<!--------------------------------------------------------------------------BMI start------------------------------------------------------------------------------------------>

<section id="BMI" class="success">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>이용 현황</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<!-- 이곳에 차트 넣기 -->
				<!-- Pie Chart -->
				<div class="col-xl-4 col-lg-5">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">지역구별 이용자 현황</h6>
						</div>
						<!-- Card Body -->
						<div class="card-body">
							<div class="chart-area">
								<canvas id="myPieChart"></canvas>
							</div>
						</div>
					</div>
				</div>
				<!-- Area Chart -->
				<div class="col-xl-8 col-lg-7">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">요일별 이용자 현황</h6>
						</div>
						<!-- Card Body -->
						<div class="card-body">
							<div class="chart-area">
								<canvas id="myAreaChart"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


<!--------------------------------------------------------------------------BMI end------------------------------------------------------------------------------------------>

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
<script>
      var num0 = 10;
      var num1 = 1;
      var num2 = 5;
      var num3 = 3;
      var num4 = 20;
      var num5 = 15;
      var num6 = 0;
      var num7 = 0;
      var num8 = 9;
      var num9 = 5;
      <!-- rDTO.getNum9() -->
      var ctx = document.getElementById("myPieChart");
      var myPieChart = new Chart(ctx, {
         type : 'doughnut',
         data : {
            labels : [ "강서구", "강동구", "강북구", "강남구", "도봉구", "양천구", "중구",
                  "동대문구", "서대문구", "서초구" ],
            datasets : [ {
               data : [ num0, num1, num2, num3, num4, num5, num6, num7,
                     num8, num9 ],
               backgroundColor : [ "#00AF50", "#E83D36", "#A6A6A6",
                     "#FF7F00", "#924B0D", "#01B0F1", "#FECF37",
                     "#92D051", "#0170C1", "#7F53AA" ],
               hoverBackgroundColor : [ "#00AF50", "#E83D36", "#A6A6A6",
                     "#FF7F00", "#924B0D", "#01B0F1", "#FECF37",
                     "#92D051", "#0170C1", "#7F53AA" ]
            } ]
         },
         options : {
            legend:{
               display: false
            },
            
            maintainAspectRatio : false, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
            cutoutPercentage : 70,
         }
      });
   </script>
<script>
      var chartLabels = ["월요일","화요일","수요일","목요일","금요일","토요일","일요일"];
      var num0 = 10;
      var num1 = 1;
      var num2 = 5;
      var num3 = 3;
      var num4 = 20;
      var num5 = 15;
      var num6 = 0;
      var chartData = [num0,num1,num2,num3,num4,num5,num6];
    
	var ctx = document.getElementById("myAreaChart");
	var myBarChart = new Chart(ctx, {
		type : 'bar',
		data : {

			labels : chartLabels,
			datasets : [ {
				label : '요일별 이용자 현황',
				data : chartData,
				barThickness : 40,
				backgroundColor : [ "#FFDF0D", "#FFD70D", "#E8B50C", "#E8AD0C",
						"#FFAA01", "#FEA000", "#E8870C", "#E87C0C", "#FF710D",
						"#FF650D" ],
				hoverBackgroundColor : [ "#FFDF0D", "#FFD70D", "#E8B50C",
						"#E8AD0C", "#FFAA01", "#FEA000", "#E8870C", "#E87C0C",
						"#FF710D", "#FF650D" ]
			} ]
		},
		options : {
			legend : {
				display : false
			},
			maintainAspectRatio : false, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true,
						callback : function(value) {
							if (Number.isInteger(value)) {
								return value;
							}
						},
						stepSize : 1

					}
				} ]
			}
		}
	});
</script>
</body>
</html>