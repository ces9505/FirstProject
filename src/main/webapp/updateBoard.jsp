<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.filebox .upload-name {
	display: inline-block;
	height: 40px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 89%;
	color: #999999;
}

.filebox label {
	display: inline-block;
	padding: 10px 20px;
	color: #fff;
	vertical-align: middle;
	cursor: pointer;
	height: 40px;
	margin-left: 10px;
}

.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}
</style>



</head>
<body>

	<jsp:include page="top.jsp"></jsp:include>

	<div class="container">
		<h1 class="text-center p-5">게시글 수정</h1>
		<form action="updateBoard.do" method="post"
			enctype="multipart/form-data" onsubmit="checkform()">


			<div class="form-group">
				<input type="text" class="form-control" value="${board.title }"  placeholder="제목입력"
					id="title" name="title" required>
			</div>

			<div class="form-group">
				<input type="number" class="form-control" value="${board.price }" placeholder="가격입력"
					id="price" name="price">
			</div>

			<div class="form-group">
				<label for="place">거래지역:</label> <input type="text"
					class="form-control" value="${board.place }" id="place" name="place" readonly>
				<button class="btn btn-secondary mt-1" type="button"
					onclick="sample4_execDaumPostcode()">거래 지역 설정</button>
				<button class="btn btn-secondary mt-1" type="button"
					onclick="placeReset()">초기화</button>
			</div>
			<div class="form-group">
				<textarea class="form-control" id="content" name="content"  rows="10" placeholder="게시글 내용입력">${board.content }</textarea>
			
			</div>
			<input type="hidden" name="number" value="${board.number }" >
			<input type="hidden" name="level" value="${user.level }"> <input
				type="hidden" name="userid" value="${user.userid }"> <input
				type="hidden" name="name" value="${user.name }"> <input
				type="submit" class="my-5 btn btn-secondary btn-block" value="등록하기">


		</form>




	</div>



	<jsp:include page="footer.jsp"></jsp:include>


	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
	
	function checkform() {
		
		var content = $("textarea[name=content]").val().replace(/(?:\r\n|\r|\n)/g, '<br>');
	    // 변경된 내용을 textarea에 다시 적용
	    $("textarea[name=content]").val(content);
		
		return true;
	}
	
	
	
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					//+ data.bname
					document.getElementById('place').value = "" + data.sido
							+ " " + data.sigungu  ;
				}
			}).open();
		}

		function placeReset() {
			document.getElementById('place').value = "전국";

		}
		$("#file").on('change', function() {
			var files = $("#file")[0].files;
			var fileNames = [];

			// 각 파일의 이름을 배열에 추가
			for (var i = 0; i < files.length; i++) {
				fileNames.push(files[i].name);
			}

			// 파일 이름들을 콤마로 구분하여 업로드 네임 필드에 표시
			$(".upload-name").val(fileNames.join(", "));
		});
	</script>
</body>
</html>