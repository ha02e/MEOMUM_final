<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>


<head>
<meta charset="UTF-8">
<title></title>
<style>
textarea {
	width: 50%;
	height: 6.25em;
	border: 1px solid black;
	resize: none;
}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- 예약 완료된 시간 비활성화 -->
<script>
$(function() {
	function timeSelect(){
	    
		//시간 선택 버튼 모두 활성화
	    $('#timeA, #timeB, #timeC').prop('disabled', false);
		
	  //컨트롤러로 사용자가 선택한 날짜 전송
	    $.ajax({
	      url: "svcTimeSelect.do",
	      data: {
	        svc_days: $("#svc_days").val()
	      },
	      dataType: 'json',
	      method: "get"
	    }).done(function(data) {
	      console.log(data);
			
	    //컨트롤러에서 전달받은 값이 timeA,B,C와 같으면 버튼 비활성화
	      if (data != null) {
	        for (let i = 0; i < data.times.length; i++) {
	          if (data.times[i] == $("#timeA").val()) {
	            $('#timeA').prop('disabled', true);
	          } else if (data.times[i] == $("#timeB").val()) {
	            $('#timeB').prop('disabled', true);
	          } else {
	            $('#timeC').prop('disabled', true);
	          }
	        }
	      }
	    }).fail(function() {
	      alert('다시 시도해주세요');
	    });
	};

	timeSelect();

	$("#svc_days").change(function(){
		timeSelect();
	});
});
</script>

</head>

<body>
<%@include file="/WEB-INF/views/header.jsp"%>
	<h1>방문 견적 예약</h1>
	<form name="svcForm" action="svcFormSubmit.do" method="post">
	<input type="hidden" name="user_idx" value="${sessionScope.ssInfo.user_idx}">
		<ul>
			<li>거주형태 <select name="svc_type">
					<option value="아파트">아파트</option>
					<option value="빌라">빌라</option>
					<option value="주택">주택</option>
					<option value="복층">복층</option>
					<option value="오피스텔">오피스텔</option>
					<option value="기타">기타</option>
			</select>
			</li>
			
			<li>서비스 영역 
				<input type="checkbox" name="svc_area" value="전체">전체
				<input type="checkbox" name="svc_area" value="주방">주방 
				<input type="checkbox" name="svc_area" value="침실">침실 
				<input type="checkbox" name="svc_area" value="화장실">화장실 
				<input type="checkbox" name="svc_area" value="자녀방">자녀방 
				<input type="checkbox" name="svc_area" value="옷장">옷장 
				<input type="checkbox" name="svc_area" value="기타">기타
			</li>
			
			<li>거주 평수(공급면적) 
				<input type="text" name="svc_py">
			</li>
			
			<li>성함 
				<input type="text" name="user_name">
			</li>
			<li>휴대전화 
				<input type="text" name="user_tel">
			</li>

			<li>지역 
				<input id="user_pcode"  type="text" name="user_pcode" placeholder="우편번호" readonly><br>
				<div onclick="findAddr()">우편번호찾기 </div>
				<input id="user_addr" type="text" name="user_addr" readonly> <br>
  				<input type="text" name="user_detail" placeholder="상세 주소">
			</li>
			
			<li>방문 희망 일자 
				<input id="svc_days" type="date" name="svc_days" onclick="setMinDate()">
			</li>
			
			
			<li>시간 
				<input id="timeA" type="radio" name="svc_time" value="10:00">10:00
				<input id="timeB" type="radio" name="svc_time" value="13:00">13:00
				<input id="timeC" type="radio" name="svc_time" value="16:00">16:00
			</li>
			
			<li>요청사항<br> 
				<textarea name="svc_req" rows="5" cols="35" placeholder="요청사항을 입력해주세요"></textarea>
			</li>
			
			<li>서비스 인지 경로 
				<input type="radio" name="svc_know" value="블로그">블로그
				<input type="radio" name="svc_know" value="인터넷 카페">인터넷 카페 
				<input type="radio" name="svc_know" value="지인추천">지인소개
				<input type="radio" name="svc_know" value="검색">인터넷 검색
				<input type="radio" name="svc_know" value="검색">재이용고객
			</li>
			
			<li>개인정보 수집 및 이용에 대한 안내<br> 
			<textarea row="50" cols="120">
				주식회사 머뭄은 기업/단체 및 개인의 정보 수집 및 이용 등 처리에 있어
				아래의 사항을 관계법령에 따라 고지하고 안내해 드립니다.

				1. 정보수집의 이용 목적 : 상담 및 진행
				2. 수집/이용 항목 : 이름, 연락처, 내용 등
				3. 보유 및 이용기간 : 상담 종료후 6개월, 정보제공자의 삭제 요청시 즉시
				4. 개인정보처리담당 : 전화 1234-5678 / 이메일 ask@meomum.com
			</textarea> <br> 
			<input type="checkbox" name="svc_pia" value="Y">개인정보 수집 및 이용에 동의합니다
			</li>
			<div>
			유의사항! 
			방문 일자 2일 전에는 수정 불가한 점 참고 부탁드립니다.
			피치 못할 사정으로 취소 시, 02-1234-4567로 전화부탁드립니다. 
			</div>
		</ul>
		
		<div>
			<input type="submit" value="예약">
		</div>
	</form>
	
	<!-- 현재 시간보다 이전 시간 선택 불가 제약 -->
	<script>
		var dateElement = document.getElementById('svc_days');
		var now = new Date();
		var date = new Date(now.getTime()+24*60*60*1000 - now.getTimezoneOffset() * 60000).toISOString().split("T")[0];
		dateElement.value = date;
		dateElement.setAttribute("min", date);

		function setMinDate() {
			if (dateElement.value < date) {
				dateElement.value = date;
			}
		}
	</script>
	
	<!-- 카카오 주소 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function findAddr(){
			var width = 500; //팝업의 너비
			var height = 600; //팝업의 높이
	
			new daum.Postcode({
		 		width: width,
		 		height: height,
        		oncomplete: function(data) {
            		var zonecode = data.zonecode;
            		var roadAddr = data.roadAddress; // 도로명 주소 변수
            		var jibunAddr = data.jibunAddress; // 지번 주소 변수

            		document.getElementById('user_pcode').value = zonecode;
            		
            		if(roadAddr !== ''){
                		document.getElementById('user_addr').value = roadAddr;
            		} 
            		else if(jibunAddr !== ''){
                		document.getElementById('user_addr').value = jibunAddr;
            		}
        		}
    		}).open({
        		left: (window.screen.width / 2) - (width / 2),
        		top: (window.screen.height / 2) - (height / 2)
    	});
	}
</script>
<%@include file="/WEB-INF/views/footer.jsp"%>
</body>

</html>