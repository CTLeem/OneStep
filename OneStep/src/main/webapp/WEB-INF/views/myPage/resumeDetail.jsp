<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
/* #pdfArea { */
/*   font-size: 18px; */
/* } */
</style>
<div id="pdfArea">
<form action="/pdfDownload" method="post">
<div class="sub-header-container">
	<header class="header navbar navbar-expand-sm">
		<ul class="navbar-nav flex-row">
			<li>
				<div class="page-header">
					<nav class="breadcrumb-one" aria-label="breadcrumb">
						<ol class="breadcrumb">
							<h4  id="item-1"></h4>
							<li class="breadcrumb-item active" aria-current="page"><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${resume.resumeTitle } &nbsp&nbsp&nbsp</span></li>
	                       	<button type="button" class="btn btn-success btn-rounded" onclick="saveImage()" id="pdfExport">PDF로 다운로드</button>
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
<!--  Navbar Ends / Breadcrumb Area  -->


<div class="layout-px-spacing" data-spy="scroll">
    <div class="layout-top-spacing mb-2">
        <div class="col-md-12">
            <div class="row">
                <div class="container p-0">
                    <div class="row layout-top-spacing">
                        <div class="col-lg-9 layout-spacing">
                        	<div class="row">
                        		<div class="col-9">
		                        	<h4>${member.memName }</h4>
                        		</div>
                        	</div>
                        	<br>
                        	<div class="row">
                        		<div class="col-lg-10">
                        			<div class="row">
						    			<div class="col-lg-4">
							    			<label>성별:</label>
							    			<c:if test="${member.memGender == 'male' }">남자</c:if>
						    				<c:if test="${member.memGender == 'female'}">여자</c:if>
										</div>
						    			<div class="col-lg-4">
							    			<label>생년월일:</label>
											<fmt:formatDate value="${member.memBirth}" pattern="yyyy-MM-dd"/>
										</div>
						    		</div>
						    		<br>
						    		<div class="row">
						    			<div class="col-lg-4">
							    			<label>연락처:</label>
											${member.memTel}
										</div>
						    			<div class="col-lg-4">
							    			<label>이메일:</label>
											${member.memEmail}
										</div>
										<div class="col-lg-4">
							    			<label>주소:</label>
											${member.memAddr1} ${member.memAddr2}
										</div>
						    		</div>
						    	</div>	
						    	<div class="col-lg-2">
						    		​<picture>
										<source srcset="/upload/${resume.resumePhoto }" type="image/svg+xml">
										<img src="/upload/${resume.resumePhoto }" class="img-fluid img-thumbnail" alt="사진">
									</picture>
						    	</div>
							</div>
							<br>
							
                    	
                    		<h4  id="item-2"></h4>
							<div class="w-100 animated-underline-content mt-2 details-tab-area" >
	                        	<ul class="nav nav-tabs  mb-3" id="lineTab" role="tablist">
	                            	<li class="nav-item">
	                                	<a class="nav-link active" id="underline-specification-tab" data-toggle="tab" href="#underline-specification" role="tab" aria-controls="underline-specification" aria-selected="false">학력</a>
	                           		</li>
	                        	</ul>
	                        	<div class="tab-content" id="lineTabContent-3">
									<div class="tab-pane fade show active" id="underline-specification" role="tabpanel" aria-labelledby="underline-specification-tab">
										<c:forEach items="${resume.eduList }" var="eduList">
	                                   		<div class="d-flex flex-wrap p-2">
	                                    		<p class="text-muted strong mb-4">${eduList.eduSchoolName } ${eduList.eduMajor1 }</p>
	                                			<div class="row mb-3 w-100">
		                                        	<div class="col-md-4">
		                                            	<div>
		                                               		<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>	학교구분:
		                                                   		<c:if test="${eduList.eduSchoolType == '1'}">고등학교</c:if>
		                                                    	<c:if test="${eduList.eduSchoolType == '2'}">대학교(2,3년)</c:if>
		                                                    	<c:if test="${eduList.eduSchoolType == '3'}">대학교(4년)</c:if>
		                                                    	<c:if test="${eduList.eduSchoolType == '4'}">대학원</c:if>
		                                                	</p>
		                                            	</div>
		                                            	<div>
		                                               		<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>	입학일: ${eduList.eduStart } </p>
		                                            	</div>
													</div>
		                                        	<div class="col-md-4">
		                                            	<div>
		                                               		<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>	학점: ${resume.eduList[0].eduScore } / 
		                                                       <c:if test="${eduList.eduScoreStandard == 1 }">4.5</c:if>
		                                                       <c:if test="${eduList.eduScoreStandard == 2 }">4.3</c:if>
		                                                       <c:if test="${eduList.eduScoreStandard == 3 }">4.0</c:if>
		                                                       <c:if test="${eduList.eduScoreStandard == 4 }">100</c:if>
		                                                   </p>
		                                            	</div>
		                                            	<div>
		                                               		<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>	졸업일: ${eduList.eduEnd } </p>
		                                         		</div>
		                                   			</div>
		                              				<div class="col-md-4">
		                                      			<div>
			                                      			<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>	학적상태: 
			                                             		<c:if test="${eduList.eduStatus == '1'}">졸업</c:if>
			                                   					<c:if test="${eduList.eduStatus == '2'}">졸업예정</c:if>
																<c:if test="${eduList.eduStatus == '3'}">재학 중</c:if>
																<c:if test="${eduList.eduStatus == '4'}">중퇴</c:if>
																<c:if test="${eduList.eduStatus == '5'}">수료</c:if>
																<c:if test="${eduList.eduStatus == '6'}">휴학</c:if>
			                                            	</p>
		                                   				</div>
		                                      		</div>
		                      					</div>
                      						</div>         
             							</c:forEach>
									</div>
		           				</div>
		        			</div>	
							<br>
                    	
                    	
                    	
                    		<h4  id="item-3"></h4>
	                    	<div class="w-100 animated-underline-content mt-2 details-tab-area">
	                           <ul class="nav nav-tabs  mb-3" id="lineTab" role="tablist">
	                               <li class="nav-item">
	                                   <a class="nav-link active" id="underline-specification-tab" data-toggle="tab" href="#underline-specification" role="tab" aria-controls="underline-specification" aria-selected="false">희망 직무</a>
	                               </li>
	                           </ul>
	                           <div class="tab-content" id="lineTabContent-3">
	                               <div class="tab-pane fade show active" id="underline-specification" role="tabpanel" aria-labelledby="underline-specification-tab">
	                                   <div class="d-flex flex-wrap p-2">
	                                       <p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>	${resume.workfieldList[0].workfield1 }	</p>
