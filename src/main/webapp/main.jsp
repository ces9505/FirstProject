<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.carousel-inner img {
	width: 100%;
	height: 100%;
}

#newItemList img {
	width: 100%;
	border-radius: 5px;
}




</style>
</head>
<body>
	<div id="main">
		<jsp:include page="top.jsp"></jsp:include>

		<div id="banner" class="carousel slide" data-ride="carousel">
			<ul class="carousel-indicators">
				<li data-target="#banner" data-slide-to="0" class="active"></li>
				<li data-target="#banner" data-slide-to="1"></li>
				<li data-target="#banner" data-slide-to="2"></li>
			</ul>

			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="resources/imgs/banner01.png" alt="배너1">
				</div>
				<div class="carousel-item">
					<img src="resources/imgs/banner01.png" alt="배너1">
				</div>
				<div class="carousel-item">
					<img src="resources/imgs/banner01.png" alt="배너1">
				</div>
			</div>
			<a class="carousel-control-prev" href="#banner" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#banner" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>


		<div class="container">
			<h3 class="text-center mt-5">최근 등록 물품</h3>
			<div id="newItemList" class="row container">
				<div class="col-4 m-auto">
					<img class="" src="resources/imgs/bag1.jpg">
					<div class="">아이템 이름</div>
				</div>

				<div class="col-4 mx-auto my-3">
					<img class="" src="resources/imgs/bag1.jpg">
					<div class="">아이템 이름</div>
				</div>
				<div class="col-4 mx-auto my-3">
					<img class="" src="resources/imgs/bag1.jpg">
					<div class="">아이템 이름</div>
				</div>
				<div class="col-4 mx-auto my-3">
					<img class="" src="resources/imgs/bag1.jpg">
					<div class="">아이템 이름</div>
				</div>
				<div class="col-4 mx-auto my-3">
					<img class="" src="resources/imgs/bag1.jpg">
					<div class="">아이템 이름</div>
				</div>
				<div class="col-4 mx-auto my-3">
					<img class="" src="resources/imgs/bag1.jpg">
					<div class="">아이템 이름</div>
				</div>

			</div>

		</div>
	
	<jsp:include page="footer.jsp"></jsp:include>

</div>

</body>
</html>