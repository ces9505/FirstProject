<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.itemImg {
	width: 358px; /* 이미지의 원하는 폭 지정 */
	height: 300px; /* 이미지의 원하는 높이 지정 */
	object-fit: cover; /* 이미지가 지정한 크기에 맞게 늘어나거나 줄어들도록 설정 */
}

.no-padding {
	padding: 0 !important;
}

#commonList a {
	text-decoration: none;
	color: black;
}

.placImg {
	width: 25px;
}
</style>
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	
	<div class="container ">
		<h3 class="mt-5 text-center">빌려요!</h3>
		<c:out value="${place }"></c:out>
		<div id="commonList" class="row container my-5">

			<c:if test="${commonList != null }">
				<c:forEach items="${commonList }" var="item">
					<c:set var="imgArray" value="${fn:split(item.img, ',')}" />
					<a href="getBoard.do?number=${item.number }"
						class="col-4 m-auto border no-padding"><div>
							<c:if test="${imgArray[0].length()<1 }">

								<img class="itemImg" src="resources/imgs/nonImg.png">
							</c:if>
							<c:if test="${imgArray[0].length()>1 }">
								<img class="itemImg"
									src="./resources/productIMG/${imgArray[0] }">
							</c:if>
							<div class=" p-2">${item.title }</div>
							<strong class="p-2">${item.price }원</strong>
							<hr>
							<div class="row p-2">
								<div class="col-2 ">
									<img class="placImg" src="resources/imgs/place.png">
								</div>
								<div class="col-9">${item.place }</div>
							</div>
						</div></a>
				</c:forEach>

			</c:if>
		</div>

	</div>




	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>