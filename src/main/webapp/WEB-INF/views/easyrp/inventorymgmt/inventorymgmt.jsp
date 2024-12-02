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
	<!-- ( 2024년 5월 12일 오후 6시 52분 박현우 ) -->
	<!-- 자재 관리 테이블 START -->
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
							<a href="inventorymgmt">자재 관리</a>
						</h3>
						<p class="text-subtitle text-muted">자재 관리를 할 수 있는 현황판</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">자재
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
											<form id="searchForm" action="inventorymgmt" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr class="text-center">
															<td width="8%">자재번호</td>
															<td><input type="text" id="searchCod"
																name="searchCod" class="form-control"
																value="${searchVO.searchCod}"
																placeholder="자재번호를 입력해주세요." />
															</td>
															<td width="6%">자재명</td>
															<td><input type="text" id="searchName"
																name="searchName" class="form-control"
																value="${searchVO.searchName}"
																placeholder="자재명을 입력해주세요." />
															</td>
															<td width="5%">창고명</td>
															<td><input type="text" id="searchWarehouseName"
																name="searchWarehouseName" class="form-control"
																value="${searchVO.searchWarehouseName}"
																placeholder="자재가 있는 창고명을 입력해주세요." />
															</td>
														</tr>
														<tr class="text-center">
															<td width="6%">자재 그룹</td>
															<td colspan="3"><input type="text"
																id="searchProductGroupName"
																name="searchProductGroupName" class="form-control"
																value="${searchVO.searchProductGroupName}"
																style="width: 70%; float: left"
																placeholder="자재 그룹을 우측 버튼을 이용하거나 직접 입력해주세요." />
																<button type="button" class="btn btn-primary"
																	id="prodGroupSearchModalBtn" data-bs-toggle="modal"
																	data-bs-target="#loadModal" style="width: 15%"
																	onclick="searchProductGroupModal()">
																	자재 그룹 조회</button></td>
															<td width="5%">사원 코드</td>
															<td><input type="text" id="searchEmployeeCod"
																name="searchEmployeeCod" class="form-control"
																value="${searchVO.searchEmployeeCod}"
																placeholder="자재 등록 사원 코드를 입력해주세요." />
															</td>
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
												<th width="5%">자재번호</th>
												<th width="40%">자재명</th>
												<th width="15%">자재그룹</th>
												<th width="10%">자재창고</th>
												<th width="5%">개 수</th>
												<th width="5%">기 능</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="inventoryMgmt" items="${inventoryMgmt}">
												<tr class="commonDetailTable">
													<td class="text-bold-500">${inventoryMgmt.cod}</td>
													<td>${inventoryMgmt.name}</td>
													<td class="text-bold-500">${inventoryMgmt.productGroupName}</td>
													<td>${inventoryMgmt.warehouseName }</td>
													<td>${inventoryMgmt.curInvQty }${inventoryMgmt.unitName }</td>
													<td>
														<div class="btn-group">
															<button type="button"
																class="btn btn-primary dropdown-toggle"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-gear"></i>
															</button>
															<ul class="dropdown-menu">
																<li><a class="dropdown-item"
																	href="inventorymgmtupdate?cod=${inventoryMgmt.cod}">수정</a>
																</li>
																<li><a class="dropdown-item"
																	href="inventorymgmtdeletefn?cod=${inventoryMgmt.cod}">삭제</a>
																</li>
															</ul>
														</div>
													</td>
												</tr>
											</c:forEach>
											<c:if test="${empty inventoryMgmt}">
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
								href="<c:if test='${startPage > 1}'>?page=${startPage - 10}&searchCod=${searchVO.searchCod }&searchName=${searchVO.searchName}&searchWarehouseName=${searchVO.searchWarehouseName}
								&searchProductGroupName=${searchVO.searchProductGroupName }&searchEmployeeCod=${searchVO.searchEmployeeCod }</c:if>">이전
									10 페이지</a>
							</li>

							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li
									class="page-item <c:if test='${i == currentPage}'>active</c:if>">
									<a class="page-link"
									href="?page=${i}&searchCod=${searchVO.searchCod }&searchName=${searchVO.searchName}&searchWarehouseName=${searchVO.searchWarehouseName}
								&searchProductGroupName=${searchVO.searchProductGroupName }&searchEmployeeCod=${searchVO.searchEmployeeCod }">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item <c:if test='${endPage == totalPages}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${endPage < totalPages}'>?page=${endPage + 1}&searchCod=${searchVO.searchCod }&searchName=${searchVO.searchName}&searchWarehouseName=${searchVO.searchWarehouseName}
								&searchProductGroupName=${searchVO.searchProductGroupName }&searchEmployeeCod=${searchVO.searchEmployeeCod }</c:if>">다음
									10 페이지</a>
							</li>
						</ul>
					</nav>

					<!-- 페이지네이션 END -->
					<div class="d-flex"
						style="padding-bottom: 0.5rem; padding-top: 0.5rem">
						<div class="col-md-6">
							<button type="button" class="btn btn-primary">
								<a href="inventorymgmtinsert" style="color: white">등록</a>
							</button>
							<button type="button" class="btn btn-primary">
								<a id="unitmgmt" data-bs-toggle="modal"
									data-bs-target="#loadModal" href="javascript:void(0);"
									onclick="unitModal();" role="button" style="color: white">단위
									관리</a>
							</button>
							<button type="button" class="btn btn-primary">
								<a id="productGroupmgmt" data-bs-toggle="modal"
									data-bs-target="#loadModal" href="javascript:void(0);"
									onclick="productGroupModal();" role="button"
									style="color: white">자재 그룹
									관리</a>
							</button>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>

	<!-- 공통 Modal START  -->
	<div class="modal fade" id="loadModal" tabindex="-1"
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="loadModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	<!-- 공통 Modal END  -->

	<!-- 자재 관리 테이블 END -->
	<!-- 2024년 5월 5일 오전 7시 47분 추가  -->
	<!-- 초기화 버튼 작동 자바스크립트  -->
	<script type="text/javascript">

         function unitModal() {
            $('.modal-content').load('unitmodal');
         }

         function productGroupModal() {
            $('.modal-content').load('productgroupmodal');
         }

         function searchProductGroupModal() {
            $('.modal-content').load('searchproductgroupmodal');
         }

         function resetSearchForm() {
            $('#searchCod').val('');
            $('#searchName').val('');
            $('#searchWarehouseName').val('');
            $('#searchProductGroupName').val('');
            $('#searchEmployeeCod').val('');
         }
      </script>
</body>
</html>
