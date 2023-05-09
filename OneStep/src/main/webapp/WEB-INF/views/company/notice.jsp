<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="col-xl-11 col-lg-12 col-sm-12  layout-spacing"
	style="margin: 0 auto; ">
	<div class="widget-content widget-content-area br-6">
		<div class="table-responsive mb-4">
			<h3
				style="text-align: center; font: bold; height: 80px; line-height: 80px; border-radius: 10px">공지사항</h3>
			<table id="basic-dt" class="table table-hover" style="width: 100% ; table-layout: fixed;">
				<thead>
					<tr style="text-align: center;">
						<th width="10%">분야</th>
						<th width="60">제목</th>
						<th width="15%">작성일</th>
						<th width="15%">작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${notice}" var="notice">
						<tr
							onclick="location.href='/company/noticeDetail/${notice.boardId}'">
							<td>${notice.boardCal }</td>
							<td style="text-overflow: ellipsis; overflow:hidden; white-space:nowrap; ">${notice.boardTitle }</td>
							<fmt:formatDate value="${notice.boardStart }"
								pattern="yyyy-MM-dd" var="boardStart" />
							<td style="text-align: center;">${boardStart }</td>
							<td>${notice.memId }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>