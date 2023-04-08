<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Security-Policy"
	content="upgrade-insecure-requests">

<!-- 결제모듈 -->
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


<!-- 우편번호 검색용 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function findaddr() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById("order_pcode").value = data.zonecode;
				document.getElementById("order_addr").value = data.address;
				document.getElementById("order_detail").focus();
			},
			autoClose : true
		// 팝업 자동 닫힘
		}).open();
	}
</script>

<script type="text/javascript">
		// 이름 입력 필드를 가져옴
		var nameInput = document.getElementById("order_name");
		
		// 사용자가 새로운 이름을 입력했는지 확인
		if (nameInput.value !== "${sessionScope.ssInfo.user_name}") {
		  // 입력된 이름 값을 폼 데이터에 있는 이름 필드에 할당
		  document.getElementsByName("order_name")[0].value = nameInput.value;
		}
		
		var nameInput = document.getElementById("receiver_tel");
		
		if (nameInput.value !== document.getElementById("receiver_tel")) {
			 
			  document.getElementsByName("receiver_tel")[0].value = nameInput.value;
			}
		</script>

<script>
	var IMP = window.IMP;
	IMP.init("imp77686458");

	var today = new Date();
	var year = today.getFullYear().toString();
	var month = (today.getMonth() + 1).toString().padStart(2, "0"); // 월은 0부터 시작하므로 1을 더해줌
	var day = today.getDate().toString().padStart(2, "0");
	var hours = today.getHours().toString();
	var minutes = today.getMinutes().toString();
	var seconds = today.getSeconds().toString();
	var milliseconds = today.getMilliseconds().toString();
	var makeMerchantUid = year + month + day + hours + minutes + seconds + milliseconds;

	var name = "${sessionScope.ssInfo.user_name}";
	var tp = ${dto.pro_subprice * param.cart_amount + dto.pro_delprice};

	function requestPay() {
		IMP.request_pay({
			pg : "kakaopay", //"html5_inicis",
			pay_method : 'card',
			merchant_uid : "IMP" + makeMerchantUid,
			name : document.getElementById("order_name").value,
			amount : tp,
			buyer_email : 'Iamport@chai.finance',
			buyer_name : 'order_name' ,
			buyer_tel : document.getElementById("receiver_tel").value,
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456'
		}, function(rsp) { // callback
			if (rsp.success) {
				console.log(rsp);
				
				var msg='결제가 완료되었습니다.';
				msg += '고유id:' +rsp.imp_uid;
				msg += '상점거래id:' +rsp.merchant_uid;
				document.test.submit();
				
			} else {
				console.log(rsp);
				console.log(makeMerchantUid);
				
				location.href = "/meomum/proList.do";
			}
		
		alert(msg);
		});
		
	}
</script>

</head>

<body>
	<%@include file="../header.jsp"%>
	<!-- 헤더 이미지 넣을때 css도 가져갈것...  -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h1 class="page-title">주문/결제</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="form-group">
		<form name="test" action="orderTest.do" method="get">
			<h2>구매 상품 정보</h2>
			<c:if test="${empty dto}">
				<div>존재하지 않거나 삭제된 상품입니다.</div>
			</c:if>

			<div>상품번호:${dto.pro_idx}</div>
			<div>
				<div>상품이름:${dto.pro_name}</div>
				<div>
					<img alt="pro_img" src="/meomum/items/${dto.pro_thumb}">
				</div>
			</div>
			<div>상품 가격:<fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.pro_subprice}"/>원</div>
			<div>배송비:<fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.pro_delprice}"/>원</div>
			<div>수량:${param.cart_amount}개</div>
			<div>합계: <fmt:formatNumber type="number" maxFractionDigits="3" value="${(dto.pro_subprice*param.cart_amount)+dto.pro_delprice}"/>원</div>

			<div>
				<h2>배송 정보를 입력해주세요.</h2>
				<h3>계약자 정보</h3>
				<input type="hidden" name="user_idx" value="${sessionScope.ssInfo.user_idx}">
			</div>
			<div>
				<label for="order_name">고객명</label> <input type="text"
					class="form-control" id="order_name" name="order_name"
					value="${sessionScope.ssInfo.user_name}"
					placeholder="이름을 입력해주세요">
			</div>
			<div>
				<label for="receiver_tel">연락처</label> <input type="text"
					class="form-control" id="receiver_tel" name="receiver_tel"
					value="${sessionScope.ssInfo.user_tel}"
					placeholder="연락처 -제외 하고 입력">
			</div>
			<div>
				<label for="order_pcode">우편번호</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" id="order_pcode"
						name="order_pcode" value="${sessionScope.ssInfo.user_pcode}"
						placeholder="우편번호" readonly="readonly" onclick="findaddr()">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button"
							onclick="findaddr()">우편번호 검색</button>
					</div>
				</div>
			</div>
			<div>
				<label for="order_addr">기본주소</label> <input type="text"
					class="form-control" id="order_addr" name="order_addr"
					value="${sessionScope.ssInfo.user_addr}" placeholder="기본주소"
					readonly="readonly">
			</div>
			<div>
				<label for="order_detail">상세주소</label> <input type="text"
					class="form-control" id="order_detail" name="order_detail"
					value="${sessionScope.ssInfo.addr_detail}" placeholder="상세주소">
			</div>
			<div>
				<label for="order_detail">배송 메세지</label> <input type="text"
					class="form-control" id="order_msg" name="order_msg"
					placeholder="배송메세지">
			</div>
			<div>
				<label for="checkbox"> 개인정보이용동의 </label>
				<div class="form-control">
					개인정보 이용동의합니다.<input class="form-check-input" type="checkbox"
						id="checkbox" value="Y" name="ask_tos" class="form-control">
				</div>
			</div>
			<div>
				<label for="using_point">포인트</label> <input type="number"
					name="using_point" value="${0 }" class="form-control">
			</div>
		
			
		</form>
		
		<!-- 결제하기 버튼 생성 -->
			<button onclick="requestPay()">결제하기</button>
			
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>