<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div
	class="col-xl-11 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing"
	style="margin: 0 auto;">
	<div class="input-group m-t-10">
		<input type="text" id="text" class="form-control"
			placeholder="원하는기업을 검색해보세요"> <span class="input-group-append">
			<button type="button" class="btn btn-primary">Search</button>
		</span>
	</div>
	<div class="col-xl-12 col-lg-12 col-md-12">
		<table class="table mb-0" id="searchTable"
			style="display: none; width: 100%;">
			<!-- 					<thead> -->
			<!-- 						<tr> -->
			<!-- 							<th>기업명</th> -->
			<!-- 						</tr> -->
			<!-- 					</thead> -->
			<tbody id="table">
			</tbody>
		</table>
	</div>

		<div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing" style="margin-top: 3% ">
			<div class="widget-content widget-content-area br-6" >
				<h3 class="table-header" align="center" >ROOM</h3>
				<br>
				<div class="table-responsive mb-4">
					<table id="roomTable" class="table table-hover" style="width: 100%">
						<thead>
							<tr>
								<th>방 아이디</th>
								<th>방 이름</th>
								<th>일시</th>
								<td></td>
								<td></td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="roomList" items="${roomList.data.list}">
								<tr>
									<td>${roomList.roomId}</td>
									<td>${roomList.roomTitle}</td>
									<td>${roomList.endDate}</td>
									<td><button id="delBtn" class="btn btn-primary">삭제하기</button>
									</td>
									<td><span class="btn btn-primary" id="modalBtn"
										data-toggle="modal"
										data-target="#exampleModalCenter${roomList.roomId}">매칭하기</span></td>
								</tr>
							</c:forEach>

						</tbody>

					</table>
				</div>
			</div>
		</div>


<!-- 		<table id="roomTable" border="2px;"> -->
<!-- 			<tr> -->
<!-- 				<th>방 아이디</th> -->
<!-- 				<th>방 이름</th> -->
<!-- 				<th>종료일시</th> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
<%-- 			<c:forEach var="roomList" items="${roomList.data.list}"> --%>
<!-- 				<tr> -->
<%-- 					<td>${roomList.roomId}</td> --%>
<%-- 					<td>${roomList.roomTitle}</td> --%>
<%-- 					<td>${roomList.endDate}</td> --%>
<!-- 					<td><button id="delBtn" class="btn btn-primary">삭제하기</button> -->
<!-- 					</td> -->
<!-- 					<td><span class="btn btn-primary" id="modalBtn" -->
<!-- 						data-toggle="modal" -->
<%-- 						data-target="#exampleModalCenter${roomList.roomId}">매칭하기</span></td> --%>
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 		</table> -->
	</div>
	<div id="modalList">
		<c:forEach var="roomList" items="${roomList.data.list}">
			<div class="modal fade" id="exampleModalCenter${roomList.roomId}"
				tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered"
					role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalCenterTitle">채팅방
								초대하기</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<i class="las la-times"></i>
							</button>
						</div>
						<div class="modal-body">
							<h6 class="modal-heading modal-lg mb-4 mt-2">${roomList.roomTitle}</h6>
							<div class="table-responsive" style="height: 300px;">
								<h3>기업회원</h3>
								<div>${roomList.roomId}</div>
								<table id="companyMemTable" class="table mb-0">
								</table>
								<h3>면접지원자</h3>
								<table id="applyMemTable" class="table mb-0">
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
	</div>
</div>


