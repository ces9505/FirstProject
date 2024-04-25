<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITEM SHARING</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.nav-link:hover {
	text-decoration: underline;
}

#searchbar {
	border: 1px solid black;
	border-radius: 15px;
}

#searchbar input[type="text"] {
	width: 300px;
}

input:focus {
	outline: none;
}

#searchbar input {
	border: none;
}

#mypage img {
	width: 30px;
}

#menubar a {
	display: inline-block;
	line-height: 50px;
	text-align: center;
	height: 50px;
	width: 100%;
	text-decoration: none;
	color: white;
	text-decoration: none;
	height: 50px;
}

#menubar a:hover {
	background-color: white;
	color: black;
}

a {
	text-decoration: none;
	position: relative;
}
</style>

</head>
<body>
	<div id="top">
		<div id="top_header" class="container mt-1">
			<div>
				<ul id="top_navi" class="nav justify-content-end">

					<c:if test="${user == null }">
						<li class="nav-item"><a href="#"
							class="text-secondary nav-link" data-toggle="modal"
							data-target="#myModalLogin">로그인</a></li>
						<li class="nav-item"><a href="#" class=" nav-link"
							data-toggle="modal" data-target="#myModalJoin">회원가입</a></li>
					</c:if>

					<li class="nav-item"><a href="#"
						class="text-secondary nav-link">이벤트</a></li>
					<li class=" nav-item dropdown"><a
						class="text-secondary nav-link" id="navbardrop"
						data-toggle="dropdown" href="#">고객센터</a></li>
					<c:if test="${user!=null }">
						<li class="nav-item"><a href="mypage.jsp"
							class="text-secondary nav-link">마이페이지</a></li>
						<li class="nav-item"><a href="logout.do"
							class="text-secondary nav-link"><strong>로그아웃</strong></a></li>
					</c:if>
					<c:if test="${user.level ==2 }">
						<li class="nav-item"><a href="adminpage.jsp"
							class="text-secondary nav-link"><strong>관리자페이지</strong></a></li>
					</c:if>
				</ul>
			</div>

			<div id="navi_logo_search" class="my-4 ">
				<a href="main.jsp"><img src="resources/imgs/logo.png"></a>
				<div class="float-right">
					<div id="searchbar" class="float-left d-inline p-1">
						<form>
							<input class="" type="text" name="search"> <input
								class="" type="image" src="resources/imgs/search.svg">
						</form>
					</div>



					<ul id="mypage" class=" nav justify-content-end ">
						<li class="nav-item mx-2"><a id="heartA" data-toggle="modal"
							data-target="#heartList"><img
								src="resources/imgs/heart-fill.svg" class="img-fluid"></a></li>
						<li class="nav-item mx-2"><a href="#"><img
								src="resources/imgs/send-fill.svg" class="img-fluid"></a></li>
					</ul>
				</div>
			</div>

		</div>
		<div id="menubar" class="container-fluid bg-dark">
			<div class="container mt-3 text-light">
				<div class="row">
					<div class="col">
						<a href="addproduct.jsp">물품등록</a>
					</div>
					<div class="col">
						<a href="getCommonList.do">빌려요</a>
					</div>
					<div class="col">
						<a href="#">업체렌탈</a>
					</div>
				</div>
			</div>
		</div>
		<!--모달 로그인-->
		<div class="modal" id="myModalLogin">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4>로그인</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body  loginForm-->
					<div class="modal-body">

						<form id="loginForm" method="post" action="login.do">
							<div class="my-5">
								<div class="form-group ">
									<input required id="id" type="text" name="userid"
										class="form-control" placeholder="아이디">

								</div>
								<div class="form-group">
									<input required id="pw" type="password" name="userpw"
										class="form-control" placeholder="비밀번호">

								</div>
								<p class=" bold text-danger text-center" id="redWORD"></p>
								<div class="form-group">
									<input id="loginbtn" value="로그인"
										class="bg-dark text-white form-control" type="submit">
								</div>
								<p class="text-right">
									<a href="#" class="" data-toggle="modal"
										data-target="#myModalJoin" data-dismiss="modal">회원가입</a>
								</p>
							</div>
						</form>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
		<!-- 로그인 모달 마지막 -->
		<!-- 회원 가입 모달 -->
		<div class="modal" id="myModalJoin">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4>회원가입</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">


						<form method="post" action="insertUser.do">
							<div class="my-5">
								<div class="form-group ">
									<input type="text" name="userid" class="form-control"
										placeholder="아이디">

								</div>
								<div class="form-group">
									<input type="password" name="userpw" class="form-control"
										placeholder="비밀번호">

								</div>
								<div class="form-group">
									<input type="text" name="name" class="form-control"
										placeholder="이름">
								</div>
								<div class="form-group">
									<input type="email" name="email" class="form-control"
										placeholder="이메일">
								</div>
								<div class="form-group">
									<input type="text" name="phone" class="form-control"
										placeholder="핸드폰번호(숫자만입력해주세요)">
								</div>
								<div class="form-check">
									<label class="form-check-label"> <input type="radio"
										name="level" class="form-check-label" value="0">일반
									</label> <label class="form-check-label"> <input type="radio"
										name="level" class="form-check-label" value="1">업체
									</label>
								</div>
								<div class="form-group">
									<input value="회원가입" class="bg-dark text-white form-control"
										type="submit">
								</div>
							</div>
						</form>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
		<!--회원가입 모달 끝-->
		<!-- The Modal -->
		<div class="modal" id="heartList">
			<div
				class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h1 class="modal-title">찜 리스트</h1>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<div class="list-group" id="heartlist"></div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
			<!--찜리스트 모달 시작-->
		</div>
		<script src="js/jquery-3.7.1.js"></script>
		<script>
			$(document)
					.ready(
							function() {
								$("#loginForm").submit(loginSubmit);

								function loginSubmit(event) {
									var insertID = $("#id").val();
									var insertPW = $("#pw").val();
									event.preventDefault();

									$
											.ajax({
												url : "getEnterUser.do",
												type : "post",
												data : {
													"userid" : insertID,
													"userpw" : insertPW
												},
												dataType : 'text',
												success : function(result) {
													$("#redWORD").html("");

													if (result === "success") {
														$("#loginForm").off(
																'submit',
																loginSubmit);
														$("#loginForm")
																.submit();
													} else if (result === "not") {
														$("#redWORD")
																.html(
																		'입력하신 아이디 혹은 비밀번호에 문제가 있습니다.');
													} else {
														$("#redWORD").html(
																result);
													}
												},
												error : function() {
													alert("서버요청실패");
												}
											});
								}

								/* 찜목록 */
								$("#heartA")
										.on(
												"click",
												function() {
													var userid = "${user.userid}";
													console.log("하트리스트");
													$
															.ajax({
																url : "myHeartList.do",
																type : "post",
																data : {
																	"userid" : userid
																},
																dataType : 'json',
																success : function(
																		result) {
																	if (result && result.length > 0) {
																		$(
																				"#heartlist")
																				.empty(); // 기존 내용 초기화
																		for (var i = 0; i < result.length; i++) {
																			var heart = result[i];
																			$(
																					"#heartlist")
																					.append(
																							"<a href='getBoard.do?number="
																									+ heart.boardnumber
																									+ "' class='list-group-item list-group-item-action'>"
																									+ heart.boardtitle
																									+ "</a>");
																		}
																	} else {
																		$(
																				"#heartlist")
																				.html(
																						'조회가능한 데이터가 없습니다');
																	}
																},
																error : function() {
																	alert("서버요청실패");
																}
															});
												});
							});
		</script>
</body>
</html>