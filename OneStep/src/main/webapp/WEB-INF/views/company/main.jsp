<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:choose>
 <c:when test="${sessionScope.memberVO.companyId eq null }">
 	<div align="center">
 	<h1>기업회원만 사용 가능합니다</h1>
 	</div>
 </c:when>
 <c:otherwise>

 
    <div class="layout-px-spacing">
                <div class="layout-top-spacing mb-5">
                    <div class="col-md-12" style="text-align: center;">
                    	<img alt="" src="${pageContext.request.contextPath }/resources/assets/img/commain.png" width="75%">
                    </div>
                 </div>
            </div>

    <!--  Navbar Ends / Breadcrumb Area  -->
    <!-- Main Body Starts -->
    <div class="layout-px-spacing">
      <div class="row layout-top-spacing">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
          <div class="widget top-welcome">
            <div class="f-100">
              <div class="row">
                <div class="col-lg-4">
                  <div class="media">
                    <div class="mr-3">
                      <img src="/resources/upload/${vo.companyLogo}" alt="회사로고" class="avatar-md rounded-circle img-thumbnail">
                    </div>
                    
                    <div class="align-self-center media-body">
                      <div class="text-muted">
                        <p class="mb-2 text-primary">${vo.companyEstablishment }</p>
                        <h5 class="mb-1"><c:out value="${vo.companyName }"/></h5>
                        <p class="mb-0"><c:out value="${vo.companySmall }"/> <c:out value=" ${vo.companyMain }"/></p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="align-self-center col-lg-5">
                  <div class="text-lg-center mt-4 mt-lg-0">
                    <div class="row">
                      <div class="col-3">
                        <div>
                          <p class="text-muted text-truncate mb-2">공고수</p>
                          <h5 class="mb-0">${annoCnt }</h5>
                        </div>
                      </div>
                      <div class="col-3">
                        <div>
                          <p class="text-muted text-truncate mb-2">관심인재수</p>
                          <h5 class="mb-0">${insterstCnt }</h5>
                        </div>
                      </div>
                      <div class="col-3">
                        <div>
                          <p class="text-muted text-truncate mb-2">지원수</p>
                          <h5 class="mb-0">${applyCnt }</h5>
                        </div>
                      </div>
                      <div class="col-3">
                        <div>
                          <p class="text-muted text-truncate mb-2">리뷰수</p>
                          <h5 class="mb-0">${reviewCnt }</h5>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="d-none d-lg-flex col-lg-3 align-items-end justify-content-center flex-column">
                  <button class="btn btn-primary" onclick="location.href='/company/detail/${companyId}'">
                	    내정보
                  </button>
                </div>
              </div>
            </div>
          </div>
          </div>
          </div>
          </div>
        
        
          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
            <div class="widget-chart-one">
              <div class="widget-content overflow-hidden">
                <div class="ticker-wrap">
                  <div class="ticker-heading" style="background-color: #4165a7">
                    <p onclick="location.href='/company/notice'">공지사항</p>
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
          
           
 </c:otherwise>
</c:choose>
