<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing"
	style="margin: 0 auto; margin-top: 3%">
	<div class="widget-content widget-content-area br-6">
		<div class="table-responsive mb-4">
			<div class="row">
				<div class="col-xl-12 col-md-12 layout-spacing">

					<div class="notifications-table-widget"  style="text-align: center;">
						<div class="widget-heading">
							<h3 style="font: bold; height: 80px; line-height: 80px; border-radius: 10px">내가 지원한 공고</h3>
							<div class="d-none d-md-flex switch-outer-container"
								style="float: right">
								Do not disturb <span class="switch"> <label> <input
										type="checkbox" checked="checked" name="select">
								</label>
								</span>
							</div>
						</div>
						<br>
						<br>
						<div class="widget-content" id="parentDiv">
							<div class="table-responsive" >
								<table class="table table-hover" >
									<thead>
										<tr>
											<th><div class="th-content">공고명</div></th>
											<th><div class="th-content">모집분야</div></th>
											<th><div class="th-content">공고종료날짜</div></th>
											<th><div class="th-content">지원상태</div></th>
											<th><div class="th-content">결과발표일</div></th>
											<th><div class="th-content">상세보기</div></th>
										</tr>
									</thead>

									<tbody id="tbody">
										<c:forEach items="${applyList}" var="applyList" >

												<tr>
													<td>${applyList.annoVO[0].annoTitle}</td>
													<td>${applyList.annoVO[0].annoMb} </td>
													<td><fmt:formatDate value="${applyList.annoVO[0].annoEndDate}" pattern="yyyy-MM-dd"/></td>
													<td>
														<c:if test="${applyList.applyStatus==1}">
														<h6 style="color: #4165a7;">지원완료 </h6> 
														</c:if>
														<c:if test="${applyList.applyStatus==2}">
														<h6 style="color: #8dbf42;">기업평가 진행중 </h6> 
														</c:if>
														<c:if test="${applyList.applyStatus==3}">
															<c:if test="${applyList.applyResult=='합격'}">
																<h6  style="color: #10c700;"><a>${applyList.applyResult}</a></h6> 
															</c:if>
															<c:if test="${applyList.applyResult=='불합격'}">
																<h6 id="nopass" style="color: #c70000; "><a>${applyList.applyResult}</a></h6> 
															</c:if>
														</c:if>
													</td>
													<td> 
														<c:if test="${applyList.applyStatus==3}">
														<fmt:formatDate value="${applyList.applyResultDate}" pattern="yyyy-MM-dd"/>
														</c:if>
													</td>
													<td>
														<c:if test="${applyList.applyStatus==3}">
															<c:if test="${applyList.applyResult=='합격'}">
																<button id="pass" type="button" data-toggle="modal" data-target="#exampleModalCenter1${applyList.applyId}" class="btn btn-info btn-rounded">상세보기</button>
															</c:if>
															<c:if test="${applyList.applyResult=='불합격'}">
																<button id="nopass" type="button" data-toggle="modal" data-target="#exampleModalCenter2${applyList.applyId}" class="btn btn-info btn-rounded">상세보기</button>
															</c:if>
														</c:if>
													</td>
												</tr>
										</c:forEach>
									</tbody>
									
								</table>
							</div>
							
							<c:forEach items="${applyList}" var="applyList">
								<div class="modal fade" id="exampleModalCenter1${applyList.applyId}" tabindex="-1" aria-labelledby="exampleModalCenterTitle" style="display: none;" aria-hidden="true">
	                                <div class="modal-dialog modal-dialog-centered" role="document">
	                                    <div class="modal-content">
	                                        <div class="modal-header">
	                                            <h5 class="modal-title" id="exampleModalCenterTitle">합격</h5>
	                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                                <i class="las la-times"></i>
	                                            </button>
	                                        </div>
	                                        <div class="modal-body ">
	                               				<h3>${applyList.annoVO[0].annoTitle} 공고에 합격하셨습니다</h3>
	                                        </div>
	                                        <div class="modal-footer">
	                                            <button class="btn" data-dismiss="modal"><i class="flaticon-cancel-12"></i> 닫기</button>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
                            
                            
								<div class="modal fade" id="exampleModalCenter2${applyList.applyId}" tabindex="-1" aria-labelledby="exampleModalCenterTitle" style="display: none;" aria-hidden="true">
	                                <div class="modal-dialog modal-dialog-centered" role="document">
	                                    <div class="modal-content">
	                                        <div class="modal-header">
	                                            <h5 class="modal-title" id="exampleModalCenterTitle">불합격</h5>
	                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                                <i class="las la-times"></i>
	                                            </button>
	                                        </div>
	                                        <div class="modal-body ">
	                               				<h3>${applyList.annoVO[0].annoTitle}공고에 불합격하셨습니다</h3>
	                               				<button class="btn btn-primary" id="resultCommentBtn">기업 코멘트 확인하기</button>
	                               				<div class="mt-3" style="display : none; color: #c70000;">
	                               				기업 코멘트 : ${applyList.applyResultComment} 
	                               				</div> 
	                                        </div>
	                                        <div class="modal-footer">
	                                            <button class="btn" data-dismiss="modal"><i class="flaticon-cancel-12"></i> 닫기</button>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
							</c:forEach>
							
							
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
$(function(){

	$('#parentDiv').on("click",'#resultCommentBtn',function(){
		console.log(event.target.parentNode.childNodes[5]);
		event.target.parentNode.childNodes[5].style.display ="";
		
		});
	
});
</script>