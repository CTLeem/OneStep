<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing"
	style="margin: 0 auto;">
	<div class="widget-content widget-content-area br-6">
		<div class="table-responsive mb-4">
			<div class="row">
				<div class="col-xl-12 col-md-12 layout-spacing">

					<div class="notifications-table-widget">
						<div class="widget-heading" style="text-align: center;">
							<h3
								style=" text-align: center; font: bold; height: 80px; line-height: 80px; border-radius: 10px">채용
								현황</h3>
						</div>
						<br>
						<br>
						<div class="widget-content">
						
						<label class="checkbox checkbox-outline checkbox-outline-bold checkbox-primary">
						<input type="checkbox" name="Checkboxes16" id="checkBox" >
						<span></span>합격자만 조회하기</label>
						
							<div class="table-responsive" id="parentDiv">
							
								<table class="table table-hover" id="table" style="text-overflow: ellipsis; overflow:hidden; white-space:nowrap; ">
									<thead>
										<tr>
											<th><div class="th-content">공고명</div></th>
											<th><div class="th-content">지원자이름</div></th>
											<th><div class="th-content">평점</div></th>
											<th><div class="th-content">결과</div></th>
										</tr>
									</thead>

									<tbody id="tbody">
										<c:forEach items="${member}" var="member" varStatus="stat">

											<c:if test="${member.applyList[0].applyStatus==3}">
												<tr>
													<td style="table-layout: fixed;">${member.annoList[0].annoTitle}<input
														type="hidden" value="${member.applyList[0].applyId}"
														name="evaluationList[${stat.index }].applyId">
													</td>
													<td>${member.memName}</td>
													<td class="applyResult" >${member.applyList[0].applyTotal} /10.0</td>
													<td class="applyResult" >${member.applyList[0].applyResult}</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
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
	$('#checkBox').on("change",function(){
		if (this.checked) {
	
			resultList = $('td[class="applyResult"]');	
			
			for(var i=0; i<resultList.length; i++){
				if(resultList[i].innerText =='불합격'){
					resultList[i].parentNode.style.display='none';
					}
				
			}	
        }else{

			resultList = $('td[class="applyResult"]');	
			
			for(var i=0; i<resultList.length; i++){
				if(resultList[i].innerText =='불합격'){
					resultList[i].parentNode.style.display='';
					}
				
			}	



            }
		
			
			
		
		});
	
	
});

</script>