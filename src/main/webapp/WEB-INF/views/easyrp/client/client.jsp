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
	<!-- ( 2024년 5월 7일 오전 9시 33분 박현우 ) -->
	<!-- 거래처 관리 테이블 START -->
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
							<a href="client">거래처 관리</a>
						</h3>
						<p class="text-subtitle text-muted">거래처 관리를 할 수 있는 현황판</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">거래처
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
											<form id="searchForm" action="client" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr class="text-center">
															<td width="8%">거래처번호</td>
															<td><input type="text" id="searchCod"
																name="searchCod" class="form-control"
																value="${searchVO.searchCod}"
																placeholder="거래처 번호를 입력해주세요." /></td>
															<td width="6%">거래처명</td>
															<td><input type="text" id="searchName"
																name="searchName" class="form-control"
																value="${searchVO.searchName}"
																placeholder="거래처명을 입력해주세요." /></td>
															<td width="5%">주소</td>
															<td><input type="text" id="searchAddress"
																name="searchAddress" class="form-control"
																value="${searchVO.searchAddress}"
																placeholder="거래처가 위치하는 주소를 입력해주세요." /></td>
														</tr>
														<tr class="text-center">
															<td width="8%">대표자명</td>
															<td><input type="text" id="searchRepresentative"
																name="searchRepresentative" class="form-control"
																value="${searchVO.searchRepresentative}"
																placeholder="거래처 번호를 입력해주세요." /></td>
															<td width="6%">담당자명</td>
															<td><input type="text" id="searchManagerName"
																name="searchManagerName" class="form-control"
																value="${searchVO.searchManagerName}"
																placeholder="거래처 담당자명을 입력해주세요." /></td>
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
												<th width="3%">거래처번호</th>
												<th width="20%">거래처명</th>
												<th width="5%">대표자명</th>
												<th width="5%">담당자 전화번호</th>
												<th width="5%">기 능</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="client" items="${client}">
												<tr class="commonDetailTable">
													<td class="text-bold-500">${client.cod}</td>
													<td>${client.name}</td>
													<td class="text-bold-500">${client.representative}</td>
													<td>${client.managerTel }</td>
													<td>
														<div class="btn-group">
															<button type="button"
																class="btn btn-primary dropdown-toggle"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-gear"></i>
															</button>
															<ul class="dropdown-menu">
																<li><a class="dropdown-item"
																	href="clientupdate?cod=${client.cod}">수정</a></li>
																<li><a class="dropdown-item"
																	href="clientdeletefn?cod=${client.cod}">삭제</a></li>
															</ul>
														</div>
													</td>
												</tr>
											</c:forEach>
											<c:if test="${empty client}">
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
								href="<c:if test='${startPage > 1}'>?page=${startPage - 10}&searchRepresentative=${searchVO.searchRepresentative }&searchCod=${searchVO.searchCod}&searchName=${searchVO.searchName}&searchAddress=${searchVO.searchAddress}&searchManagerName=${searchVO.searchManagerName }</c:if>">이전
									10 페이지</a>
							</li>

							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li
									class="page-item <c:if test='${i == currentPage}'>active</c:if>">
									<a class="page-link"
									href="?page=${i}&searchCod=${searchVO.searchCod}&searchRepresentative=${searchVO.searchRepresentative }&searchName=${searchVO.searchName}&searchAddress=${searchVO.searchAddress}&searchManagerName=${searchVO.searchManagerName }">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item <c:if test='${endPage == totalPages}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${endPage < totalPages}'>?page=${endPage + 1}&searchCod=${searchVO.searchCod}&searchRepresentative=${searchVO.searchRepresentative }&searchName=${searchVO.searchName}&searchAddress=${searchVO.searchAddress}&searchManagerName=${searchVO.searchManagerName }</c:if>">다음
									10 페이지</a>
							</li>
						</ul>
					</nav>

					<!-- 페이지네이션 END -->
					<div class="d-flex"
						style="padding-bottom: 0.5rem; padding-top: 0.5rem;">
						<div class="col-md-6">
							<button type="button" class="btn btn-primary">
								<a href="clientinsert" style="color: white">등록</a>
							</button>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 거래처 관리 테이블 END -->
	<!-- 2024년 5월 5일 오전 7시 47분 추가  -->
	<!-- 초기화 버튼 작동 자바스크립트  -->
	<script type="text/javascript">
		function resetSearchForm() {
			$('#searchCod').val('');
			$('#searchName').val('');
			$('#searchAddress').val('');
			$('#searchManagerName').val('');
			$('#searchRepresentative').val('');
		}
	</script>
</body>
</html>
