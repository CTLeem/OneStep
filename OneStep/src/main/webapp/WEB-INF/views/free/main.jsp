<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<!--  Navbar Starts / Breadcrumb Area  -->
<div class="sub-header-container">
	<header class="header navbar navbar-expand-sm">
		<ul class="navbar-nav flex-row">
			<li>
				<div class="page-header">
					<nav class="breadcrumb-one" aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item active" aria-current="page"><span>프리랜서</span></li>
						</ol>
					</nav>
				</div>
			</li>
		</ul>
		<ul class="navbar-nav d-flex align-center ml-auto right-side-filter">
			<li class="">
				<p class="current-time" id="currentTime"></p>
				<p class="current-date" id="currentDate"></p>
			</li>
		</ul>
	</header>
</div>

<div class="layout-px-spacing">
	<div class="layout-spacing layout-top-spacing">
		<div class="col-md-12">
			<div class="row align-items-center">
				<div class="col-md-4" style="text-align: right;">
					<h1 style="font-family: 'Black Han Sans', sans-serif;">
						당신이 찾던 </h1><br><br>
						<h2 style=" font-family: 'Black Han Sans', sans-serif; color: #4165a7 ;"> 프로젝트 & 프리랜서 </h2>
						<br>
						<h1 style="font-family: 'Black Han Sans', sans-serif;"> 만나는 공간 
					</h1>
					<br> <br> <br> <br> 
					<a class="btn bg-gradient-primary text-white" href="/free/insertFree">프리랜서 등록하기</a>
					<a class="btn bg-gradient-primary text-white" href="/free/projectForm">프로젝트 등록하기</a>
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-7" style="text-align: center;">
					<img
						src="${pageContext.request.contextPath }/resources/assets/img/free.png"
						width="100%" />
				</div>
			</div>
		</div>
	</div>
</div>

<br>
                     <div class="layout-px-spacing">
	<div class="layout-spacing layout-top-spacing">
		<div class="col-md-12" style="background-color: #4165a7; height: 120px; text-align: center;" >
                   <br><br>
                    <h2 style=" font-family: 'Black Han Sans', sans-serif; color: white;"> 
                    	프리랜서 커리어의 시작 , OneStep과 함께 하세요!
                     </h2>
                     </div>
                     </div>
                     </div>
                     <br>
                     <br>

<br><br><br>
<div class="layout-px-spacing">
	<div class="layout-spacing layout-top-spacing">
		<div class="col-12 " style="text-align: center;">
		<h1 style=" font-family: 'Black Han Sans', sans-serif; color: #4165a7 ;"> 프로젝트는 이렇게 진행됩니다 ! </h1>
		<br><br><br><br>
		<img alt="" src="${pageContext.request.contextPath }/resources/assets/img/main2.PNG" width="100%">
		</div>
		</div>
		</div>


<!--                      <div class="layout-px-spacing"> -->
<!-- 	<div class="layout-spacing layout-top-spacing"> -->
<!-- 		<div class="col-md-12" style="border: solid #4165a7; height: 100px; text-align: center; border-radius: 10px"> -->
<!-- 		 <br> -->
<!--                     <h1 style=" font-family: 'Black Han Sans', sans-serif; color: #4165a7;">  -->
<!--                     	어떤 프로젝트를 기획중이세요? -->
<!--                      </h1> -->
<!--                      <br><br> -->
<!--                      </div> -->
<!--                      </div> -->
<!--                      </div> -->
                    

                     
                     
                     
                     
          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
            <div class="widget-chart-one">
              <div class="widget-content overflow-hidden">
                <div class="ticker-wrap">
                  <div class="ticker-heading " style="background-color:#4165a7 ">
                    <p onclick="location.href='/free/notice'">공지사항</p>
                  </div>
                  <div class="ticker">
                  <c:forEach items="${notice}" var="notice">
                    <div class="ticker-item">${notice.boardTitle }</div>
                  </c:forEach>
                  </div>
                </div>
              </div>
            </div>
          </div>
