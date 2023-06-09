<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://plus.unsplash.com/premium_photo-1669686968099-f3a8f355a8cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80)
		no-repeat center;
	background-size: cover;
	margin: 0;
	border-bottom: none;
	padding-bottom: 0px;
}

.page-caption {
	padding: 90px 0px;
	position: relative;
	z-index: 1;
	color: #fff;
	text-align: center;
}


.col-auto {
	margin:0 0 10px 0;
}
.app-content {
	margin: 0 20px;
	padding: 0 20px;
}
.app-card{
	border:1px solid #eeeeee;
}

.card-body a{
	color: var(--p-color) !important;
}
.card-body a:hover{
    color:#FE8A7F !important;
}

.card-title{
	font-size:1.3rem;
}

.reviewThumb{
	position: relative;
	overflow: hidden;
	width: 100%;
	height:240px;
	padding:16px 0;
}
.card-img-top{
	position: absolute;
  	width: 100%;
  	top: 50%; 
  	left: 50%;
  	transform: translate(-50%, -50%);
}


.noreview h5{
	line-height:180px;
}
.review-star i {
    color:#FFD400;
}
</style>

<script>
function deleteReview(reviewIdx) {
  if (confirm("정말로 삭제하시겠습니까?")) {
	location.href = "reviewDel.do?review_idx=" + reviewIdx;
  } else {
	window.close();
  }
}
</script>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp"%> 

<!-- 헤더 이미지 시작 -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">내가 쓴 후기</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 헤더 이미지 끝 -->

<section class="shop spad">
<div class="container">
<div class="row"> 
	<%@include file="../myMenu.jsp"%> 
	<div class="col-xl-9 col-md-9">	
		<!-- ---------- 마이페이지 작업한 파일 페이지 여기에 넣어주세요!!(include) ---------- -->	
		<div class="container-xl">
			<c:if test="${empty lists}">
				<div class="row noreview">
					<div class="card">
					<h5 class="text-center">등록된 후기가 없습니다.</h5>
					</div>
				</div>
			</c:if>
			<div class="row row-cols-1 row-cols-md-2 g-4 mb-5">
				<c:forEach var="dto" items="${lists}">
					<c:url var="contentUrl" value="reviewContent.do">
						<c:param name="review_idx">${dto.review_idx}</c:param>
					</c:url>
					<div class="col">
						<div class="card">
						<div class="reviewThumb">
							<a href="${contentUrl}">
								<c:if test="${not empty dto.thumb}">
									<img class="img-fluid card-img-top" src="/meomum/images/reviewImg/${dto.thumb}" alt="review thumb">
								</c:if>
								<c:if test="${empty dto.thumb}">
									<img class="img-fluid card-img-top" src="/meomum/images/noimage.jpg" alt="no thumb">
								</c:if>
							</a>
						</div>
						<div class="card-body">
							<h4 class="card-title text-truncate"><a href="${contentUrl}">${dto.subject}</a></h4>
							<div class="entry-meta">
								<ul class="d-flex justify-content-between">
									<li class="d-flex align-items-center"><i class="bi bi-person"></i>&nbsp;${dto.writer}</li>
									<li class="d-flex align-items-center review-star">
										<c:forEach var="i" begin="1" end="${dto.star}" step="1">
											<i class="bi bi-star-fill"></i>&nbsp;
										</c:forEach>
					                  	</li>
					                  	<li class="d-flex align-items-center"><i class="bi bi-clock"></i>&nbsp;${dto.writedate}</li>
					                </ul>
							</div>	
						</div>
						<div class="card-footer text-center">
							<input type="hidden" name="review_idx" value="${dto.review_idx}">
							<button class="btn btn-primary btn-sm" onclick="location.href='${contentUrl}'">자세히 보기</button>
							<a href="reviewUpdateForm.do?review_idx=${dto.review_idx}">
								<button class="btn btn-primary btn-sm">수정</button>
							</a>
							<button class="btn btn-danger btn-sm" onclick="deleteReview(${dto.review_idx})">삭제</button>
						</div>
					</div>
              		</div>
				</c:forEach>
				</div>
				
				<div class="container-xl">
					<nav aria-label="Page navigation example">
						<ul class="pagination pagination-sm justify-content-center">
							${pageStr}
						</ul>
					</nav>
				</div>	    
		</div>
		<!-- ---------- 마이페이지 각 페이지 여기에 넣어주세요!! 끝 지점 ---------- -->
	</div>
</div>
		
</div>
</section>

<%@include file="../footer.jsp"%> 

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>