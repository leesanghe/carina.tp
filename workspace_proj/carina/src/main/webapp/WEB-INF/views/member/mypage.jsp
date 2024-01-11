<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  
	<script>
	$(document).ready(function () {
	  $('#validationCustom04').click('focus',function(e){
	        new daum.Postcode({
	            oncomplete: function(data) {
	                console.log(data);
	                // 'address' 값을 다른 위치에 설정
	                var addressValue = data['address'];
	                // 예: 다른 요소의 id가 'addressResult'인 경우
	                $('#validationCustom04').val(addressValue);
	                
	                // 'bcode' 값을 특정 위치에 설정
	                var bcodeValue = data['sigunguCode'];
	                // 예: 다른 요소의 id가 'bcodeResult'인 경우
	                $('#validationCustom05').val(bcodeValue);
	                
	            }
	        }).open();
	    });
	  $('#withdrawButton').click(function () {
          // 여기에 회원 탈퇴 처리 로직을 추가할 수 있습니다.
          // 실제로는 AJAX를 사용하여 서버에 탈퇴 요청을 보내고, 성공하면 화면을 리로드하거나 다른 페이지로 이동하는 등의 동작을 수행합니다.
          alert('회원 탈퇴 버튼이 클릭되었습니다.');
      });
	  });
    </script>
    
<body>
	<main>
	<%@include file="/WEB-INF/inc/top.jsp"%>
		<!-- Section -->
		<section class="min-vh-100 d-flex bg-primary align-items-center">
			<div class="container mt-7 mb-5">
				<div class="row justify-content-center">
					<div class="col-12 col-md-8 col-lg-6 justify-content-center">
						<div class="card bg-primary shadow-soft border-light p-4">
							<div class="card-header text-center pb-0">
								<h2 class="h4">My Page</h2>
							</div>
							<div class="card-body">
								<form method="post" action="<c:url value='/updateProfile' />"
									class="mt-4">
									<!-- Form -->
									<div class="form-group">
										<label for="validationCustom01">아이디(변경불가)</label>
										<div class="input-group mb-4">
											<div class="input-group-prepend">
												<span class="input-group-text"><span
													class="fas fa-user"></span></span>
											</div>
											<input class="form-control" id="validationCustom01"
												name="memId" placeholder="ID" type="text"
												value="${sessionScope.login.memId}" aria-label="memId"
												readonly>
										</div>
									</div>
									<!-- End of Form -->

									<div class="form-group">
										<!-- Form -->
										<div class="form-group">
											<label for="validationCustom02">비밀번호 변경</label>
											<div class="input-group mb-4">
												<div class="input-group-prepend">
													<span class="input-group-text"><span
														class="fas fa-unlock-alt"></span></span>
												</div>
												<input class="form-control" id="validationCustom02"
													name="memPw" placeholder="Password" type="password"
													value="" aria-label="Password"
													required>
											</div>
										</div>
									</div>
									<!-- End of Form -->

									<div class="form-group">
										<!-- Form -->
										<div class="form-group">
											<label for="validationCustom03">이메일</label>
											<div class="input-group mb-4">
												<div class="input-group-prepend">
													<span class="input-group-text"><span
														class="fas fa-envelope"></span></span>
												</div>
												<input class="form-control" id="validationCustom03"
													name="email" placeholder="email" type="email"
													value="${sessionScope.login.email}" aria-label="email"
													required>
											</div>
										</div>
									</div>
									<!-- End of Form -->

									<div class="form-group">
										<!-- Form -->
										<div class="form-group">
											<label for="validationCustom04">주소</label>
											<div class="input-group mb-4">
												<div class="input-group-prepend">
													<span class="input-group-text"><span
														class="fas fa-map-marker-alt"></span></span>
												</div>
												<input class="form-control" id="validationCustom04"
													name="address" placeholder="address" type="address"
													value="${sessionScope.login.address}" aria-label="address"
													required>
											</div>
										</div>
									</div>
									<!-- End of Form -->
									<div class="form-group">
										<!-- Form -->
										<div class="form-group">
											<label for="validationCustom05">시군구코드</label>
											<div class="input-group mb-4">
												<div class="input-group-prepend">
													<span class="input-group-text"><span
														class="fas fa-map-marker-alt"></span></span>
												</div>
												<input class="form-control" id="validationCustom05"
													name="sgngCd" placeholder="Address_Code"
													type="text" value="${sessionScope.login.sgngCd}"
													aria-label="sgngCd" required>
											</div>
										</div>
									</div>
									</div>
									<!-- End of Form -->
									<!-- Add more fields as needed -->

									<div
										class="d-block d-sm-flex justify-content-between align-items-center mb-4">
										<!-- Add additional options or links as needed -->
										<div>
											<a href="#" id=withdrawButton class="small text-right">회원탈퇴</a>
										</div>
									</div>
							</div>

							<button type="submit" class="btn btn-block btn-primary">회원정보수정</button>
							</form>


						</div>
					</div>
				</div>
			</div>
			</div>
		</section>
	</main>


	<%@include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>