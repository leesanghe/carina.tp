<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

	<script>
    $(document).ready(function () {
        const forms = document.querySelectorAll('.needs-validation');
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {      
//           						  	> 빨간줄뜨는이유 모름 근데 잘됨
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    });    
    
</script>

	<main>
		<!-- Section -->
		<section class="min-vh-100 d-flex bg-primary align-items-center">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-12 col-md-8 col-lg-6 justify-content-center">
						<div class="card bg-primary shadow-soft border-light p-4">
							<div class="card-header text-center pb-0">
								<h2 class="h4">Sign in to our platform</h2>
							</div>
							<div class="card-body">
								<form method="post" action="<c:url value ="/loginDo" />"
									class="mt-4 needs-validation" novalidate>
									<!-- Form -->
										  <%   String referer = request.getHeader("Referer");
										  %>
									<div class="form-group">
										<label for="validationCustom01">Your Id</label>
										<div class="input-group mb-4">
											<div class="input-group-prepend">
												<span class="input-group-text"><span
													class="fas fa-user"></span></span>
											</div>
											<input class="form-control" id="validationCustom01"
												name="memId" placeholder="ID" required pattern=".{3,12}"
												type="text" value="${cookie.rememberId.value }"
												aria-label="memId">
<!-- 											<DIV CLASS="INVALID-FEEDBACK">3~12글자</DIV> -->
											<div class="valid-feedback">good</div>
										</div>
									</div>
									<!-- End of Form -->
									<div class="form-group">
										<!-- Form -->
										<div class="form-group">
											<label for="validationCustom02">Password</label>
											<div class="input-group mb-4">
												<div class="input-group-prepend">
													<span class="input-group-text"><span
														class="fas fa-unlock-alt"></span></span>
												</div>
												<input class="form-control" id="validationCustom02"
													name="memPw" placeholder="Password" required
													 type="password" aria-label="Password">
												<div class="valid-feedback">good</div>
											</div>
										</div>
										<!-- End of Form -->
										<div
											class="d-block d-sm-flex justify-content-between align-items-center mb-4">
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													value="${fromUrl }" id="defaultCheck5" name="rememberMe">
												<label class="form-check-label" for="defaultCheck5">ID
													저장</label>
											</div>

											<div>
												<a href="#" class="small text-right">Lost password?</a>
											</div>
										</div>
									</div>
									<button type="submit" class="btn btn-block btn-primary">Sign
										in</button>

								</form>
								<div class="mt-3 mb-4 text-center">
									<span class="font-weight-normal">or login with</span>
								</div>
								<div class="btn-wrapper my-4 text-center">
									<button
										class="btn btn-primary btn-icon-only text-facebook mr-2"
										type="button" aria-label="facebook button"
										title="facebook button">
										<span aria-hidden="true" class="fab fa-facebook-f"></span>
									</button>
									<button class="btn btn-primary btn-icon-only text-twitter mr-2"
										type="button" aria-label="twitter button"
										title="twitter button">
										<span aria-hidden="true" class="fab fa-twitter"></span>
									</button>
									<button class="btn btn-primary btn-icon-only text-github mr-2"
										type="button" aria-label="github button" title="github button">
										<span aria-hidden="true" class="fab fa-github"></span>
									</button>
									<button class="btn btn-primary btn-icon-only mr-2"
										type="button" onclick="loginWithKakao()"
										aria-label="kakao button" title="kakao button">
										<a id="kakao-login-btn" href='<c:url value="/kakao" />'> <span
											aria-hidden="true" class="custom-icon"> <img
												src="./resources/assets/img/brand/kakao1.png"
												alt="Custom Icon">
										</span>
									</button>

								</div>
								<div
									class="d-block d-sm-flex justify-content-center align-items-center mt-4">
									<span class="font-weight-normal">SNS Sign  <a
										href="#" class="font-weight-bold">Create account</a></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>


	<%@include file="/WEB-INF/inc/footer.jsp"%>
</body>
<script>
    // JavaScript를 사용하여 referer 값을 hidden input에 설정
  
    document.getElementById('refererInput').value = '<%= referer %>';
</script>
</html>