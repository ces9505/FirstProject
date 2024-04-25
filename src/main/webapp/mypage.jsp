<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="top.jsp"></jsp:include>

	<div class="container-fruid bg-primary text-white">
		<div class="container">
			<c:if test="${user==null }">
				<div class="p-5">
					<h1>안녕하세요!</h1>
					<h3>회원가입 후 이용해주세요!</h3>
					<a href="#" data-toggle="modal" data-target="#myModalJoin"><h2
							class="text-white"><strong>회원가입하기</strong></h2></a>
				</div>
			</c:if>




			<c:if test="${user!=null }">
				<div class="p-5">
					<h1>안녕하세요!</h1>
					<h3>${user.name }님환영합니다.</h3>

				</div>
			</c:if>

		</div>
	</div>
	
	<div class="container p-5">
		<h1>회원정보 수정</h1>
		<form action="updateUser.do" method="post">
			<div class="form-group">
				<label for="userid">아이디:</label> <input type="text"
					value="${user.userid }" class="form-control" name="userid" readonly>
			</div>

			<div class="form-group">
				<label for="userpw">수정할 비밀번호:</label> <input type="password"
					class="form-control" name="userpw" placeholder="비밀번호 입력">
			</div>
			<div class="form-group">
				<label for="name">이름:</label> <input type="text"
					value="${user.name }" class="form-control" name="name"
					placeholder="이름입력">
			</div>
			<div class="form-group">
				<label for="email">이메일:</label> <input type="email"
					value="${user.email }" class="form-control" name="email"
					placeholder="이메일입력">
			</div>
			<div class="form-group">
				<label for="phone">번호:</label> <input type="text"
					value="${user.phone }" class="form-control" name="phone"
					placeholder="핸드폰입력(숫자만)">
			</div>
			<div class="form-group">
				<input type="submit" class="bg-dark text-white form-control"
					value="정보수정">

			</div>
		</form>
		<button type="button" class="btn btn-danger btn-block"
			data-toggle="modal" data-target="#myModaldelete">회원탈퇴</button>
	</div>

	<div class="modal" id="myModaldelete">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4>회원탈퇴</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<h3 class="text-center">정말 탈퇴하시겠습니까?</h3>
					<div class="container d-flex justify-content-end">
						<form method="post" action="deleteUser.do">
							<input type="hidden" value="${user.userid }" name="userid">
							<input type="submit" class="btn btn-danger" value="예">
						</form>
						<button type="button" class=" btn btn-success"
							data-dismiss="modal">아니요</button>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer"></div>

			</div>
		</div>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>