<div align="center">
<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/121777501/244878549-3610cd62-3085-406e-9041-d771465a03c9.png" width="200" >
</div>
 
# MEOMUM 프로젝트
> 머뭄은 사용자가 원하는 방향에 따라 <strong>공간을 컨설턴트</strong> 해주며,<br>가구를 <strong>사지 않고 구독</strong>하여 부담없이 나만의 공간을 채워나가는 고객 맞춤형 서비스를 제공합니다.
https://velog.io/@ha02e/meomumproject

<br>

## 목차
1. [진행기간](#진행기간)
2. [사용 기술](#사용-기술)
3. [주요 기능](#주요-기능)
4. [담당 기능](#담당-기능)
   - [후기](#후기)
   - [재고 관리](#재고-관리)
6. [사이트맵](#사이트맵)
7. [유스케이스](#유스케이스)
8. [ERD 설계](#erd-설계)
9. [화면 구성](#화면-구성)

<br>

## 진행기간
23.03.15 ~ 23.04.16 (총 33일)

<br>

## 사용 기술
<table>
<tr>
 <td align="center">언어</td>
 <td>
  <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">&nbsp
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"/>&nbsp
 </td>
</tr>
<tr>
 <td align="center">프레임워크</td>
 <td>
   <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> &nbsp
</tr>
<tr>
 <td align="center">웹 서버</td>
 <td>
  <img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black"/> &nbsp 
</tr>
<tr>
 <td align="center">데이터베이스</td>
 <td>
  <img src="https://img.shields.io/badge/ORACLE-F80000?style=for-the-badge&logo=oracle&logoColor=white"/>&nbsp
 </td>
</tr>
<tr>
</tr>
<tr>
 <td align="center">빌드도구</td>
 <td>
  <img src="https://img.shields.io/badge/apachemaven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white"/>&nbsp 
 </td>
</tr>
<tr>
 <td align="center">프론트엔드</td>
 <td>
    <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white"/>&nbsp 
    <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white"/>&nbsp 
    <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white"/>
 </td>
</tr>
<tr>
 <td align="center">IDE</td>
 <td>
  <img src="https://img.shields.io/badge/eclipseide-2C2255?style=for-the-badge&logo=eclipseide&logoColor=white"/>&nbsp 
 </td>
</tr>
<tr>
 <td align="center">협업툴</td>
 <td>
    <img src="https://img.shields.io/badge/GitHub-181710?style=for-the-badge&logo=GitHub&logoColor=white"/>&nbsp 
    <img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=Notion&logoColor=white"/>&nbsp 
    <img src="https://img.shields.io/badge/googledrive-4285F4?style=for-the-badge&logo=googledrive&logoColor=white"/>
 </td>
</tr>
</table>

<br> 

## 주요 기능
- **회원가입/로그인**
  - 회원가입 시 이메일 인증 기능
  - 회원가입 시 우편번호 검색 기능(다음 주소 API 활용)
  - 카카오 간편 로그인 기능(카카오 로그인 API 활용)
- **정리 일상**
  - 간단 견적 문의 
  - 방문 상담 예약
  - 관리자 상담 스케줄 관리(Full Calendar API 활용)
- **구독 일상**
  - 가구 장바구니 담기
  - 가구 구독 결제하기(아임포트 API 활용)
  - 가구 재고 관리
- **후기**
  - 후기 글에 사진 첨부 기능(CK 에디터 활용)
<br>

## 담당 기능
|김지섭|남효정|이초은|**이하영**|장수빈|
|:---|:---|:---|:---|:---|
|- 주문/결제 <br>- 공지사항|- 상품관리 <br>- 상품 리스트 <br>- 상품 상세페이지 <br>- 장바구니|- 메인페이지 <br>- 회원가입/로그인 <br>- 간단 견적 문의|**- 후기 게시판 <br>- 재고 관리 <br>- 주문/배송관리 <br>- 구독 반납**|- 방문 견적 문의 <br>- 정리일상 결제 <br>- 통계

### 후기
![후기](https://github.com/ha02e/MEOMUM_final/assets/121777501/b184b0d0-ecd1-4bae-98b4-3e647316d20d)
- 후기는 컨설턴트 서비스 완료 또는 구독 상품 배송 완료 시에 작성 가능하도록 구현했습니다.
- 본인이 작성한 후기는 수정 또는 삭제가 가능합니다.

![리뷰작성하기](https://github.com/ha02e/MEOMUM_final/assets/121777501/d8d833af-c0e2-4015-8f64-d108a6cd1748)
- 사용자가 후기를 작성할 때, 사진과 텍스트를 함께 입력할 수 있도록 **CK Editior**를 사용했습니다.
- 후기 제목과 내용을 작성하고 대표이미지를 첨부할 수 있으며 별점을 선택할 수 있습니다.

<br>

### 재고 관리
![재고관리](https://github.com/ha02e/MEOMUM_final/assets/121777501/b80773e7-6d3f-40b9-96b1-7c7a38777f87)
- 재고 수량이 1개 이하이면 판매 상태는 자동으로 품절로 변경됩니다.
- 판매중에서 품절 상태로 변경되면 수량은 자동으로 1개로 수정됩니다.
- 품절 상태에서는 재고 수량을 2개 이상으로 입력해야만 판매중 상태로 변경됩니다.

<br>

## 사이트맵
![머뭄_사용자_사이트맵](https://github.com/ha02e/MEOMUM_final/assets/121777501/a59d707f-e6a0-456e-bd5c-ceb7b61e6ba0)
![머뭄_관리자_사이트맵](https://github.com/ha02e/MEOMUM_final/assets/121777501/8f3aaeae-3f8e-4246-a0a1-123a44874f73)


<br>

## 유스케이스
![유스케이스](https://github.com/ha02e/MEOMUM_final/assets/121777501/6268140e-6f70-4068-9a25-de523dc2c678)


<br>

## ERD 설계
![meomum_erd](https://github.com/ha02e/MEOMUM_final/assets/121777501/2b4c7444-321a-4b74-8197-3031436f3248)
- 총 18개의 테이블 생성
<br>

## 화면 구성
|메인|후기|
|:---:|:---:|
|<img src="https://user-images.githubusercontent.com/121777501/232715248-5e492968-5ede-42d1-b52c-1836e25621d8.png" width="400px" />|<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/121777501/244401523-f24a3abf-0233-49b1-b029-8f213bed68a6.png" width="400px" />|
|정리일상|구독일상|
|<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/121777501/244398990-d958ba1b-3c48-4aa6-8096-fe3a37cf9d4f.png" width="400px" />|<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/121777501/244399275-237819da-b3d0-41b1-8835-65ce9856035e.png" width="400px" />| 
|로그인|관리자페이지|
|<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/121777501/244402554-062ea8de-8d45-420a-a4e6-740b5b072556.png" width="400px" />|<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/121777501/244401160-cf046e08-328b-4e24-aaf8-c554835ff2bb.png" width="400px" />
