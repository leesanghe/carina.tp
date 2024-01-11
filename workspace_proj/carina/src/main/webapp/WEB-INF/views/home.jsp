
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>
<html>
<head>
<title>CARINA - carbon reduce now</title>

<link href="<c:url value="/resources/css/neumorphism.css" />"
	rel='stylesheet'>

</head>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>
	<section class="section section-lg0">
		<div class="container">
			<div class="text-animation">
				<div class="text-wrapper">
					<h3>
						탄소 중립 <br> 더이상 미룰 수 없습니다
					</h3>
					<!-- <h3>탄소 중립 <br> 더이상 미룰 수 없습니다</h3> -->
				</div>
			</div>

			<div class="waveDiv animation-wave">

				<div class="wave-content-wrapper first-wave">
					<div class="wave-image first-image"
						style="background-image: url('https://www.yudiz.com/codepen/wave-animation/first-wave.png')">
					</div>
				</div>
				<div class="wave-content-wrapper second-wave">
					<div class="wave-image second-image"
						style="background-image: url('https://www.yudiz.com/codepen/wave-animation/second-wave.png')">
					</div>
				</div>
				<div class="wave-content-wrapper third-wave">
					<div class="wave-image third-image"
						style="background-image: url('https://www.yudiz.com/codepen/wave-animation/third-wave.png')">
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="section section-lg2" id="youtube-section">
		<!-- 스크립트를 통해 유튜브 배치 -->
	</section>
	<script>
        // YouTube Video ID
        var videoId = "1HvkHGKgeQQ"; // 실제로 사용할 YouTube 비디오의 ID로 교체
        // 섹션에 추가할 iframe 요소 생성
        var iframe = document.createElement("iframe");
        iframe.src = "https://www.youtube.com/embed/" + videoId + "?autoplay=1&loop=1&controls=0&showinfo=0&autohide=1&mute=1&cc_load_policy=1";
        iframe.frameBorder = 0;
        iframe.allowFullscreen = true;
        // 섹션에 iframe을 배경으로 추가
        var section = document.getElementById("youtube-section");
        section.appendChild(iframe);
        iframe.classList.add("youtube-background");
    </script>
	<section class="section section-lg3">
		<div class="section-lg3">
			<h1>
				매년 늘어만 가는 <span style="background-color: yellowgreen;"> 이상기후
				</span><br> 과연 지켜만 봐야 할까요?
			</h1>
			<h5>
				전세계적으로 홍수, 전 세계를 휩쓴 대형 산불, 감염병의 확산, 가뭄, <br>폭염 등 기후재앙은 이미 시작되었고
				더욱 심해지고 있습니다.
			</h5>
			<div class="button-container">
				<button class="btn btn-lg btn-primary" type="button"> 스크롤해서 자세히 	알아보기</button>
			</div>
		</div>
	</section>
	<section class="section section-lg4">
		<div class="row justify-content-center">
			<div class="col-md-5">
				<!-- Carousel -->
				<div id="Carousel3"
					class="carousel slide shadow-soft border border-light p-4 rounded"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#Carousel3" data-slide-to="0" class="active"></li>
						<li data-target="#Carousel3" data-slide-to="1"></li>
						<li data-target="#Carousel3" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner rounded">
						<div class="carousel-item active">
							<img class="d-block w-100"
								src="assets/img/carousel/카드뉴스1.png" alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="assets/img/carousel/카드뉴스2.png"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100"
								src="assets/img/carousel/카드뉴스3.png" alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#Carousel3" role="button"
						data-slide="prev"><span class="carousel-control-prev-icon"
						aria-hidden="true"></span> <span class="sr-only">Previous</span> </a><a
						class="carousel-control-next" href="#Carousel3" role="button"
						data-slide="next"><span class="carousel-control-next-icon"
						aria-hidden="true"></span> <span class="sr-only">Next</span></a>
				</div>
				<!-- End of Carousel -->
			</div>

		</div>
	</section>

	<main>
		<!-- Section -->
		<section class="section section-lg">
			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-md-12 col-lg-12 mb-5">
						<!-- Contact Card -->
						<div
							class="card bg-primary shadow-soft border-light p-2 p-md-3 p-lg-5">
							<div class="card-header">
								<div class="row justify-content-center">
									<div class="col-12"></div>
									<div class="col-12 col-md-8 text-center mb-5">
										<h1 class="display-2 mb-3">탄소 중립이란?</h1>
										<br>
										<p class="lead">화석 연료 사용 등 인간활동에 따른 온실가스 배출량이 전 지구적 이산화탄소
											흡수량과 균형을 이뤄 대기 중 이산화탄소 농도가 더 높아지지 않는 것을 의미합니다. 즉 이산화탄소 순 배출량이
											‘0'이 되도록 하는 것으로 ‘넷 제로(Net Zero), 탄소 제로(Carbon Zero)’라고도 합니다.</p>
									</div>
									<img src="assets/img/illustrations/탄소 중립.png">
								</div>
							</div>
							<!-- End of Contact Card -->
						</div>
					</div>
				</div>
		</section>
		<!-- End of section -->
		<section class="section section-lg">
			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-md-12 col-lg-12 mb-5">
						<!-- Contact Card -->
						<div
							class="card bg-primary shadow-soft border-light p-2 p-md-3 p-lg-5">
							<div class="card-header">
								<div class="row justify-content-center">
									<div class="col-12"></div>
									<div class="col-12 col-md-8 text-center mb-5">
										<h1 class="display-2 mb-3">TEAM CARINA</h1>
										<img src="assets/img/brand/carina_logo.png" vspace="50">

										<p class="lead">CARINA란, Carbon Reduce Now에서 따온 팀명이며, 지금
											당장 지구를 위해 탄소 중립을 실천하자는 뜻을 가지고 있습니다.</p>
									</div>

								</div>
							</div>
							<!-- End of Contact Card -->
						</div>
					</div>
				</div>
		</section>
		<section class="section section-lg1">
			<div class="rotating-text-wrapper">
				<h2>희망의 온도는 높이고</h2>
				<h2>지구의 온도는 낮추고</h2>
				<h2>With CARINA</h2>
			</div>
		</section>
	</main>
	<%@include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>
