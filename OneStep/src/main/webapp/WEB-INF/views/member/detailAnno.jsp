<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="layout-px-spacing">
	<div class="row layout-spacing layout-top-spacing" id="cancel-row">
		<div class="col-lg-12" style="margin: 0 auto;">
			<div class="">
				<div class="widget-content searchable-container grid">
					<div class="card-box product-details">
						<div class="row w-100">
							<div class="col-xl-12 col-lg-12 align-self-center w-100">
								<a href="/member/main" class="btn btn-sm btn-primary p-1"><i
									class="las la-arrow-left"></i> Back</a>
								<c:if test="${memFlag==false }">
									<button class="btn btn-primary" data-toggle="modal"
										data-target="#exampleModalCenter" style="float: right;">지원하기</button>
								</c:if>
								<c:if test="${memFlag==true }">
									<button class="btn btn-primary" disabled="disabled"
										style="float: right;">이미 지원한 공고</button>
								</c:if>


							</div>
							<div
								class="col-xl-12 col-lg-8 col-md-8 company-detail-container mt-5">
								<div class="d-flex align-items-start">

									<div class="company-info">

										<p class="name mb-1">${anno.annoTitle }</p>
										<a class="text-primary font-12 mb-2 d-block" href="#">${anno.annoContent }</a>
										<div>
											<br> <span class="text-muted strong font-13">정보</span> <br>
											<span class="text-muted"> <fmt:formatDate
													value="${anno.annoStartDate }" pattern="yyyy-MM-dd"
													var="annoStartDate" /> 시작날짜 : ${annoStartDate }
											</span> <span class="text-muted" id="endDate"
												style="margin-left: 30px;"> <fmt:formatDate
													value="${anno.annoEndDate }" pattern="yyyy-MM-dd"
													var="annoEndDate" /> 종료날짜 : ${annoEndDate }
											</span> 
											<div id="endDate" hidden="true">
												<fmt:formatDate value="${anno.annoEndDate}"
													pattern="MM/dd/yyyy hh:mm:ss" />
											</div>
											<div id="remain-time" style="font-size: 20px; float: right;">
												<!-- 남은시간 출력 -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>



					<br>
					<!-- end row -->
					<div class="widget-content searchable-container grid">
						<div class="card-box product-details">
							<div
								class="w-100 animated-underline-content mt-2 details-tab-area">
								<ul class="nav nav-tabs  mb-3" id="lineTab" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										id="underline-specification-tab" data-toggle="tab"
										href="#underline-specification" role="tab"
										aria-controls="underline-specification" aria-selected="false">정보</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										id="underline-reviews-tab" data-toggle="tab"
										href="#underline-reviews" role="tab"
										aria-controls="underline-reviews" aria-selected="false">담당자
											정보</a></li>
									<li class="nav-item"><a class="nav-link"
										id="underline-reviews-tab" data-toggle="tab"
										href="#underline-info" role="tab"
										aria-controls="underline-reviews" aria-selected="false">지원자
											필수 정보</a></li>
									<li class="nav-item"><a class="nav-link"
										id="underline-reviews-tab" data-toggle="tab"
										href="#underline-chart" role="tab"
										aria-controls="underline-reviews" aria-selected="false">지원자
											통계 </a></li>
								</ul>
								<div class="tab-content" id="lineTabContent-3">
									<!-- SPECIFICATION -->
									<div class="tab-pane fade show active"
										id="underline-specification" role="tabpanel"
										aria-labelledby="underline-specification-tab">
										<div class="d-flex flex-wrap p-2">
											<p class="text-muted mb-4">${anno.annoContent }</p>
											<div class="row mb-3 w-100">
												<div class="col-md-4">
													<p class="text-muted strong font-13">상세 정보</p>
													<div>
														<p class="text-muted">
															<i class="lar la-check-circle"></i> 모집 분야 : ${anno.annoMb }
														</p>
														<p class="text-muted">
															<i class="lar la-check-circle"></i> 모집인원 : ${anno.annoMem }
														</p>
														<p class="text-muted">
															<i class="lar la-check-circle"></i>근무환경 : ${anno.annoWork }
														</p>
														<p class="text-muted">
															<i class="lar la-check-circle"></i>수습기간 :
															${anno.annoProbation }
														</p>
													</div>
												</div>
												<div class="col-md-4">
													<p>&nbsp;</p>
													<div>
														<p class="text-muted">
															<i class="lar la-check-circle"></i> 담당업무 : ${anno.annoDm1 }
															${anno.annoDm2 }
														</p>
														<p class="text-muted">
															<i class="lar la-check-circle"></i> 근무부서 : ${anno.annoGb }
														</p>
														<p class="text-muted">
															<i class="lar la-check-circle"></i> 근무요일 : ${anno.annoDay }
														</p>
														<p class="text-muted">
															<i class="lar la-check-circle"></i> 근무시간 :
															${anno.annoTime }
														</p>
													</div>
												</div>
												<div class="col-md-4">
													<p>&nbsp;</p>
													<div>
														<p class="text-muted">
															<i class="lar la-check-circle"></i> 급여 :
															${anno.annoSalary }
														</p>
														<p class="text-muted">
															<i class="lar la-check-circle"></i> 성별 :
															${anno.annoGender }
														</p>
														<p class="text-muted">
															<i class="lar la-check-circle"></i> 고용형태 :
															${anno.annoStaly }
														</p>
													</div>
												</div>
												<div class="col-md-6">
													<div>
														<p class="text-muted">
															<i class="lar la-check-circle"></i>키워드 :
														</p>
														<c:forEach items="${keyword }" var="keyword">
															<span class="text-muted"> ${keyword.annoKwname } </span>
														</c:forEach>
													</div>
												</div>

												<div class="col-md-12" style="margin: 0 auto;">
													<img src="/upload/${anno.attId}" alt=""
														class="img-fluid mx-auto d-block rounded">
												</div>
											</div>
										</div>
									</div>
									<!-- REVIEWS -->
									<div class="tab-pane fade" id="underline-reviews"
										role="tabpanel" aria-labelledby="underline-reviews-tab">
										<div class="row w-100 m-0">
											<div class="accordion" id="accordion2">
												<div class="accordion-group">
													<div class="accordion-heading">
														<a class="accordion-toggle collapsed"
															data-toggle="collapse" data-parent="#accordion2"
															href="#collapseOne"> 담당자 정보 <span class="float-right"><i
																class="las la-angle-down"></i></span>
														</a>
													</div>
													<div id="collapseOne" class="accordion-body collapse show">
														<div class="accordion-inner">
															담당자 이름 : ${anno.annoManager } <br> 담당자 전화번호 :
															${anno.annoTel }<br> 담당자 이메일 : ${anno.annoEmail }
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="underline-info" role="tabpanel"
										aria-labelledby="underline-info-tab">
										<div class="row w-100 m-0">
											<div class="accordion" id="accordion2">
												<div class="accordion-group">
													<div class="accordion-heading">
														<a class="accordion-toggle collapsed "
															data-toggle="collapse" data-parent="#accordion2"
															href="#collapseTwo"> 근무환경 <span class="float-right"><i
																class="las la-angle-down"></i></span>
														</a>
													</div>
													<div id="collapseTwo" class="accordion-body collapse show">
														<div class="accordion-inner">
															근무환경 : ${anno.annoWork } <br> 업종 :
															${anno.industryCode } <br> 지역 : ${anno.annoWd } <br>
															고용형태 : ${anno.annoStaly } <br>
														</div>
													</div>
												</div>
												<div class="accordion-group">
													<div class="accordion-heading">
														<a class="accordion-toggle collapsed "
															data-toggle="collapse" data-parent="#accordion2"
															href="#collapseThree"> 지원자 필수 정보 <span
															class="float-right"><i class="las la-angle-down"></i></span>
														</a>
													</div>
													<div id="collapseThree"
														class="accordion-body collapse show">
														<div class="accordion-inner">
															연령제한 : ${anno.annoAge } <br> 경력 : ${anno.annoCareer }
															<br> 지원조건 : ${anno.annoJo } <br> 우대사항 :
															${anno.annoUd } <br> 성별 : ${anno.annoGender } <br>
															학력 : ${anno.annoStu } <br> 자기소개서 필수항목 :
															${anno.annoIntro }

														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="tab-pane fade" id="underline-chart" role="tabpanel"
										aria-labelledby="underline-reviews-tab">
										<div class="row w-100 m-0">
											<div class="accordion" id="accordion2">
												<div class="accordion-group">
													<div class="accordion-heading">
														<a class="accordion-toggle collapsed"
															data-toggle="collapse" data-parent="#accordion2"
															href="#collapseOne">지원자 통계 <span class="float-right"><i
																class="las la-angle-down"></i></span>
														</a>
													</div>
													<div id="collapseOne" class="accordion-body collapse show">
														<div class="accordion-inner">
															<div style="width: 400px; height: 400px;">
																<!--차트가 그려질 부분-->
																<canvas id="genderChart"></canvas>
															</div>

															<div style="width: 400px; height: 400px;">
																<!--차트가 그려질 부분-->
																<canvas id="ageChart"></canvas>
															</div>

														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered  modal-lg"" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">이력서</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<i class="las la-times"></i>
					</button>
				</div>
				<c:choose>
					<c:when test="${empty resumeList}">
					</c:when>

					<c:otherwise>
						<div class="modal-body" align="center">
							<div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">

								<table class="table" style="table-layout: fixed; width: 100%; ">
									<thead>
										<tr align="center">
											<th width="40%" >이력서 제목</th>
											<th width="20%" >작성일자</th>
											<th width="10%" >보기</th>
											<th width="10%"></th>
										</tr>
									</thead>

									<tbody id="tbody">
										<c:forEach items="${resumeList}" var="resumeList">
											<tr>
												<td style="text-overflow: ellipsis; overflow:hidden; white-space:nowrap; "><c:out value="${resumeList.resumeTitle }" /></td>
												<fmt:parseDate value="${resumeList.resumeInsertDate }" pattern="yyyy-MM-dd" var="start"/> 
												<fmt:formatDate value="${start }" pattern="yyyy-MM-dd" var="startDate"/>
												<td align="right"> <c:out value="${startDate}" /></td>
												<td>
													<button type="button" class="btn btn-soft-info width-xs"
														onclick="window.open('/member/resume/detail?resumeId=${resumeList.resumeId}')">보기</button>
												</td>
												<td>
													<button type="button" class="btn btn-soft-info width-xs"
														onclick="fsubmit('${resumeList.resumeId }')">선택</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>

								</table>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="modal-footer">
					<c:choose>
						<c:when test="${empty resumeList}">
							<a href="/myPage/resume/list" class="btn btn-soft-info width-xs">
								이력서 작성하기 </a>
						</c:when>

						<c:otherwise>
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#exampleModalCenter2">다음으로 넘어가기</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="exampleModalCenter2" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">자기소개서</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<i class="las la-times"></i>
					</button>
				</div>
				<div class="modal-body">
					<div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">

						<table class="table" style="width: 100%">
							<thead>
								<tr>
									<th width="20%">자기소개서 제목</th>
									<th width="20%">작성일자</th>
									<th width="20%"></th>
									<th width="20%">보기</th>
								</tr>
							</thead>

							<tbody id="tbody">
								<c:forEach items="${coverletterList}" var="coverletterList">
									<tr>
										<td><c:out value="${coverletterList.covltrTitle }" /></td>
										<td><c:out value="${coverletterList.covltrInsertDate }" /></td>
										<td>
											<button type="button" class="btn btn-soft-info width-xs"
												onclick="fsubmit2('${coverletterList.covltrId }')">선택</button>
										</td>
										<td>
											<button type="button" class="btn btn-soft-info width-xs"
												onclick="window.open('/member/coverletter/detail?covltrId=${coverletterList.covltrId}')">
												보기</button>

										</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
						<form action="/member/apply" method="post" id="myForm">
							<input type="hidden" value="" id="resumeNum" name="resumeNum">
							<input type="hidden" value="" id="covltrItemId"
								name="covltrItemId"> <input type="hidden"
								value="${anno.annoId }" name="annoId" id="annoId"> <input
								type="hidden" value="${anno.memId }" name="memId" id="memId">
							<input type="hidden" value="${anno.comId }" name="companyId"
								id="companyId">
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<c:if test="${memFlag==false }">
						<button type="button" class="btn btn-primary" id="subBtn">
							지원하기</button>
					</c:if>
					<c:if test="${memFlag==true }">
						<button type="button" disabled="disabled" class="btn btn-primary"
							id="subBtn">이미 지원한 공고</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<script type="text/javascript">
		//var subBtn = $("#subBtn");

		function fsubmit(pVal) {
			$("#resumeNum").val(pVal);

		}
		function fsubmit2(pVal2) {
			$("#covltrItemId").val(pVal2);
		}

		$("#subBtn").on("click", function() {
			$("#myForm").submit();
			alert("지원이 완료 되었습니다!");
		});

		function CountDownTimer(dt, id) {
			var end = new Date(dt);
			var _second = 1000;
			var _minute = _second * 60;
			var _hour = _minute * 60;
			var _day = _hour * 24;
			var timer;
			function showRemaining() {
				var now = new Date();
				var distance = end - now;
				if (distance < 0) {
					clearInterval(timer);
					document.getElementById(id).innerHTML = '마감된 공고';
					return;
				}
				var days = Math.floor(distance / _day);
				var hours = Math.floor((distance % _day) / _hour);
				var minutes = Math.floor((distance % _hour) / _minute);
				var seconds = Math.floor((distance % _minute) / _second);
				document.getElementById(id).innerHTML = days + '일 ';
				document.getElementById(id).innerHTML += hours + '시간 ';
				document.getElementById(id).innerHTML += minutes + '분 ';
				document.getElementById(id).innerHTML += seconds + '초';
			}
			timer = setInterval(showRemaining, 0);
		}
		CountDownTimer($('#endDate').text(), 'remain-time'); // 2020-12-06 오후10시 50분까지

		

		new Chart(document.getElementById("genderChart"), {
		    type: 'pie',
		    data: {
		      labels: ["여성", "남성",],
		      datasets: [{
		        label: "성별지원비율",
		        backgroundColor: ["#3e95cd", "#8e5ea2"],
		        data: [${memCnt[0].femaleCnt},${memCnt[0].maleCnt}]
		      }]
		    },
		    options: {
		      title: {
		        display: true,
		        text: '공고지원자 성별'
		      }
		    } 
		});

		new Chart(document.getElementById("ageChart"), {
		    type: 'horizontalBar',
		    data: {
		      labels: ["25세이하","30대","40대","50대이상"],
		      datasets: [{
		        label: "연령대별 분포",
		        backgroundColor: ["#3e95cd", "#8e5ea2","#e8c3b9","#c45850"],
		        data: [${memCnt[0].twoCnt},${memCnt[0].threeCnt},${memCnt[0].fourCnt},${memCnt[0].fiveCnt}]
		      }]
		    },
		    options: {
		      title: {
		        display: true,
		        text: '공고지원자 연령대별'
		      }
		    }
		});
		
	</script>