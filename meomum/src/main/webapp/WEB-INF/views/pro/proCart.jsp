<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<title>[사용자] 장바구니 목록</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/proUtil.css">
	<link rel="stylesheet" type="text/css" href="css/proMain.css">
<!--===============================================================================================-->
	
</head>

<body class="animsition">
<%@include file="../header.jsp"%> 

	<!-- Shoping Cart -->
		<form class="bg0 p-t-75 p-b-85" name="cartForm" method="get" action="orderListss.do">
			<div class="container">
				<div class="row">
					<div class="col-lg-10 col-xl-8 m-lr-auto m-b-50">
						<div class="m-l-25 m-r--38 m-lr-0-xl">
							<div class="wrap-table-shopping-cart">
								
								
				<table class="table-shopping-cart" style="text-align:center;">
					
					<tr>
						<td>
							<div class="all_check_input_div table_head">
								<input type="checkbox" class="all_check_input input_size_20" checked="checked">
								<span class="all_chcek_span">전체선택</span>
							</div>
						</td>
					</tr>
					
					<tr class="table_head">
						<th></th>
						<th class="column-1">이미지</th>
						<th class="column-1">상품명</th>
						<th class="column-1">월 가격</th>
						<th class="column-1">개월 수</th>
						<th class="column-1">수량</th>
						<th class="column-1">총 가격</th>
					</tr>
					
					<c:if test="${empty lists }">
						<tr>
							<td colspan="11" rowspan="2" align="center" class="stext-102 cl3 p-t-23">
							담긴 상품이 없습니다
							</td>
						</tr>
					</c:if>
					
				
		
			<c:forEach var="list" items="${lists}">		
					<tr>
						<td class="cart_info_td table_row">
							<input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked" name="cart_idx" value="${list.cart_idx}">		
							<input type="hidden" class="individual_cartamount_input" value="${list.cart_amount }">
							<input type="hidden" class="individual_prosubprice_input" value="${list.pro_subprice }">
							<input type="hidden" class="individual_prodelprice_input" value="${list.pro_delprice }">
						</td>
						
						<td>
							<div>
								<img src="/meomum/images/items/${list.pro_thumb}" alt="IMG-PRODUCT">
							</div>
						</td>
						
						<td>${list.pro_name}</td>
						
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pro_subprice }" />원</td>
						<td>${list.pro_month }개월
						</td>
						
						<td>
							<div class="flex-w m-l-auto m-r-0">
							
							<!-- 마이너스 -->
								<div class="btn-num-product-down">
									<i class="fs-16 zmdi zmdi-minus"></i>
								</div>

							<!-- 수량 조절 -->
								
								<input class="txt-center num-product update_amount_${list.cart_idx}" 
								type="number" min="1" max="10" name="cart_amount"
								value="${list.cart_amount}" id="update_amount_${list.cart_idx}" 
								onchange="updatePrice(this, ${list.pro_subprice}, ${list.pro_allprice})">
								
								
							<!-- 플러스 -->
								<div class="btn-num-product-up">
								  <i class="fs-16 zmdi zmdi-plus"></i>
								</div>
						</div>
						
							<input type="button" onclick="cartNumUpdate(${list.cart_idx}, document.querySelectorAll('.update_amount_${list.cart_idx}')[0].value)" value="수량 변경">
						</td>
						
						
						<td class="column-5">
						<div>월 <span id="subPrice-${list.cart_idx}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.cart_amount * list.pro_subprice}" />원
						</span></div>
    					<div>총 <span id="allPrice-${list.cart_idx}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.cart_amount * list.pro_allprice}" />원</span></div>
						</td>
						
						<!-- 장바구니 삭제 -->
						<td class="column-3">
							 <a href="#" onclick="deleteCartItem(${list.cart_idx})">
								<img src="images/icon/icon-close2.png" alt="DELETE" class="delete-icon">
							</a>
						</td>
					</tr>
					</c:forEach>	
					</table>			
					<div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
						<div class="flex-w flex-m m-r-20 m-tb-5">
							<div class="flex-c-m column-3">월 구독 가격: <span class="totalSub"></span>원 | </div>
							<div class="flex-c-m column-3">총 구매 개수: <span class="totalCount"></span>개 | </div>
							<div class="flex-c-m column-3">총 배송비: <span class="totalDel"></span>원 | </div>
							<div class="flex-c-m column-3">월 구독 가격+총 배송비: <span class="finalTotalPrice"></span>원</div>
						</div>
					</div>
					</div>
					</div>
					</div>
					
					
						<div class="col-sm-9 col-lg-6 col-xl-4 m-lr-auto m-b-50">
							  <div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
							    <h4 class="mtext-109 cl2 p-b-30">
							      Cart Totals
							    </h4>
							    
							   <div class="flex-w flex-t bor12 p-b-13">
							      <div class="size-208">
							        <span class="stext-110 cl2">
							          구독 금액
							        </span>
							      </div>
							      
							      <div class="size-209">
							        <span class="mtext-110 cl2">
							          월 ()원
							        </span>
							      </div>
							    </div>
							    
							    <div class="flex-w flex-t p-t-27 p-b-33 justify-content-center">
							      <div class="size-208">
							        <span class="mtext-101 cl2">
							          배송비
							        </span>
							      </div>
							
							      <div class="size-209 p-t-1">
							        <span class="mtext-110 cl2">
							          (배송비)
							        </span>
							      </div>
							    </div>
							    <input type="hidden" name="totalSub" id="totalSub" >
									<input type="hidden" name="totalCount" id="totalCount" >
									<input type="hidden" name="totalDel" id="totalDel" >
									<input type="hidden" name="finalTotalPrice" id="finalTotalPrice" >	
							    <button class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer"
							    type="submit">
							      구매하기
							    </button>
							  </div>
							</div>
						</div>
					</div>
				</form>
			
				

				
				
