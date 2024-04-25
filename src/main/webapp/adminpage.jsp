<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" lang="ko">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${user.level==2 }">
		<div>
			<jsp:include page="top.jsp"></jsp:include>

			<div class="container">

				<c:if test="${BlockUser ne null}">
					<div class="alert alert-secondary alert-dismissible fade show">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong>${BlockUser.userid } 회원 ${BlockUser.blockdate }일
							차단 완료</strong>
					</div>
					<%
					session.removeAttribute("BlockUser");
					%>
				</c:if>
				<c:if test="${ClearUser ne null}">
					<div class="alert alert-secondary alert-dismissible fade show">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong>${ClearUser.userid } 회원 차단 해제완료</strong>
					</div>
					<%
					session.removeAttribute("ClearUser");
					%>
				</c:if>
				<div class="btn-group btn-group-lg my-5">
					<button id="general"  type="button" class="btn btn-secondary userControlBtn">일반회원</button>
					<button id="company" type="button" class="btn btn-secondary userControlBtn">기업회원</button>
					<button id="block" type="button" class="btn btn-secondary">차단회원</button>
				</div>

				<div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>회원아이디</th>
								<th>이름</th>
								<th>점수</th>
								<th>가입일</th>
								<th>이메일</th>
								<th>번호</th>
								<th>비고/차단</th>

							</tr>
						</thead>
						<tbody id="userTable">
						</tbody>
					</table>

				</div>

			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</c:if>
	<script src="js/jquery-3.7.1.js"></script>
	<script>
	
	$('#block').on(
			"click",
			function() {
						
				$
						.ajax({
							url : "getUserList.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
							type : "post", // HTTP 요청방식 (get/post)
							data : {
								"level" : 9
							}, // HTTP 요청과 함께 서버로 보낼 데이터
							dataType : 'json', // 서버에서 보내줄 데이터의 타입
							// 성공적으로 값을 서버로 보냈을 경우 처리하는 코드
							success : function(result) {
								if (result != null) {

									if (result.length > 0) {
										$("#userTable").html(''); // 기존 내용 초기화

										for (var i = 0; i < result.length; i++) {
											var user = result[i];
											console.log('Name: '
													+ user.name
													+ ', Age: '
													+ user.age);
											$("#userTable")
													.append(
															"<tr><td>"
																	+ user.userid
																	+ "</td><td>"
																	+ user.name
																	+ "</td><td>"
																	+ user.score
																	+ "</td><td>"
																	+ new Date(
																			user.time)
																			.toLocaleString(
																					'ko-KR',
																					{
																						timeZone : 'UTC'
																					})
																	+ "</td><td>"
																	+ user.email
																	+ "</td><td>"
																	+ user.phone
																	+ "</td><td >"
																	+ "<form id='blockForm" +user.userid+"' action='clearBlock.do' method='post'><div class='d-flex flex-wrap'>"
																	+ "<textarea form='blockForm"+user.userid+"' name='remarks'>"
																	+ (user.remarks != null ? user.remarks
																			: "")
																	+ "</textarea>"
																	+ "<input type='hidden' value='" + user.userid + "' name='userid'>"
																	+ "<input class=' btn btn-secondary' type='submit' value='차단해제'>"
																	+ "</div></form></td></tr>");
										}
									} else {
										$("#userTable").html(
												'조회가능한 데이터가 없습니다');
									}
								} else {
									$("#userTable").html(
											'서버 응답이 올바르지 않습니다');
								}
							},
							error : function() {
								alert("서버요청실패");
							}
						})
			})
	
		$('.userControlBtn')//유저리스트 확인 이벤트
				.on(
						"click",
						function() {
							let num = null;
							let type = $(this).prop("id");
							if(type==='general')
							{
								num = 0;
							}else if(type==='company'){
								num=1;
							}
							$
									.ajax({
										url : "getUserList.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
										type : "post", // HTTP 요청방식 (get/post)
										data : {
											"level" : num
										}, // HTTP 요청과 함께 서버로 보낼 데이터
										dataType : 'json', // 서버에서 보내줄 데이터의 타입
										// 성공적으로 값을 서버로 보냈을 경우 처리하는 코드
										success : function(result) {
											if (result != null) {

												if (result.length > 0) {
													$("#userTable").html(''); // 기존 내용 초기화

													for (var i = 0; i < result.length; i++) {
														var user = result[i];
														console.log('Name: '
																+ user.name
																+ ', Age: '
																+ user.age);
														$("#userTable")
																.append(
																		"<tr><td>"
																				+ user.userid
																				+ "</td><td>"
																				+ user.name
																				+ "</td><td>"
																				+ user.score
																				+ "</td><td>"
																				+ new Date(
																						user.time)
																						.toLocaleString(
																								'ko-KR',
																								{
																									timeZone : 'UTC'
																								})
																				+ "</td><td>"
																				+ user.email
																				+ "</td><td>"
																				+ user.phone
																				+ "</td><td >"
																				+ "<form id='blockForm"+user.userid+"' action='plusBlock.do' method='post'><div class='d-flex flex-wrap'>"
																				+ "<textarea form='blockForm"+user.userid+"' name='remarks'>"
																				+ (user.remarks != null ? user.remarks
																						: "")
																				+ "</textarea>"
																				+ "<select  name='blockdate'>"
																				+ "<option value='1'>1일</option>"
																				+ "<option value='3'>3일</option>"
																				+ "<option value='7'>7일</option>"
																				+ "</select>"
																				+ "<input type='hidden' value='" + user.userid + "' name='userid'>"
																				+ "<input class=' btn btn-secondary' type='submit' value='차단'>"
																				+ "</div></form></td></tr>");
													}
												} else {
													$("#userTable").html(
															'조회가능한 데이터가 없습니다');
												}
											} else {
												$("#userTable").html(
														'서버 응답이 올바르지 않습니다');
											}
										},
										error : function() {
											alert("서버요청실패");
										}
									})
						})//유저리스트 확인 이벤트
	</script>


</body>
</html>