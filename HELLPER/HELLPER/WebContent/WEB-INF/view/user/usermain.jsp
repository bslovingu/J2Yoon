<%@page import="poly.util.CmmUtil"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.EncryptUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String user_email = EncryptUtil.decAES128CBC((String) session.getAttribute("SS_USER_EMAIL"));
	String user_name = (String) session.getAttribute("SS_USER_NAME");
	String user_seq = (String) session.getAttribute("SS_MEM_SEQ");
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
<link href="/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
<style>
.chart-area {
	height: 350px;
}
</style>
</head>

<body id="page-top" class="index">

	<!-- Navigation -->
	<%
		if (user_email.equals("sincethe1997@naver.com")) {
	%>
	<!-- Navigation -->
	<nav id="mainNav"
		class="navbar navbar-default navbar-fixed-top navbar-custom">
		<div class="container">
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="/admin/adminmain.do"><font
					size="7">SPORnSER</font></a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><%=user_name%> 관리자님 환영합니다.</a></li>
					<li class="page-scroll"><a href="/admin/NoticeList.do">공지사항</a></li>
					<li class="page-scroll"><a href="/userevent/usereventlist.do">체육시설
							조회</a></li>
					<li class="page-scroll"><a
						href="/userreservation/userreservationlist.do">체육시설 예약정보</a></li>
					<li class="page-scroll"><a href="/userqna/userqnalist.do">신고게시판</a>
					</li>
					<li class="page-scroll"><a href="/member/logout.do"><font
							size="1">logout</font></a></li>
				</ul>
			</div>
		</div>
	</nav>

	<%
		} else {
	%>
	<nav id="mainNav"
		class="navbar navbar-default navbar-fixed-top navbar-custom">
		<div class="container">
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="/user/usermain.do"><font size="7">SPORnSER</font></a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="page-scroll"><a href="/user/usermain.do"><%=user_name + "님 환영합니다."%></a>
					</li>
					<li class="page-scroll"><a href="#healthvideo">체육시설 추천</a></li>
					<li class="page-scroll"><a href="#bmi">이용 현황</a></li>
					<li class="page-scroll"><a href="/usermember/getusermemberdetail.do?mem_seq=<%=user_seq%>">UserInfo</a></li>
					<li class="page-scroll"><a href="/usernotice/usernoticelist.do">커뮤니티</a></li>
					<li class="page-scroll"><a href="/member/logout.do"><font
							size="1">logout</font></a></li>
				</ul>
			</div>
		</div>
	</nav>


	<%
		}
	%>

	<!-- Header -->
	<!--------------------------------------------------------------------------Header start---------------------------------------------------------------------------------------->
	<header>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="intro-text">
						<hr class="star-light">
						<span class="name">S P O R n S E R</span>
						<hr class="star-light">
						<span class="skills">시설 사용시간 : 08:00 ~ 22:00 </span> <br> <span
							class="skills">예약/예약취소 가능시간 : 당일예약/취소 </span>
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
					<h2>체육시설 추천</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row"></div>
		</div>
		<div id="map" style="width: 75%; height: 500px; margin: auto"></div>

	</section>

	<!--------------------------------------------------------------------------health video end---------------------------------------------------------------------------------------->

	<!--------------------------------------------------------------------------BMI start---------------------------------------------------------------------------------------->

	<section id="bmi" class="success">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>이용 현황 (DB연동 못했습니다, 구현X)</h2>
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
							<h6 class="m-0 font-weight-bold text-primary">지역구별 이용 현황</h6>
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
							<h6 class="m-0 font-weight-bold text-primary">종목별 이용자 현황</h6>
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


	<!--------------------------------------------------------------------------bmi end---------------------------------------------------------------------------------------->

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
					<div class="col-lg-12">서울시 공공체육시설 가이드 &copy; SPORnSER</div>
				</div>
			</div>
		</div>
	</footer>

	<!--------------------------------------------------------------------------footer end------------------------------------------------------------------------------------------>

	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="/js/jqBootstrapValidation.js"></script>
	<script src="/js/contact_me.js"></script>
	<script src="/js/freelancer.min.js"></script>
	<link class="include" rel="stylesheet" type="text/css"
		href="/jquery.jqplot.min.css" />
	<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="/jquery.jqplot.min.js"></script>

