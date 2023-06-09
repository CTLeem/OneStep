<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 공지사항 등록 수정 -->

<div class="layout-px-spacing">
	<div class="layout-top-spacing mb-2">
	    <div class="col-md-12">
	        <div class="row">
	            <div class="container p-0">
	                <div class="row layout-top-spacing">
		                <c:set value="등록" var="name"/>
						<c:if test="${status eq 'u' }"><c:set value="수정" var="name"/></c:if>
		                <div class="widget-heading">
							<h5 class="">공지사항 ${name }</h5>
						</div>
	                    <div class="col-lg-12 layout-spacing">
	                        <div class="statbox widget box box-shadow mb-4">
	                        <form action="/master/noticeInsert" method="post" enctype="multipart/form-data" id="boardForm">
		                     		<c:if test="${status eq 'u' }">
										<input type="hidden" name="boardId" value="${noticeUpdate.boardId }">
									</c:if>
	                            <div class="widget-content widget-content-area">
	                                <div class="form-group">
	                                    <label>제목<span class="text-danger"></span></label>
	                                    <input type="text" class="form-control" name="boardTitle" id="boardTitle" value="${noticeUpdate.boardTitle }">
	                                </div>
	                                <div>
	                                	<table>
	                                	<tr>
		                                	<td>
			                                	<label>분류<span class="text-danger"></span>
				                                    <select id="boardCal" name="boardCal" class="form-control" style="width:150px;">
				                                    	<option value="공지" <c:if test="${noticeUpdate.boardCal eq '공지' }">selected="selected"</c:if>>공지</option>
				                                    	<option value="이벤트" <c:if test="${noticeUpdate.boardCal eq '이벤트' }">selected="selected"</c:if> >이벤트</option>
				                                    	<option value="업데이트" <c:if test="${noticeUpdate.boardCal eq '업데이트' }">selected="selected"</c:if> >업데이트</option>
				                                    </select>
			                                	</label>
		                                	</td>
		                                	<td>
			                                	<label>고정여부<span class="text-danger"></span>
			                                    <input type="checkbox" value="1" id="boardGot" name="boardGot" <c:if test="${noticeUpdate.boardGot eq '1' }">checked="checked"</c:if> >
			                                	</label>
		                                	</td>
	                                	</tr>
	                                	</table>
	                                </div>
	                                <div class="form-group">
	                                    <label for="exampleInputPassword1">내용<span class="text-danger"></span></label>
	                                    <textarea rows="10" class="form-control"  name="boardContent" id="boardContent">${notcieUpdate/boardContent }</textarea>
	                                </div>
	                            </div>
						        <div class="widget-footer text-right">
										<input type="button" value="${name }" id="insertBtn" class="btn btn-primary mr-2">
										<input type="button" value="목록" id="listBtn" class="btn btn-outline-primary"> 
									<c:if test="${status eq 'u' }">
										<input type="button" value="취소" id="cancelBtn" class="btn btn-outline-primary"> 
									</c:if>
						        </div>
					        </form>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	CKEDITOR.replace('boardContent',{
		
	});
});

var listBtn = $("#listBtn");
var insertBtn = $("#insertBtn");
var boardForm = $("#boardForm");
var cancelBtn = $("#cancelBtn");

cancelBtn.on("click", function(){
	location.href = "/master/noticeDetail?boardId=${noticeUpdate.boardId}";
});

listBtn.on("click", function(){
	location.href = "/master/noticeList";
});

insertBtn.on("click", function(){
	// 입력 데이터 일반 검증
	var boardTitle = $("#boardTitle").val();
	var boardContent = CKEDITOR.instances.boardContent.getData();
	
	if(boardTitle == "" || boardTitle == null){
		alert("제목을 입력해주세요!");
		return false;
	}
	
	if(boardContent == "" || boardContent == null){
		alert("내용을 입력해주세요!");
		return false;
	}
	
	if($(this).val() == "수정"){
		boardForm.attr("action", "/master/noticeUpdate");	
	}
	
	boardForm.submit();
});
</script>