<%-- 	                                       <p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>	${resume.workfieldList[1].workfield1 } </p> --%>
	                                   </div>         
	                               </div>
		           				</div>
		           			</div>	
							<br>
                    	
                    		<h4  id="item-4"></h4>
	                    	<div class="w-100 animated-underline-content mt-2 details-tab-area">
								<ul class="nav nav-tabs  mb-3" id="lineTab" role="tablist">
								    <li class="nav-item">
								        <a class="nav-link active" id="underline-specification-tab" data-toggle="tab" href="#underline-specification" role="tab" aria-controls="underline-specification" aria-selected="false">스킬</a>
								    </li>
								</ul>
								<div class="tab-content" id="lineTabContent-3">
								    <div class="tab-pane fade show active" id="underline-specification" role="tabpanel" aria-labelledby="underline-specification-tab">
                                 		<div class="d-flex flex-wrap p-2">
	                                   		<c:forEach items="${resume.skillList }" var="skill">
												<p class="text-muted mb-5"><i class="fas fa-dot-circle fa-xs"></i>${skill.skillName} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
	                                   		</c:forEach>
	                                  	</div>         
	                           		</div>
		           				</div>
		           			</div>	
							<br>
							
							<h4  id="item-5"></h4>
	                    	<div class="w-100 animated-underline-content mt-2 details-tab-area">
	                        	<ul class="nav nav-tabs  mb-3" id="lineTab" role="tablist">
	                        		<li class="nav-item">
	                   					<a class="nav-link active" id="underline-specification-tab" data-toggle="tab" href="#underline-specification" role="tab" aria-controls="underline-specification" aria-selected="false">경력</a>
	                           		</li>
	                       		</ul>
	                  			<div class="tab-content" id="lineTabContent-3">
									<div class="tab-pane fade show active" id="underline-specification" role="tabpanel" aria-labelledby="underline-specification-tab">
									    <div class="d-flex flex-wrap p-2">
									        <p class="text-muted strong mb-4">	${resume.careerList[0].careerCmpName } (<c:if test="${resume.careerList[0].careerResignDate == null}" >${resume.careerList[0].careerJoinDate}" ~ 재직 중</c:if>
		                                               	${resume.careerList[0].careerJoinDate} ~ ${resume.careerList[0].careerResignDate})</p>
									        <div class="row mb-3 w-100">
									            <div class="col-md-4">
