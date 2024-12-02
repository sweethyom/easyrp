<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<!-- (2024년 5월 3일 추가 박현우) -->
	<!-- 사원 관리 테이블 START -->
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
							<a href="departmentmgmt">부서 관리</a>
						</h3>
						<p class="text-subtitle text-muted">부서 관리를 할 수 있는 현황판</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">부서
									관리</li>
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
											<form id="searchForm" action="departmentmgmt" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr>
															<td width="100">부서번호</td>
															<td><input type="text" id="searchCod"
																name="searchCod" class="form-control"
																value="${searchVO.searchCod}"
																placeholder="부서 번호를 입력해주세요." /></td>
															<td width="100">부서이름</td>
															<td><input type="text" id="searchName"
																name="searchName" class="form-control"
																value="${searchVO.searchName}"
																placeholder="부서명을 입력해주세요." /></td>
															<td width="100">사업장</td>
															<td><input type="text" id="searchWrkName"
																name="searchWrkName" class="form-control"
																value="${searchVO.searchWrkName}"
																placeholder="사업장 명을 입력해주세요." /></td>
															<td width="100">지역</td>
															<td><input type="text" id="searchLocation"
																name="searchLocation" class="form-control"
																value="${searchVO.searchLocation}"
																placeholder="검색 지역을 입력해주세요." /></td>
														</tr>
													</table>
												</div>
												<div style="text-align: end; margin-right: 0.5rem">
													<button type="submit" class="btn btn-primary">검색</button>
													<button type="button" class="btn btn-primary"
														onclick="resetSearchForm()">초기화</button>
												</div>
											</form>
										</div>
									</div>
									<!-- 검색 FORM END -->
									<table class="table table-hover mb-0">
										<thead>
											<tr>
												<th width="5%">부서번호</th>
												<th width="20%">부서이름</th>
												<th width="60%">사업장</th>
												<th width="10%">지 역</th>
												<th width="5%">기 능</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="departmentmgmt" items="${departmentmgmt }">
												<tr class="commonDetailTable">
													<td class="text-bold-500">${departmentmgmt.cod}</td>
													<td>${departmentmgmt.name}</td>
													<td class="text-bold-500">${departmentmgmt.wrkname}</td>
													<td>${departmentmgmt.location}</td>
													<td>
														<div class="btn-group">
															<button type="button"
																class="btn btn-primary dropdown-toggle"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-gear"></i>
															</button>
															<ul class="dropdown-menu">
																<li><a class="dropdown-item"
																	href="deptmgmtupdate?cod=${departmentmgmt.cod}">수정</a></li>
																<li><a class="dropdown-item"
																	href="deptmgmtdeletefn?cod=${departmentmgmt.cod}">삭제</a></li>
															</ul>
														</div>
													</td>
												</tr>
											</c:forEach>
											<c:if test="${empty departmentmgmt}">
												<tr>
													<td colspan="5" class="text-center">데이터가 존재하지 않습니다.</td>
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
							<li
								class="page-item <c:if test='${startPage == 1}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${startPage > 1}'>?page=${startPage - 10}&searchCod=${searchVO.searchCod}&searchName=${searchVO.searchName}&searchWrkName=${searchVO.searchWrkName}&searchLocation=${searchVO.searchLocation}</c:if>">이전
									10 페이지</a>
							</li>

							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li
									class="page-item <c:if test='${i == currentPage}'>active</c:if>">
									<a class="page-link"
									href="?page=${i}&searchCod=${searchVO.searchCod}&searchName=${searchVO.searchName}&searchWrkName=${searchVO.searchWrkName}&searchLocation=${searchVO.searchLocation}">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item <c:if test='${endPage == totalPages}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${endPage < totalPages}'>?page=${endPage + 1}&searchCod=${searchVO.searchCod}&searchName=${searchVO.searchName}&searchWrkName=${searchVO.searchWrkName}&searchLocation=${searchVO.searchLocation}</c:if>">다음
									10 페이지</a>
							</li>
						</ul>
					</nav>

					<!-- 페이지네이션 END -->
					<div class="d-flex"
						style="padding-bottom: 0.5rem; padding-top: 0.5rem;">
						<div class="col-md-6">
							<button type="button" class="btn btn-primary">
								<a href="deptmgmtinsert" style="color: white">등록</a>
							</button>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 부서 관리 테이블 END -->
	<!-- 2024년 5월 5일 오전 7시 47분 추가  -->
	<!-- 초기화 버튼 작동 자바스크립트  -->
	<script type="text/javascript">
		function resetSearchForm() {
			$('#searchCod').val('');
			$('#searchName').val('');
			$('#searchWrkName').val('');
			$('#searchLocation').val('');
		}
	</script>
	<!-- 상세페이지 모달 END  -->
</body>
</html>