<script type="text/javascript">
$(function(){
	var text = $('#text');

	console.log(${roomList.data.list});
	text.on("keyup",function() {
 
		if ($('#text').val() != "") {
			$.ajax({
						url : "/company/searchCompanyList",
						type : "get",
						data : {
							companyName : text.val()
						},
						success : function(res) {

							$("#table").html("");
							html = "";

							for (let i = 0; i < res.length; i++) {

								html = "";

								console
										.log('기업명 : '
												+ res[i]['companyName']);
								companyId = res[i]['companyId'];
								html += `<tr>`;
								html += "<td style='width: 85%'><a href= '/member/detail/"+companyId+"'"+">"
										+ res[i]['companyName']
										+ "</a><div hidden='true'>"+res[i].companyName +"</div></td> ";
								html += "<td><button id='addBtn' class='btn btn-primary'type='button'>방 생성하기<button></td>";
								html += `</tr>`;

								$("#table").append(html);
							}

							console.log($('#text').val());

							if (res.length > 0) {
								$('#searchTable').css('display', 'table');
							}

						}

					});
		} else {
			$('#searchTable').css('display', 'none');
		}

	});



	$('#table').on("click",function(event){

		var companyName = event.target.parentNode.parentNode.childNodes[0].childNodes[1].innerText;
		var obj = {companyName : companyName}
		var jsonObj = JSON.stringify(obj);
		
		$.ajax({
			url : "/manager/createroom",
			type : "POST",
			data : jsonObj,
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			success : function(res){

				var list = res.data.list;
				var html = "";
				var html2 = "";
				for(var i=0; i<list.length; i++){
				html+="<tr>";
				html+="		<td>"+list[i].roomId+"</td>";
				html+="		<td>"+list[i].roomTitle+"</td>";
				html+="		<td>"+list[i].endDate+"</td>";
				html+="		<td><button id='delBtn' class='btn btn-primary'>삭제하기</button> </td>";
				html+="		<td><span class='btn btn-sm btn-primary' id='modalBtn' data-toggle='modal' data-target='#exampleModalCenter"+list[i].roomId+"'>매칭하기</span> </td>";
				html+="</tr>";

				html2+="<div class='modal fade'";
				html2+="	id='exampleModalCenter"+list[i].roomId+"' tabindex='-1'";
				html2+="	role='dialog' aria-labelledby='exampleModalCenterTitle'";
				html2+="	aria-hidden='true'>";
				html2+="	<div class='modal-dialog modal-lg modal-dialog-centered'";
				html2+="	role='document'>";
				html2+="	<div class='modal-content'>";
				html2+="		<div class='modal-header'>";
				html2+="			<h5 class='modal-title' id='exampleModalCenterTitle'>채팅방 초대하기</h5>";
				html2+="			<button type='button' class='close' data-dismiss='modal'";
				html2+="			aria-label='Close'>";
				html2+="			<i class='las la-times'></i>";
				html2+="			</button>";
				html2+="		</div>";
				html2+="		<div class='modal-body'>";
				html2+="			<h6 class='modal-heading modal-lg mb-4 mt-2'>"+list[i].roomTitle+"</h6>";
				html2+="			<div class='table-responsive' style='height: 300px;'>";
				html2+="				<h3>기업회원</h3>";
				html2+="					<div>"+list[i].roomId+"</div>";
				html2+="						<table id='companyMemTable' class='table mb-0' >";
				html2+="						</table>";
				html2+="						<h3>면접지원자</h3>";
				html2+="						<table id='applyMemTable' class='table mb-0' >";
				html2+="						</table>";
				html2+="					</div>";
				html2+="			</div>";
				html2+="			<div class='modal-footer modal-lg'>";
				html2+="				<button class='btn' data-dismiss='modal'>";
				html2+="					<i class='flaticon-cancel-12'></i> 닫기";
				html2+="				</button>";
				html2+="				<button type='button' class='btn btn-primary'>완료</button>";
				html2+="			</div>";
				html2+="		</div>";
				html2+="	</div>";
				html2+="</div>";
					}
				$('#roomTable').html('');
				$('#roomTable').html(html);
				$('#modalList').html('');
				$('#modalList').html(html2);
				
				
				}

			});
		});

	$('#roomTable').on("click","#delBtn",function(event){
	
		
			

			var roomId = event.target.parentNode.parentNode.childNodes[1].innerText;
			var obj = {roomId : roomId};
			var jsonObj = JSON.stringify(obj);
			$.ajax({
				url : "/manager/deleteroom",
				type : "POST",
				data : jsonObj,
				contentType : "application/json;charset=UTF-8",
				dataType : "json",
				success : function(res){
					console.log(res);
					var list = res.data.list;
					var html = "";
					var html2 = "";
					for(var i=0; i<list.length; i++){
					html+="<tr>";
					html+="		<td>"+list[i].roomId+"</td>";
					html+="		<td>"+list[i].roomTitle+"</td>";
					html+="		<td>"+list[i].endDate+"</td>";
					html+="		<td><button id='delBtn' class='btn btn-primary'>삭제하기</button> </td>";
					html+="		<td><span class='btn btn-sm btn-primary' id='modalBtn' data-toggle='modal' data-target='#exampleModalCenter"+list[i].roomId+"'>매칭하기</span> </td>";
					html+="</tr>";

					html2+="<div class='modal fade'";
					html2+="	id='exampleModalCenter"+list[i].roomId+"' tabindex='-1'";
					html2+="	role='dialog' aria-labelledby='exampleModalCenterTitle'";
					html2+="	aria-hidden='true'>";
					html2+="	<div class='modal-dialog modal-lg modal-dialog-centered'";
					html2+="	role='document'>";
					html2+="	<div class='modal-content'>";
					html2+="		<div class='modal-header'>";
					html2+="			<h5 class='modal-title' id='exampleModalCenterTitle'>채팅방 초대하기</h5>";
					html2+="			<button type='button' class='close' data-dismiss='modal'";
					html2+="			aria-label='Close'>";
					html2+="			<i class='las la-times'></i>";
					html2+="			</button>";
					html2+="		</div>";
					html2+="		<div class='modal-body'>";
					html2+="			<h6 class='modal-heading modal-lg mb-4 mt-2'>"+list[i].roomTitle+"</h6>";
					html2+="			<div class='table-responsive' style='height: 300px;'>";
					html2+="				<h3>기업회원</h3>";
					html2+="					<div>"+list[i].roomId+"</div>";
					html2+="						<table id='companyMemTable' class='table mb-0' >";
					html2+="						</table>";
					html2+="						<h3>면접지원자</h3>";
					html2+="						<table id='applyMemTable' class='table mb-0' >";
					html2+="						</table>";
					html2+="					</div>";
					html2+="			</div>";
					html2+="			<div class='modal-footer modal-lg'>";
					html2+="				<button class='btn' data-dismiss='modal'>";
					html2+="					<i class='flaticon-cancel-12'></i> 닫기";
					html2+="				</button>";
					html2+="				<button type='button' class='btn btn-primary'>완료</button>";
					html2+="			</div>";
					html2+="		</div>";
					html2+="	</div>";
					html2+="</div>";
						}
					
					$('#roomTable').html('');
					$('#roomTable').html(html);
					$('#modalList').html('');
					$('#modalList').html(html2);
					
					}

				});
		});

	$('#roomTable').on("click","#modalBtn",function(event){
		
		var modalId = $(this).attr('data-target');
		
		$(modalId).find('#companyMemTable').html('');
		$(modalId).find('#applyMemTable').html('');
		
			
		
		var companyName = event.target.parentNode.parentNode.childNodes[3].innerText;
		var obj = {companyName : companyName}

		$.ajax({
			url : "/manager/inviteList",
			type : "POST",
			data : obj,
			dataType :"json",
			success : function(res){
				var html= "";
				html+="<thead>";
				html+="	<tr>"
				html+="		<th>아이디</th>";
				html+="		<th>이름</th>";
				html+="		<th>채팅방 생성하기</th>";
				html+="	</tr>";
				html+="</thead>";
				
				$(modalId).find('#companyMemTable').append(html);
				$(modalId).find('#applyMemTable').append(html);

				
				"<div hidden='true'>"+ +"</div>"
				
				res.companyMemList.map(function(value, idx){
					console.log("companyMemList : " + value.memName);
					console.log("companyMemList : " + value.memId);
					html="";
					html+="<tr>";
					html+="		<td>"+ value.memName + "</td>";
					html+="		<td>"+ value.memId + "</td>";
					html+="		<td><button id='comMemBtn' class='btn btn-primary'type='button'>초대코드전송</button></td>";
					html+="</tr>"	

				$(modalId).find('#companyMemTable').append(html);
						
				});
				
				
				res.applyMemList.map(function(value, idx){
					
					html="";
					console.log("applyMemList : " + value.memName);
					console.log("applyMemList : " + value.memId);
					
					html+="<tr>";
					html+="		<td>"+ value.memName + "</td>";
					html+="		<td>"+ value.memId + "</td>";
					html+="		<td><button id='applyMemBtn' class='btn btn-primary'type='button'>초대코드전송</button></td>";
					html+="</tr>"	

				$(modalId).find('#applyMemTable').append(html);
					
				});
				
				
				}

			});

	});

	$('#companyMemTable').on("click","#comMemBtn",function(event){

			var memId = event.target.parentNode.parentNode.childNodes[1].innerText;
			console.log(memId);
			var roomId = event.target.parentNode.parentNode.parentNode.parentNode.childNodes[3].innerText;
			var obj = {memId : memId, roomId : roomId}
			var jsonObj = JSON.stringify(obj);
			
			
			
			
			$.ajax({
				url:"/manager/inviteCom",
				type:"post",
				data:jsonObj,
				contentType:"application/json;charset=UTF-8",
				dataType:"text",
				success: function(res){
					
					alert('초대코드를 전송했습니다.');
					}
				
				});
			
		

		});

	$('#applyMemTable').on("click","#applyMemBtn",function(event){

		var memId = event.target.parentNode.parentNode.childNodes[1].innerText;
		console.log(memId);
		var roomId = event.target.parentNode.parentNode.parentNode.parentNode.childNodes[3].innerText;
		var obj = {memId : memId, roomId : roomId}
		var jsonObj = JSON.stringify(obj);
		
		
		
		
		$.ajax({
			url:"/manager/inviteMem",
			type:"post",
			data:jsonObj,
			contentType:"application/json;charset=UTF-8",
			dataType:"text",
			success: function(res){
				
				alert('초대코드를 전송했습니다.');
				}
			
			});
		
	

	});
	


	
	

	
});

</script>