<!-- 	                                            	<p class="text-muted font-13"> -->
<%-- 		                                          		<c:if test="${resume.careerList[0].careerResignDate == null}" >${resume.careerList[0].careerJoinDate}" ~ 재직 중</c:if> --%>
<%-- 		                                               	${resume.careerList[0].careerJoinDate} ~ ${resume.careerList[0].careerResignDate} --%>
<!-- 	                                   				</p> -->
													<div>
													    <p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> 부서: ${resume.careerList[0].careerCmpDprtm }</p>
														<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> 연봉: ${resume.careerList[0].careerSalary }만 원</p>
													</div>
	                                         	</div>
	                                        	<div class="col-md-4">
                                            		<div>
	                                       				<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> 직급: ${resume.careerList[0].careerPosition }</p>
	                                           		</div>
	                                 			</div>
	                                        	<div class="col-md-4">
	                                          		<div>
	                                                	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> 담당 직무: ${resume.careerList[0].careerWorkfield }</p>
                                         			</div>
	                                        	</div>
	                                		</div>
	                                		<div class="row">
	                                			<div class="col-12">
	                                			
		                                        	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> 업무 상세: ${resume.careerList[0].careerDuties }</p>
	                                			</div>
	                                		</div>
	                            		</div>         
	                            	</div>
		           				</div>
		           			</div>	
							<br>
                    	
                    		<h4  id="item-6"></h4>
	                    	<div class="w-100 animated-underline-content mt-2 details-tab-area">
	                        	<ul class="nav nav-tabs  mb-3" id="lineTab" role="tablist">
	                         		<li class="nav-item">
	                         			<a class="nav-link active" id="underline-specification-tab" data-toggle="tab" href="#underline-specification" role="tab" aria-controls="underline-specification" aria-selected="false">자격증</a>
	                             	</li>
	                         	</ul>
	                     		<div class="tab-content" id="lineTabContent-3">
	                          		<div class="tab-pane fade show active" id="underline-specification" role="tabpanel" aria-labelledby="underline-specification-tab">
	                                	<div class="d-flex flex-wrap p-2">
	                                   		<div class="row mb-3 w-100">
	                                        	<div class="col-md-4">
	                                            	<p class="text-muted strong font-13">${resume.certList[0].certName }</p>
	                                              	<div>
	                                                	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.certList[0].certDate }</p>
	                                                	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.certList[0].certInstitution }</p>
	                                            	</div>
	                                       		</div>
	                                       		<div class="col-md-4">
	                                      			<p class="text-muted strong font-13">${resume.certList[1].certName }컴퓨터활용능력 1급</p>
	                                        		<div>
	                                                 	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>${resume.certList[1].certDate }2023.05.</p>
	                                                	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.certList[1].certInstitution }대한상공회의소</p>
	                                             	</div>
	                                        	</div>
	                                      		<div class="col-md-4">
	                                              	<p class="text-muted strong font-13">${resume.certList[2].certName }한국사능력검정시험</p>
	                                              	<div>
	                                                	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>${resume.certList[1].certDate }2023.05.</p>
	                                                	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.certList[2].certInstitution }국사편찬위원회</p>
	                                              	</div>
	                                         	</div>
	                                		</div>
	                                 	</div>         
	                            	</div>
		           				</div>
		           			</div>	
							<br>
                    	
                    		<c:if test="${resume.langList[0].langName != null }">
                    		<h4  id="item-7"></h4>
	                    	<div class="w-100 animated-underline-content mt-2 details-tab-area">
	                        	<ul class="nav nav-tabs  mb-3" id="lineTab" role="tablist">
	                            	<li class="nav-item">
	                               		<a class="nav-link active" id="underline-specification-tab" data-toggle="tab" href="#underline-specification" role="tab" aria-controls="underline-specification" aria-selected="false">어학</a>
	                             	</li>
	                        	</ul>
	                       		<div class="tab-content" id="lineTabContent-3">
	                             	<div class="tab-pane fade show active" id="underline-specification" role="tabpanel" aria-labelledby="underline-specification-tab">
	                                  	<div class="d-flex flex-wrap p-2">
	                                       	<p class="text-muted mb-4">
												<c:if test="${resume.langList[0].langName == 1 }">영  어</c:if>
												<c:if test="${resume.langList[0].langName == 2 }">일본어</c:if>
												<c:if test="${resume.langList[0].langName == 3 }">중국어</c:if>
	                                     	</p>
	                                		<div class="row mb-3 w-100">
	                                       		<div class="col-md-4">
	                                           		<p class="text-muted strong font-13">${resume.langList[0].langTestName }</p>
	                                        		<div>
	                                                	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.langList[0].langTestDate } </p>
	                                               	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.langList[0].langTestScore }점</p>
	                                           		</div>
	                                    		</div>
	                                        	<div class="col-md-4">
	                                            	<p class="text-muted strong font-13">${resume.langList[1].langTestName }TOEIC Speaking</p>
	                                           		<div>
														<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.langList[0].langTestDate } ~ 2023-04-17 </p>
														<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.langList[1].langTestScore }level 8 </p>
													</div>
	                                 			</div>    
	                                       		<div class="col-md-4">
	                                            	<p class="text-muted strong font-13">${resume.langList[2].langTestName }TOEFL</p>
	                                            	<div>
	                                                	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.langList[0].langTestDate } ~ 2023-04-17</p>
	                                                	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.langList[2].langTestScore }120점</p>
	                                          		</div>
	                                       		</div>
	                                    	</div>
	                                 	</div>
	                            	</div>
	                            	
	                                        
	                              	<div class="tab-pane fade show active" id="underline-specification" role="tabpanel" aria-labelledby="underline-specification-tab">
	                              		<div class="d-flex flex-wrap p-2">
	                                     	<p class="text-muted mb-4">중국어
	                                       		<c:if test="${resume.langList[1].langName == 1 }">영어</c:if>
	                                       		<c:if test="${resume.langList[1].langName == 2 }">일본어</c:if>
	                                         	<c:if test="${resume.langList[1].langName == 3 }">중국어</c:if>
	                                      	</p>	                                       <div class="row mb-3 w-100">
	                                       	 	<div class="col-md-4">
	                                             	<p class="text-muted strong font-13">${resume.langList[3].langTestName }HSK</p>
	                                            	<div>
	                                                	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.langList[3].langTestDate } 2023-04-17 </p>
	                                                	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.langList[3].langTestScore }6급 / 260점</p>
	                                           		</div>
	                                        	</div>
	                                  		</div>
	                                 	</div>         
	                           		</div>
	           					</div>
		           			</div>	
							<br>
                    	
                    	
                    		<c:if test="${resume.activityList[0].actCategory != null }">
                    			
                    		<h4  id="item-8"></h4>
                    		<div class="w-100 animated-underline-content mt-2 details-tab-area">
	                        	<ul class="nav nav-tabs  mb-3" id="lineTab" role="tablist">
	                              	<li class="nav-item">
	                                  	<a class="nav-link active" id="underline-specification-tab" data-toggle="tab" href="#underline-specification" role="tab" aria-controls="underline-specification" aria-selected="false">인턴 · 대외활동</a>
	                            	</li>
	                          	</ul>
	                         	<div class="tab-content" id="lineTabContent-3">
	                              	<div class="tab-pane fade show active" id="underline-specification" role="tabpanel" aria-labelledby="underline-specification-tab">
	                                 	<div class="d-flex flex-wrap p-2">
	                                     	<div class="row mb-3 w-100">
	                                        	<div class="col-md-4">
	                                           		<p class="text-muted strong font-13">
														<c:if test="${resume.activityList[0].actCategory == 1}">인턴&nbsp</c:if>
														<c:if test="${resume.activityList[0].actCategory == 2}">아르바이트&nbsp</c:if>
														<c:if test="${resume.activityList[0].actCategory == 3}">동아리&nbsp</c:if>
														<c:if test="${resume.activityList[0].actCategory == 4}">자원봉사&nbsp</c:if>
														<c:if test="${resume.activityList[0].actCategory == 5}">사회활동&nbsp</c:if>
														<c:if test="${resume.activityList[0].actCategory == 6}">교내활동&nbsp</c:if>
	                                              	</p>
	                                              	<div>
	                                               	  	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> 기관명: ${resume.activityList[0].actInstitution } </p>
	                                                  	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.activityList[0].actStart } ~ ${resume.activityList[0].actEnd } </p>
	                                                  	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.activityList[0].actContent }</p>
	                                            	</div>
	                                       		</div>
	                                       		<div class="col-md-4">
	                                          		<p class="text-muted strong font-13">
														<c:if test="${resume.activityList[1].actCategory == 1}">인턴&nbsp</c:if>
														<c:if test="${resume.activityList[1].actCategory == 2}">아르바이트&nbsp</c:if>
														<c:if test="${resume.activityList[1].actCategory == 3}">동아리&nbsp</c:if>
														<c:if test="${resume.activityList[1].actCategory == 4}">자원봉사&nbsp</c:if>
														<c:if test="${resume.activityList[1].actCategory == 5}">사회활동&nbsp</c:if>
														<c:if test="${resume.activityList[1].actCategory == 6}">교내활동&nbsp</c:if>
	                                           		</p>
	                                              	<div>
	                                                  	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> 기관명: ${resume.activityList[1].actInstitution } </p>
	                                                  	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.activityList[1].actStart } ~ ${resume.activityList[1].actEnd } </p>
	                                                 	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.activityList[1].actContent }</p>
	                                           		</div>
	                                          	</div>    
	                                     		<div class="col-md-4">
	                                          		<p class="text-muted strong font-13">
														<c:if test="${resume.activityList[2].actCategory == 1}">인턴&nbsp</c:if>
														<c:if test="${resume.activityList[2].actCategory == 2}">아르바이트&nbsp</c:if>
														<c:if test="${resume.activityList[2].actCategory == 3}">동아리&nbsp</c:if>
														<c:if test="${resume.activityList[2].actCategory == 4}">자원봉사&nbsp</c:if>
														<c:if test="${resume.activityList[2].actCategory == 5}">사회활동&nbsp</c:if>
														<c:if test="${resume.activityList[2].actCategory == 6}">교내활동&nbsp</c:if>
	                                           		</p>
	                                            	<div>
	                                                	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> 기관명: ${resume.activityList[2].actInstitution } </p>
	                                                 	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.activityList[2].actStart } ~ ${resume.activityList[2].actEnd } </p>
	                                                 	<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> ${resume.activityList[2].actContent }</p>
	                                              	</div>
	                                         	</div>
	                                    	</div>
	                                  	</div>
	                              	</div>
	                        	</div>
	                    	</div>           
                    		</c:if>
                    		
	                        
	                        <h4  id="item-9"></h4>
	                    	<div class="w-100 animated-underline-content mt-2 details-tab-area">
                    			<ul class="nav nav-tabs  mb-3" id="lineTab" role="tablist">
								    <li class="nav-item">
								        <a class="nav-link active" id="underline-specification-tab" data-toggle="tab" href="#underline-specification" role="tab" aria-controls="underline-specification" aria-selected="false">포트폴리오</a>
								    </li>
								</ul>
								<div class="tab-content" id="lineTabContent-3">
								    <div class="tab-pane fade show active" id="underline-specification" role="tabpanel" aria-labelledby="underline-specification-tab">
								        <div class="d-flex flex-wrap p-2">
								            <div class="row mb-3 w-100">
								                <div class="col-md-8">
								                    <div>
								                        <p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> 포트폴리오 URL	│	<a href="${resume.portfolioList[0].portfolioUrl }">${resume.portfolioList[0].portfolioUrl }</a></p>
								                        <p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> 첨부파일	│	</p>
								                        <div class="file doc">
								                                <i class="lar la-file-word file-icon"></i>
								                                <div>
								                                    <p class="main-title">포트폴리오 1</p>
								                                    <p class="sub-title">마지막 수정</p>
								                                    <p class="date">2023-04-17</p>
								                                </div>
								                            </div>
								                            
								                    </div>
								                </div>
								                
								            </div>
								        </div>         
								    </div>
		           				</div>
		           			</div>	
							<br>
	                        
	                        <h4  id="item-10"></h4>
	                    	<div class="w-100 animated-underline-content mt-2 details-tab-area">
								<ul class="nav nav-tabs  mb-3" id="lineTab" role="tablist">
								    <li class="nav-item">
								        <a class="nav-link active" id="underline-specification-tab" data-toggle="tab" href="#underline-specification" role="tab" aria-controls="underline-specification" aria-selected="false">희망근무조건</a>
								    </li>
								</ul>
								<div class="tab-content" id="lineTabContent-3">
								    <div class="tab-pane fade show active" id="underline-specification" role="tabpanel" aria-labelledby="underline-specification-tab">
								        <div class="d-flex flex-wrap p-2">
								            <div class="row mb-3 w-100">
								                <div class="col-md-8">
								                    <div>
								                        <p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> 고용 형태	│	
								                        		<c:if test="${resume.desiredList[0].desiredEmplForm == 1 }">
								                        			정규직
								                        		</c:if>
								                        		<c:if test="${resume.desiredList[0].desiredEmplForm == 2 }">
								                        			계약직
								                        		</c:if>
								                        		<c:if test="${resume.desiredList[0].desiredEmplForm == 3 }">
								                        			병역특례
								                        		</c:if>
								                        		<c:if test="${resume.desiredList[0].desiredEmplForm == 4 }">
								                        			프리랜서
								                        		</c:if>
								                        		<c:if test="${resume.desiredList[0].desiredEmplForm == 5 }">
								                        			헤드헌팅
								                        		</c:if>
								                        		<c:if test="${resume.desiredList[0].desiredEmplForm == 6 }">
								                        			파견대행
								                        		</c:if>
								                        		<c:if test="${resume.desiredList[0].desiredEmplForm == 7 }">
								                        			인턴직
								                        		</c:if>
								                        </p>
								                        <p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> 희망근무지	│	${resume.desiredList[0].desiredCity1 }&nbsp;&nbsp;${resume.desiredList[0].desiredCity2 }&nbsp;</p>
								                        <p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> 희망연봉		│	${resume.desiredList[0].desiredSalary }만 원</p>
								                        <p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i> 지원 분야		│	${resume.desiredList[0].desiredIndustry1 }&nbsp;&nbsp;${resume.desiredList[0].desiredIndustry2 }&nbsp;&nbsp;${resume.desiredList[0].desiredIndustry3}</p>
								                    </div>
								                </div>
	                                           
	                                       </div>
	                             		</div>         
	                    			</div>
		           				</div>
		           			</div>	
							<br>
                        
                        	<h4  id="item-11"></h4>
	                    	<div class="w-100 animated-underline-content mt-2 details-tab-area">
								<ul class="nav nav-tabs  mb-3" id="lineTab" role="tablist">
								    <li class="nav-item">
								        <a class="nav-link active" id="underline-specification-tab" data-toggle="tab" href="#underline-specification" role="tab" aria-controls="underline-specification" aria-selected="false">취업우대 · 병역</a>
								    </li>
								</ul>
								<div class="tab-content" id="lineTabContent-3">
								    <div class="tab-pane fade show active" id="underline-specification" role="tabpanel" aria-labelledby="underline-specification-tab">
								        <div class="d-flex flex-wrap p-2">
								            <div class="row mb-3 w-100">
								                <div class="col-md-8">
								                    <div>
							                   			<c:if test="${resume.prfrnList[0].prfrnVeterans != null}">
							                   				<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>	보훈 대상</a></p>
							                   			</c:if>
							                   			<c:if test="${resume.prfrnList[0].prfrnProtection != null}">
							                   				<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>	취업보호 대상</a></p>
							                   			</c:if>
							                   			<c:if test="${resume.prfrnList[0].prfrnSubsidy != null}">
							                   				<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>	고용지원금 대상</a></p>
							                   			</c:if>
							                   			<c:if test="${resume.prfrnList[0].prfrnDisability != null}">
							                   				<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>	장애 등급	│	
							                   					<c:if test="${resume.prfrnList[0].prfrnDisabilityGrade == 1}" >중증</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnDisabilityGrade == 2}" >경증</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnDisabilityGrade == 3}" >1급</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnDisabilityGrade == 4}" >2급</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnDisabilityGrade == 5}" >3급</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnDisabilityGrade == 6}" >4급</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnDisabilityGrade == 7}" >5급</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnDisabilityGrade == 8}" >6급</c:if>
							                   				</p>
							                   			</c:if>
							                   			<c:if test="${resume.prfrnList[0].prfrnMilitary != null}">
							                   				<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>	병역 구분	│	
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryType == 1}" >군필</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryType == 2}" >미필</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryType == 3}" >면제</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryType == 4}" >해당없음</c:if>
							                   				</p>
							                   				<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>	입대일	│	${resume.prfrnList[0].prfrnMilitaryStart }</p>
							                   				<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>	제대일	│	${resume.prfrnList[0].prfrnMilitaryEnd }</p>
							                   				<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>	군별	│	
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryBranch == 1}" >육군</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryBranch == 2}" >해군</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryBranch == 3}" >공군</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryBranch == 4}" >해병</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryBranch == 5}" >전경</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryBranch == 6}" >의경</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryBranch == 7}" >공익</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryBranch == 8}" >기타</c:if>
							                   				</p>
							                   				<p class="text-muted"><i class="fas fa-dot-circle fa-xs"></i>	제대계급	│	
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 1}" >이병</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 2}" >일병</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 3}" >상병</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 4}" >병장</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 5}" >하사</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 6}" >중사</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 7}" >상사</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 8}" >원사</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 9}" >준위</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 10}" >소위</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 11}" >중위</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 12}" >대위</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 13}" >소령</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 14}" >중령</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 15}" >대령</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 16}" >준장</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 17}" >소장</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 18}" >중장</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 19}" >대장</c:if>
							                   					<c:if test="${resume.prfrnList[0].prfrnMilitaryRank == 20}" >기타</c:if>
							                   				</p>
							                   			</c:if>
								                    </div>
								                </div>
								            </div>
								        </div>         
								    </div>
		           				</div>
		           			</div>	
							<br>
   	                	</div>
   	                   
                        <!-- 이력서 보기 사이드바 시작 -->
                        <div class="col-lg-3 layout-spacing" id="scroll">
                        	<!-- ONGOING TASK -->
		                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing" style="position:sticky; top:77px;" >
		                    	<div class="widget widget-three add-project">
		                            <div class="widget-heading mb-0">
		                                <h5>이력서 항목</h5>
		                            </div>
		                            <br><br>
		                           <div class="track-order-list">
                                        <ul class="list-unstyled">
                                            <li class="completed">
                                                <span class="active-dot dot"></span>
                                                <h6 class="mt-0 mb-1 font-13"><a class="nav-link active" href="#item-1">인적사항</a></h6>
                                            </li>
                                            <li class="completed">
                                                <h6 class="mt-0 mb-1 font-13"><a class="nav-link" href="#item-2">학력</a></h6>
                                            </li>
                                            <li class="completed">
                                                <h6 class="mt-0 mb-1 font-13"><a class="nav-link" href="#item-3">희망직무</a></h6>
                                            </li>
                                            <li class="completed">
                                                <h6 class="mt-0 mb-1 font-13"><a class="nav-link" href="#item-4">스킬</a></h6>
                                            </li>
                                            <li class="completed">
                                                <h6 class="mt-0 mb-1 font-13"><a class="nav-link" href="#item-5">경력</a></h6>
                                            </li>
                                            <li class="completed">
                                                <h6 class="mt-0 mb-1 font-13"><a class="nav-link" href="#item-6">자격증</a></h6>
                                            </li>
                                            <li class="completed">
                                                <h6 class="mt-0 mb-1 font-13"><a class="nav-link" href="#item-7">어학</a></h6>
                                            </li>
                                            <li class="completed">
                                                <h6 class="mt-0 mb-1 font-13"><a class="nav-link" href="#item-8">인턴 · 대외활동</a></h6>
                                            </li>
                                            <li class="completed">
                                                <h6 class="mt-0 mb-1 font-13"><a class="nav-link" href="#item-9">포트폴리오</a></h6>
                                            </li>
                                            <li class="completed">
                                                <h6 class="mt-0 mb-1 font-13"><a class="nav-link" href="#item-10">희망근무조건</a></h6>
                                            </li>
                                            <li class="completed">
                                                <h6 class="mt-0 mb-1 font-13"><a class="nav-link" href="#item-11">취업우대 · 병역</a></h6>
                                            </li>
                                        </ul>
                                    </div>
		                       </div>
			                   <div class="button-list"></br>
			                   		<c:if test="${sessionScope.memberVO.memId eq member.memId}">
				                       <button type="button" id="btnList" class="btn btn-outline-primary" style="width:100%;">이력서 목록</button><br><br>
				                       <button type="button" id="btnDelete" class="btn btn-outline-danger" style="width:100%;">이력서 삭제</button><br><br>
				                       <button type="button" id="btnModify" class="btn btn-primary" style="width:100%;">이력서 수정</button><br>
			                  		</c:if>
			                   </div>
			               </div>
		                   <!-- ONGOING TASK ENDS-->
                        </div>
                        <!-- 이력서 보기 항목 사이드바 끝 -->
					</div>	
				</div>	
			</div>	
		</div>	
	</div>	