<script>
$(document).ready(function() {
	
	setTotalInfo();
	
});


$(".individual_cart_checkbox").on("change", function(){
	//총 주문 정보 세팅
	setTotalInfo($(".cart_info_td"));
});


$(".all_check_input").on("click", function(){
	
	if($(".all_check_input").prop("checked")){
		$(".individual_cart_checkbox").prop('checked',true);
	} else{
		$(".individual_cart_checkbox").prop('checked',false);
	}
	
	setTotalInfo($(".cart_info_td"));
	
});


function setTotalInfo(){
	  let totalSub = 0; // 총 가격 (총 구독 가격)
	  let totalCount = 0; // 총 갯수
	  let totalDel = 0; // 총 배송비
	  let finalTotalPrice = 0; // 최종 가격 (배송비+구독가)

	  $(".cart_info_td").each(function(index, element) {
		  
		if($(element).find(".individual_cart_checkbox").is(":checked")==true){
	    let cart_amount = parseInt($(element).find(".individual_cartamount_input").val());
	    let pro_subprice = parseInt($(element).find(".individual_prosubprice_input").val());
	    let pro_delprice = parseInt($(element).find(".individual_prodelprice_input").val());
	    
	 	totalCount += cart_amount
	    totalSub += cart_amount * pro_subprice;
	    totalDel += cart_amount * pro_delprice;
	    finalTotalPrice = totalSub + totalDel;

	    
		}
	  });
	  
	  // 배송비 출력
	  $(".totalDel").text(totalDel.toLocaleString());
	    $("#totalDel").val(totalDel);

	  // 총 가격 출력
	  $(".totalSub").text(totalSub.toLocaleString());
	   $("#totalSub").val(totalSub);

	  // 총 구매 개수
	  $(".totalCount").text(totalCount.toLocaleString());
	   $("#totalCount").val(totalCount);

	  // 배송비+월 구독 가격
	  $(".finalTotalPrice").text(finalTotalPrice.toLocaleString());
	    $("#finalTotalPrice").val(finalTotalPrice);

}
</script>

<script>
//수량 변경
function cartNumUpdate(update_idx,update_amount) {
	  $.ajax({
	    url: "cartNumUpdate.do",
	    type: "POST",
	    data: {
	      cart_idx: update_idx,
	      cart_amount: update_amount
	    },
	    success: function (response) {
	      alert("수량이 변경되었습니다.");
	      location.reload();
	    },
	    error: function (xhr, status, error) {
	      alert("실패하였습니다. 고객 센터로 연락해 주세요.");
	    },
	  });
	}
</script>

<script>
//장바구니 삭제
  function deleteCartItem(cartIdx) {
    $.ajax({
      url: "cartDelete.do",
      type: "POST",
      data: {cart_idx: cartIdx},
      success: function (data) {
        alert("상품이 삭제되었습니다.");
        location.reload();
      },
      error: function (xhr, status, error) {
        alert("상품 삭제에 실패하였습니다.");
      },
    });
  }
</script>

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->


	<script src="js/main.js"></script>
<%@include file="../footer.jsp"%> 
</body>
</html>