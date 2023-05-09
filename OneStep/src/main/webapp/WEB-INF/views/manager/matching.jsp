<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="layout-px-spacing">
	<div class="row layout-top-spacing">
		<div class="apps-ticket col-xl-12 col-lg-12 col-md-12">
			<div class="row">
				<div class="col-xl-11 col-md-12 layout-spacing" style="margin: 0 auto;">
					<div class="notifications-table-widget">
						<div class="widget-heading">
							<h2 class="">매칭</h2> <br>
						</div>
						<div class="widget-content">
							<div class="table-responsive" id="parentDiv">
								<table class="table table-hover">
									<thead>
										<tr>
											<th><div class="th-content">제목</div></th>
											<th><div class="th-content">종료날짜</div></th>
											<th><div class="th-content">모집분야</div></th>
											<th><div class="th-content">우대사항</div></th>
											<th><div class="th-content">급여</div></th>
											<th><div class="th-content"></div></th>
										</tr>
									</thead>
									<tbody id="tbody">

										<c:forEach items="${annoList}" var="annoList">


											<tr>
												<td>
													<div class="d-flex align-items-center">
														<i class="las la-box font-20 mr-2"></i>${annoList.annoTitle}
													</div>
													<div id="annoId" hidden="true">${annoList.annoId}</div>
												</td>
												<td style="width: 300px;"><fmt:formatDate pattern="yyyy-MM-dd " value="${annoList.annoEndDate}" /></td>
												<td>${annoList.annoMb}</td>
												<td>${annoList.annoUd}</td>
												<td>${annoList.annoSalary}</td>
												<td><span class="btn btn-sm btn-primary" id="modalBtn"
													data-toggle="modal"
													data-target="#exampleModalCenter${annoList.annoId}">매칭하기</span>

												</td>
											</tr>

										</c:forEach>


									</tbody>

								</table>

								<c:forEach var="annoList" items="${annoList}">
									<div class="modal fade"
										id="exampleModalCenter${annoList.annoId}" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalCenterTitle"
										aria-hidden="true">
										<div class="modal-dialog modal-lg modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalCenterTitle">매칭
														서비스</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<i class="las la-times"></i>
													</button>
												</div>
												<div class="modal-body">
													<h6 class="modal-heading modal-lg mb-4 mt-2">모집분야(${annoList.annoMb})에
														맞는 이력서 검색</h6>
													<div class="table-responsive" style="height: 300px;">
														<table class="table mb-0" >
															<thead>
																<tr>
																	<th>이름</th>
																	<th>성별</th>
																	<th>희망연봉</th>
																	<th>희망분야</th>
																	<th>제안하기</th>
																	<th>이력서상세보기</th>
																</tr>
															</thead>
															<tbody id="table${annoList.annoId}">
															</tbody>

														</table>
													</div>
												</div>
												<div class="modal-footer modal-lg">
													<button class="btn" data-dismiss="modal">
														<i class="flaticon-cancel-12"></i> 닫기
													</button>
													<button type="button" class="btn btn-primary">완료</button>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>


								<div class="pagination p13">
									<ul class="mx-auto">
										<a href="#" class="prev"><li>Prev</li></a>
										<a href="#"><li>1</li></a>
										<a href="#"><li>2</li></a>
										<a href="#"><li>3</li></a>
										<a href="#"><li>4</li></a>
										<a href="#"><li>5</li></a>
										<a class="is-active" href="#"><li>6</li></a>
										<a href="#" class="next"><li>Next</li></a>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
	$(function(){

		var tbody = $('#tbody');

		tbody.on("click",function(event){
			
			if(event.target.id=='modalBtn'){
				
				var annoMb = event.target.parentNode.parentNode.childNodes[4].nextSibling.innerHTML;
				var annoSalary = event.target.parentNode.parentNode.childNodes[8].nextSibling.innerHTML;
				var obj = {annoMb: annoMb , annoSalary: annoSalary};
				console.log(event.target.parentNode.parentNode.childNodes[0].nextSibling.childNodes[2].nextSibling.innerText);
				var annoId = event.target.parentNode.parentNode.childNodes[0].nextSibling.childNodes[2].nextSibling.innerHTML;
				var jsonObj = JSON.stringify(obj);

				 $.ajax({
					url : "/member/selectResume",
					type : "post",
					contentType : "application/json;charset=UTF-8",
					data : jsonObj ,
					dataType :'json',
					success : function(res){
						console.log(res);
						
						var html="";
						$('#table'+annoId).html("");
						
						for(var i=0; i<res.length; i++){

							html += "<tr>";
							html += "<td>"+res[i].memName +"<div id='memId' hidden='true'>"+res[i].memId +"</div><div id='annoId' hidden='true'>"+annoId+"</div><div id='resumeId' hidden='true'>"+res[i].resumeId+"</div></td>";
							html += "<td>"+res[i].memGender+"</td> ";
							html += "<td>"+res[i].desiredSalary +"</td> ";
							html += "<td>"+res[i].workfield1+"</td> ";
							html += "<td><button class='btn btn-sm btn-primary' id='commend'>제안하기</button></td>"
							html += "<td><button class='btn btn-sm btn-primary' id='detail'>상세보기</button></td>"
							html += "</tr>";
							}
							$('#table'+annoId).append(html);
						}
					}); 
					
				}
			});

		$('#parentDiv').on("click","#commend",function(){
			console.log("click...!");
			console.log(this.parentNode.parentNode.childNodes[0].childNodes[1].innerText); //아이디
			console.log(this.parentNode.parentNode.childNodes[0].childNodes[2].innerText); //공고번호
			console.log(this.parentNode.parentNode.childNodes[0].childNodes[3].innerText); //이력서번호
			
			var memId = this.parentNode.parentNode.childNodes[0].childNodes[1].innerText;
			var annoId = this.parentNode.parentNode.childNodes[0].childNodes[2].innerText;
			var resumeId =this.parentNode.parentNode.childNodes[0].childNodes[3].innerText;

			var jsonObj = JSON.stringify({memId:memId,annoId:annoId,resumeId:resumeId});
			
			
			
			$.ajax({
				url : "/manager/insertResume",
				type : "post",
				contentType : "application/json;charset=UTF-8",
				data : jsonObj,
				dataType :'text',
				success : function(res){
					console.log(res);
					if(res==='SUCCESS'){
						alert('이력서 추천이 완료되었습니다!');
						}
				}
			});
		});


		$('#parentDiv').on("click","#detail",function(){
			console.log(this.parentNode.parentNode.childNodes[0].childNodes[3].innerText); //이력서번호
			
			var resumeId =this.parentNode.parentNode.childNodes[0].childNodes[3].innerText;

			window.open("/company/detailMemInt/" + resumeId, "PopupNew", "width=1500,height=1500");
			
			
		});




		
	});
</script>