</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fd2e584e9e668e36142e2b8384a76c85&libraries=services"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12a8441079a92011ee694464ebd5873a"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨 
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation
				.getCurrentPosition(function(position) {

					var lat = position.coords.latitude, // 위도
					lon = position.coords.longitude; // 경도

					var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
					message = '<div style="padding:5px; text-align:center;">현재 위치입니다.</div>'; // 인포윈도우에 표시될 내용입니다

					// 마커와 인포윈도우를 표시합니다
					displayMarker(locPosition, message);

					//지도에 마커와 인포윈도우를 표시하는 함수입니다
					function displayMarker(locPosition, message) {

						var newObj = [];
						newObj.push({
							title : "김체육관",
							latlng : new kakao.maps.LatLng(37.550593,
									126.845811)
						})
						newObj.push({
							title : "황체육관",
							latlng : new kakao.maps.LatLng(37.552295,
									126.842843)
						})
						console.log("ㅡㅡㅡ")
						console.log(newObj)
						/*
						[
						  {
						      title: '카카오', 
						      latlng: new kakao.maps.LatLng(33.450705, 126.570677)
						  },
						  {
						      title: '생태연못', 
						      latlng: new kakao.maps.LatLng(33.450936, 126.569477)
						  },
						  {
						      title: '텃밭', 
						      latlng: new kakao.maps.LatLng(33.450879, 126.569940)
						  },
						  {
						      title: '근린공원',
						      latlng: new kakao.maps.LatLng(33.451393, 126.570738)
						  }
						];*/

						var positions = newObj;

						// 마커 이미지의 이미지 주소입니다
						var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

						for (var i = 0; i < positions.length; i++) {

							// 마커 이미지의 이미지 크기 입니다
							var imageSize = new kakao.maps.Size(24, 35);

							// 마커 이미지를 생성합니다    
							var markerImage = new kakao.maps.MarkerImage(
									imageSrc, imageSize);

							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
								map : map, // 마커를 표시할 지도
								position : positions[i].latlng, // 마커를 표시할 위치
								title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
								image : markerImage
							// 마커 이미지 
							});
						}
						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
							map : map,
							position : locPosition
						});

						var iwContent = message, // 인포윈도우에 표시할 내용
						iwRemoveable = true;

						// 인포윈도우를 생성합니다
						var infowindow = new kakao.maps.InfoWindow({
							content : iwContent,
							removable : iwRemoveable
						});

						// 인포윈도우를 마커위에 표시합니다 
						infowindow.open(map, marker);

						// 지도 중심좌표를 접속위치로 변경합니다
						map.setCenter(locPosition);
					}
					function InpuOnlyNumber(obj) {
						if (event.keyCode >= 48 && event.keyCode <= 57
								|| event.keyCode == 46) { //숫자키만 입력
							return true;
						} else {
							event.returnValue = false;
							alert("숫자만 입력 가능합니다.")
						}
					}

					var json_url = "/JSON/SPOFAC.json";

					//function displayMarker(place) {
					// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
					$
							.getJSON(
									json_url,
									function(data, textStatus) {
										var FAC_SEQ = null;
										var LOC_GU = null;
										var SPO_KIND = null;
										var FAC_NAME = null;
										var FAC_LOC = null;
										var LOC_W = null;
										var LOC_K = null;
										var geocoder = new kakao.maps.services.Geocoder();

										var coord = new kakao.maps.LatLng(lat,
												lon);
										var callback = function(result, status) {
											if (status === kakao.maps.services.Status.OK) {
												var sName = result[0].address.address_name;
												console
														.log('그런 너를 마주칠까 '
																+ result[0].address.address_name
																+ '을 못가');

												var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
												$
														.each(
																data.test,
																function() {
																	FAC_SEQ = this.FAC_SEQ;
																	LOC_GU = this.LOC_GU;
																	SPO_KIND = this.SPO_KIND;
																	FAC_NAME = this.FAC_NAME;
																	FAC_LOC = this.FAC_LOC;
																	LOC_W = this.LOC_W;
																	LOC_K = this.LOC_K;

																	// 마커 이미지의 이미지 크기 입니다
																	var imageSize = new kakao.maps.Size(
																			24,
																			35);

																	// 마커 이미지를 생성합니다    
																	var markerImage = new kakao.maps.MarkerImage(
																			imageSrc,
																			imageSize);

																	// 마커를 생성합니다
																	var marker = new kakao.maps.Marker(
																			{
																				map : map, // 마커를 표시할 지도
																				position : new kakao.maps.LatLng(
																						LOC_W,
																						LOC_K), // 마커를 표시할 위치
																				clickable : true,
																				image : markerImage
																			// 마커 이미지 
																			});

																	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
																	var iwContent = ' <div class="wrap" style="width:200px;height:120px;">'
																			+ '    <div class="info">'
																			+ '        <div class="title">'
																			+ FAC_NAME
																			+ "<br>"
																			+ "("
																			+ SPO_KIND
																			+ ")"
																			+ '        </div>'
																			+ '        <div class="body">'
																			+ '            <div class="desc">'
																			+ '                <div class="ellipsis">'
																			+ "<br>"
																			+ FAC_LOC
																			+ '             </div>'
																			+ '                <div style="margin=5px;"><a href="http://map.kakao.com/?sName='
																			+ sName
																			+ '&eName='
																			+ FAC_LOC
																			+ '" style="color:blue" target="_blank">길찾기</a></div>'
																			+ '            </div>'
																			+ '        </div>'
																			+ '    </div>'
																			+ '</div>', iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

																	// 인포윈도우를 생성합니다
																	var infowindow = new kakao.maps.InfoWindow(
																			{
																				content : iwContent,
																				removable : iwRemoveable
																			});

																	// 마커에 클릭이벤트를 등록합니다
																	kakao.maps.event
																			.addListener(
																					marker,
																					'click',
																					function() {
																						// 마커 위에 인포윈도우를 표시합니다
																						infowindow
																								.open(
																										map,
																										marker);
																					});
																	// console.log(KINDERNAME + " : " + LAT + " , " + LNG + "," + addr);

																});
											}
										};

										geocoder.coord2Address(coord.getLng(),
												coord.getLat(), callback);

									});

				});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

		displayMarker(locPosition, message);
	}
</script>

<!-- 차트차트차트차트 -->
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


</html>
