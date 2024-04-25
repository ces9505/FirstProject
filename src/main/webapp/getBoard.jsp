<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.carousel-inner img {
	width: 450px;
	height: 450px;
	object-fit: cover;
}

.itemImg {
	width: 450px;
	height: 450px;
	object-fit: cover;
}

.placeimg {
	width: 16px;
}

#contentarea {
	border-top: 1px solid black;
}
</style>

</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>

	<div class="container">
		<hr class="my-3">
		<div class="row my-3">
			<c:if test="${board !=null }">
				<c:set var="imgArray" value="${fn:split(board.img, ',')}" />
				<c:if test="${imgArray[0].length() >0 }">

					<div id="demo" class="carousel slide col-5" data-ride="carousel">
						<ul class="carousel-indicators">
							<c:forEach items="${imgArray }" var="img" varStatus="count">
								<li data-target="#demo" data-slide-to="${count.index }"></li>
							</c:forEach>

						</ul>
						<div class="carousel-inner">
							<c:forEach items="${imgArray }" var="img" varStatus="count">
								<c:if test="${count.index == 0  }">
									<div class="carousel-item  active">
										<img src="./resources/productIMG/${img }">
									</div>
								</c:if>
								<c:if test="${count.index != 0  }">
									<div class="carousel-item ">
										<img src="./resources/productIMG/${img }">
									</div>
								</c:if>
							</c:forEach>
						</div>
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#demo" data-slide="next">
							<span class="carousel-control-next-icon"></span>
						</a>
					</div>



				</c:if>
				<c:if test="${imgArray[0].length() <=0 }">

					<img class="itemImg col-5" src="resources/imgs/nonImg.png">

				</c:if>

			</c:if>

			<div class="col-6 p-3">
				<h2 class="mb-3">
					<strong>${board.title }</strong>
				</h2>
				<h1 class="mb-2">
					<strong>${board.price }원</strong>
				</h1>
				<hr class="my-3">
				<div class="row">
					<div class="col-2">
						<img class="icons mx-1" src="resources/imgs/heart-fill.svg"><span
							id="heartPlace">${board.heart }</span>
					</div>
					<div class="col-2">
						<img class="icons mx-1" src="resources/imgs/eye-fill.svg">${board.view }
					</div>


					<div class="col-3">
						<img class="icons mx-1" src="resources/imgs/pencil.svg">${time }
					</div>
				</div>
				<!--작성자만 보이게-->
				<c:if test="${board.userid == user.userid }">

					<ul class="nav">
						<li class="nav-item "><a class="nav-link text-dark"
							href="updateBoard.jsp">수정</a></li>
						<li class="nav-item"><a class="nav-link text-dark"
							href="deleteBoard.do?number=${board.number }">삭제</a></li>
					</ul>


				</c:if>

				<div class="mt-1">
					<a href="getPlaceList.do?place=${board.place }" type="button"
						class="btn btn-primary text-white btn-block my-2 p-3"> <img
						class="placeimg icons mx-1" src="resources/imgs/place.png">${board.place}
					</a>
					<c:if test="${board.userid == user.userid }">
						<c:if test="${board.renting == false }">
							<a href="renting.do?number=${board.number }">
								<button type="button" onclick=""
									class="btn btn-success text-white btn-block my-2 p-3">
									렌탈 가능</button>
							</a>
						</c:if>
						<c:if test="${board.renting == true }">
							<a href="renting.do?number=${board.number }&renting=${board.renting}">
								<button type="button" onclick=""
									class="btn btn-danger text-white btn-block my-2 p-3">렌탈
									중</button>
							</a>
						</c:if>
					</c:if>
					<c:if test="${board.userid != user.userid }">
						<c:if test="${board.renting == false }">
							<button type="button" onclick=""
								class="btn btn-success text-white btn-block my-2 p-3" disabled>
								렌탈 가능</button>
						</c:if>
						<c:if test="${board.renting == true }">
							<button type="button" onclick=""
								class="btn btn-danger text-white btn-block my-2 p-3" disabled>렌탈
								중</button>
						</c:if>
					</c:if>
					<button type="button" id="plusHeart"
						class="btn btn-info text-white btn-block my-2 p-3">
						<img class="icons mx-1" src="resources/imgs/heart-fill.svg">찜하기
					</button>

					<button type="button" onclick=""
						class="btn btn-danger text-white btn-block my-2 p-3">
						<img class="icons mx-1" src="resources/imgs/send-fill.svg">문의하기
					</button>
				</div>

			</div>

		</div>

		<div id="contentarea" class="row container mt-5">



			<div class="col-7 mt-4">
				<strong class="">상품 정보</strong>
				<hr>
				<div class="my-4">${board.content }</div>
			</div>




		</div>



	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/jquery-3.7.1.js"></script>
	<script>
		var userid = "${user.userid}";
		var boardtitle = "${board.title}";
		var boardnumber = "${board.number}";
		var heartsCount = $("#heartPlace").text();
		$(document)
				.ready(
						function() {

							$('#plusHeart')
									.on(
											"click",
											function() {
												if (!userid
														|| userid.trim() === "") {
													alert("로그인 해주세요");
													console.log(userid);
													console
															.log("Button clicked");
													return;
												}
												// 확인용 로그

												$
														.ajax({
															url : "insertHearts.do",
															type : "post",
															data : {
																"userid" : userid,
																"boardtitle" : boardtitle,
																"boardnumber" : boardnumber
															},
															dataType : 'text',
															success : function(
																	result) {
																if (result != null) {
																	console
																			.log(
																					"Success:",
																					result); // 확인용 로그

																	$
																			.ajax({
																				url : "setBoardHeart.do",
																				type : "post",
																				data : {
																					"title" : boardtitle,
																					"heart" : result
																				},
																				dataType : 'text',
																				success : function(
																						result2) {
																					if (result != null) {
																						console
																								.log(
																										"Success:",
																										result2); // 확인용 로그

																					}
																				},
																				error : function(
																						jqXHR,
																						textStatus,
																						errorThrown) {
																					console
																							.error(
																									"Error:",
																									textStatus,
																									errorThrown); // 확인용 로그
																					alert("서버 요청 실패");
																				}
																			});

																	$(
																			"#heartPlace")
																			.text(
																					result);
																}
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																console
																		.error(
																				"Error:",
																				textStatus,
																				errorThrown); // 확인용 로그
																alert("서버 요청 실패");
															}
														});
											});
						});
	</script>
</body>
</html>