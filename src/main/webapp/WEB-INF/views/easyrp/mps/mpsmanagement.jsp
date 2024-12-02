<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<!-- 공통 사용 테이블 START -->
	<div id="main">
		<header class="mb-3">
			<a href="#" class="burger-btn d-block d-xl-none"> <i
				class="bi bi-justify fs-3"></i>
			</a>
		</header>
		<div class="page-heading">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>
							<a href="/easyrp/commontable">주계획 관리</a>
						</h3>
						<p class="text-subtitle text-muted">주계획 조회, 등록, 수정, 삭제</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">주계획
									목록</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="row" id="table-hover-row">
					<div class="col-12">
						<div class="card">
							<div class="card-content">
								<div class="table-responsive">
									<!-- 검색 FORM START -->
									<div class="card">
										<div class="card-body mb-3" style="padding: 0.5rem">
											<div class="col-12 col-md-6 order-md-1 order-last">
												<h3>검색</h3>
											</div>
											<form id="searchForm" action="mpsmanagement" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr>
															<!-- 
															<td width="100">계획구분</td>
															<td><select id="searchPlan" name="searchPlan" class="form-select">
																<option value="수주">수주정보 기반</option>
																<option value="계획">생산계획 기반</option>
															</select></td> -->
															<td width="100">품 번</td>
															<td><input type="text" id="searchProdCod"
																name="searchProdCod" class="form-control"
																value="${searchProdCod}" placeholder="품번을 입력해주세요." /></td>
															<td width="100">품 명</td>
															<td><input type="text" id="searchProdName"
																name="searchProdName" class="form-control"
																value="${searchProdName}" placeholder="품명을 입력해주세요." /></td>
															<td width="100">고 객</td>
															<td><input type="text" id="searchClient"
																name="searchClient" class="form-control"
																value="${searchClient}" placeholder="고객을 입력해주세요." /></td>
														</tr>
														<tr>
															<td width="100">검색 날짜</td>
															<td colspan="2"><input type="date"
																id="preSearchDate" name="preSearchDate"
																value="${preSearchDate}" class="form-control"
																style="width: 47%; float: left" /> <span><i
																	class="fa-solid fa-arrow-right"
																	style="margin-top: 10px"></i></span> <input type="date"
																id="postSearchDate" name="postSearchDate"
																value="${postSearchDate}" class="form-control"
																style="width: 47%; float: right" /></td>
														</tr>
													</table>
												</div>
												<input type="hidden" name="offset" value="${offset}" /> <input
													type="hidden" name="size" value="${pageSize}" />
												<div style="text-align: end; margin-right: 0.5rem">
													<button type="submit" class="btn btn-primary">검색</button>
													 <button type="button" class="btn btn-primary"   onclick="resetSearchForm()">초기화</button>
												</div>
											</form>
										</div>
									</div>
									<!-- 검색 FORM END -->
									<table class="table table-hover mb-0">
										<thead>
											<tr>
												<th>주계획번호</th>
												<th>계획일</th>
												<th>품번</th>
												<th>품명</th>
												<th>규격</th>
												<th>단위</th>
												<th>납기일</th>
												<th>계획수량</th>
												<th>고객</th>
												<th>비고</th>
												<th>기능</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty mpsTable }">
												<c:forEach var="mpsTable" items="${mpsTable }">
													<tr>
														<td>${mpsTable.cod }</td>
														<td class="text-bold-500"><fmt:formatDate value="${mpsTable.planDate }" pattern="yyyy-MM-dd"/></td>
														<td>${mpsTable.productCod}</td>
														<td class="text-bold-500">${mpsTable.prodname }</td>
														<td>${mpsTable.spec }</td>
														<td>${mpsTable.unitName }</td>
														<td><fmt:formatDate value="${mpsTable.dday }" pattern="yyyy-MM-dd"/></td>
														<td>${mpsTable.qty }</td>
														<td>${mpsTable.clientName }</td>
														<td>${mpsTable.note }</td>
														<td>
															<div class="btn-group">
																<button type="button"
																	class="btn btn-primary dropdown-toggle"
																	data-bs-toggle="dropdown" aria-expanded="false">
																	<i class="fa-solid fa-gear"></i>
																</button>
																<ul class="dropdown-menu">
																	<li><a class="dropdown-item"
																		href="mpsupdate?cod=${mpsTable.cod}">수정</a></li>
																	<li><a class="dropdown-item"
																		href="mpsdeletefn?cod=${mpsTable.cod}"
																		onclick="return confirmDeleteAction();">삭제</a></li>
																</ul>
															</div>
														</td>
													</tr>
												</c:forEach>
											</c:if>
											<c:if test="${empty mpsTable }">
												<tr>
													<td colspan="12" align="center">주계획 내역이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- 페이지네이션 START -->
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
							<!-- Previous 10 Pages -->
							<li
								class="page-item <c:if test='${startPage == 1}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${startPage > 1}'>?page=${startPage - 10}&size=${pageSize}&searchPlan=${searchPlan }&searchProdCod=${param.searchProdCod}&searchProdName=${param.searchProdName}&searchClient=${param.searchClient}&preSearchDate=${param.preSearchDate}&postSearchDate=${param.postSearchDate}</c:if>">이전
									10 페이지</a>
							</li>

							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li
									class="page-item <c:if test='${i == currentPage}'>active</c:if>">
									<a class="page-link"
									href="?page=${i}&size=${pageSize}&searchPlan=${searchPlan }&searchProdCod=${param.searchProdCod}&searchProdName=${param.searchProdName}&searchClient=${param.searchClient}&preSearchDate=${param.preSearchDate}&postSearchDate=${param.postSearchDate}">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item <c:if test='${endPage == totalPages}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${endPage < totalPages}'>?page=${endPage + 1}&size=${pageSize}&searchPlan=${searchPlan }&searchProdCod=${param.searchProdCod}&searchProdName=${param.searchProdName}&searchClient=${searchClient}&preSearchDate=${param.preSearchDate}&postSearchDate=${param.postSearchDate}</c:if>">다음
									10 페이지</a>
							</li>
						</ul>
					</nav>

					<!-- 페이지네이션 END -->
					<div class="d-flex"
						style="padding-bottom: 0.5rem; padding-top: 0.5rem;">
						<div class="col-md-6">
							<button type="button" class="btn btn-primary">
								<a href="mpsinsert" style="color: white">등록</a>
							</button>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 공통 사용 테이블 END -->
</body>
	<!-- 초기화 버튼 작동 자바스크립트  -->
    <script type="text/javascript">
        function resetSearchForm() {
            $('#searchProdCod').val('');
            $('#searchProdName').val('');
            $('#searchClient').val('');
        }
        
        function confirmDeleteAction() {
            return confirm("한번 삭제 처리를 하면 되돌릴 수 없습니다. 정말 삭제 처리를 하시겠습니까?");
        }
    </script>
    
    <!-- 셀렉트박스 고정 자바스크립트 -->
    <script type="text/javascript">
    	window.onload = function(){
    		document.getElementById('searchPlan').value = '${searchPlan}';
    	}
    </script>
</html>