</div>	
</form>
<form method="post" action="/myPage/resume/delete" id="delForm">
    <input type="hidden" name="resumeId" value="${resume.resumeId }"/>
</form>
</div>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script>
$(function() {
	var btnModify = $("#btnModify");
	var btnDelete = $("#btnDelete");
	var btnList = $("#btnList");
	var delForm = $("#delForm");
	
	btnModify.on("click", function() {
		delForm.attr("action", "/myPage/resume/modify");
		delForm.attr("method", "get");
		delForm.submit();
	});
	
	btnDelete.on("click", function() {
		if (confirm("정말 삭제하시겠습니까?")) {
			delForm.submit();
		} else {
			delForm.reset();
		}
	});
	
	btnList.on("click", function() {
		location.href="/myPage/resume/list";
	});
});


function saveImage() {
	
	// 버튼 숨김
	const button = document.getElementById("pdfExport");
	button.style.display = "none";
	
	
	const element = document.getElementById("pdfArea");
	element.style.fontSize = "16px";
	const options = {
		allowsTaint : true, //cross-origin allow
		useCORS : true, //CORS 사용한 서버로부터 이미지 로드할 것인지 여부
		scale : 2, //기본 해상도 2배
		//이 부분 이용해서 화면 캡쳐할 크기 지정
		width : 800,
		height : 4000
};
	
html2canvas(element, options).then(
	function(canvas) {
							
		// A4 용지 크기를 계산합니다.
		const pdfWidth = 210; // A4 용지 폭 (mm)
		const pdfHeight = 297; // A4 용지 높이 (mm)

		// Canvas 이미지의 크기를 계산합니다.
		const imgWidth = canvas.width;
		const imgHeight = canvas.height * pdfWidth / imgWidth;
		
		// PDF 파일의 페이지 높이를 계산합니다.
		const pageHeight = imgHeight > pdfHeight ? pdfHeight : imgHeight;
		
		// Canvas 이미지를 PDF 파일로 변환합니다.
		let heightLeft = imgHeight;
		let position = 0;
		const pdf = new jsPDF('p', 'mm', 'a4');
		pdf.addImage(canvas, 'JPEG', 0, position, pdfWidth, imgHeight);
		heightLeft -= pageHeight;
		
		while (heightLeft >= 0) {
			position = heightLeft - imgHeight;
			pdf.addPage();
			pdf.addImage(canvas, 'JPEG', 0, position, pdfWidth, imgHeight);
			heightLeft -= pageHeight;
		}

		// PDF 파일을 다운로드합니다.
		pdf.save('download.pdf');
	});
}



    </script>