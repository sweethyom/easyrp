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
	<!-- (2024년 4월 30일 추가 박현우) -->
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
							<a href="/easyrp/inventory">재고 현황</a>
						<button type="button" id="btnInventoryList"class="btn btn-primary" >자재</button>
						<button type="button" id="btnProductList" class="btn btn-primary">완제품</button>
						</h3>
						<p class="text-subtitle text-muted">재고 현황</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">재고 현황</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="row" id="table-hover-row">
					<div id="inventorySection">
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
											<form id="searchForm" action="inventory" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr>
															<td width="100">재고 코드</td>
															<td><input type="text" id="cod"
																name="cod" class="form-control"
																value="${cod}" placeholder="재고 코드를 입력해주세요." /></td>
															<td width="100">창고</td>
															<td><input type="text" id="warehouse"
																name="warehouse" class="form-control"
																value="${warehouse}" placeholder="창고를 입력해주세요." /></td>
															<td width="100">담당자</td>
															<td><input type="text" id="employee"
																name="employee" class="form-control"
																value="${employee}" placeholder="담당자를 입력해주세요." /></td>
															<td width="100">계정</td>
															<td><input type="text" id="account"
																name="account" class="form-control"
																value="${account}" placeholder="계정을 입력해주세요." /></td>
														</tr>
														<tr>
															<td width="100">재고기준일</td>
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
												<th>재고코드</th>
												<th>품명</th>
												<th>단위(재고)</th>
												<th>단가</th>
												<th>현재고수량</th>
												<th>현재고금액</th>
												<th>안전재고량</th>
												<th>가용재고량</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${not empty inventoryList}">
											<c:forEach var="inventoryList" items="${inventoryList }">
												<c:set var="availableQty" value="${inventoryList.curInvQty-inventoryList.safetyInvQty}" />
												<tr>
													<td class="text-bold-500">${inventoryList.cod }</td>
													<td>${inventoryList.name }</td>
													<td class="text-bold-500">${inventoryList.unit }</td>
													<td>${inventoryList.unitprice }</td>
													<td>${inventoryList.curInvQty }</td>
													<td>${inventoryList.curInvPrice }</td>
													<td>${inventoryList.safetyInvQty }</td>
													<td class="availableQty">${availableQty }</td>
												</tr>
											</c:forEach>
											</c:if>
											<c:if test="${empty inventoryList}">
											<tr>
												<td colspan="4">해당 재고가 없습니다.</td>
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
							<c:if test="${empty inventoryList}">
							<tr>
							</c:if>
							<c:if test="${not empty inventoryList}">
							<li
								class="page-item <c:if test='${startPage == 1}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${startPage > 1}'>?page=${startPage - 10}&size=${pageSize}&searchNumber=${param.searchNumber}&searchTitle=${param.searchTitle}&searchContent=${param.searchContent}&searchAuthor=${param.searchAuthor}&preSearchDate=${param.preSearchDate}&postSearchDate=${param.postSearchDate}</c:if>">이전
									10 페이지</a>
							</li>

							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li
									class="page-item <c:if test='${i == currentPage}'>active</c:if>">
									<a class="page-link"
									href="?page=${i}&size=${pageSize}&searchNumber=${param.searchNumber}&searchTitle=${param.searchTitle}&searchContent=${param.searchContent}&searchAuthor=${param.searchAuthor}&preSearchDate=${param.preSearchDate}&postSearchDate=${param.postSearchDate}">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item <c:if test='${endPage == totalPages}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${endPage < totalPages}'>?page=${endPage + 1}&size=${pageSize}&searchNumber=${param.searchNumber}&searchTitle=${param.searchTitle}&searchContent=${param.searchContent}&searchAuthor=${param.searchAuthor}&preSearchDate=${param.preSearchDate}&postSearchDate=${param.postSearchDate}</c:if>">다음
									10 페이지</a>
							</li>
							</c:if>	
						</ul>
					</nav>
					<!-- 페이지네이션 END -->
					</div>
					<div id="productSection" style="display:none">
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
											<form id="searchForm" action="inventory" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr>
															<td width="100">재고 코드</td>
															<td><input type="text" id="cod"
																name="cod" class="form-control"
																value="${cod}" placeholder="재고 코드를 입력해주세요." /></td>
															<td width="100">창고</td>
															<td><input type="text" id="warehouse"
																name="warehouse" class="form-control"
																value="${warehouse}" placeholder="창고를 입력해주세요." /></td>
															<td width="100">담당자</td>
															<td><input type="text" id="employee"
																name="employee" class="form-control"
																value="${employee}" placeholder="담당자를 입력해주세요." /></td>
															<td width="100">계정</td>
															<td><input type="text" id="account"
																name="account" class="form-control"
																value="${account}" placeholder="계정을 입력해주세요." /></td>
														</tr>
														<tr>
															<td width="100">재고기준일</td>
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
												<th>재고코드</th>
												<th>품명</th>
												<th>단위(재고)</th>
												<th>단가</th>
												<th>현재고수량</th>
												<th>현재고금액</th>
												<th>안전재고량</th>
												<th>가용재고량</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${not empty productList}">
											<c:forEach var="productList" items="${productList }">
												<c:set var="availablePrdQty" value="${productList.curInvQty-productList.safteyInvQty}" />
												<tr>
													<td class="text-bold-500">${productList.cod }</td>
													<td>${productList.prodname }</td>
													<td class="text-bold-500">${productList.unit }</td>
													<td>${productList.unitprice }</td>
													<td>${productList.curInvQty }</td>
													<td>${productList.curInvPrice }</td>
													<td>${productList.safteyInvQty }</td>
													<td class="availablePrdQty">${availablePrdQty }</td>
												</tr>
											</c:forEach>
											</c:if>
											<c:if test="${empty productList}">
											<tr>
												<td colspan="4">해당 재고가 없습니다.</td>
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
							<c:if test="${empty productList}">
							<tr>
							</c:if>
							<c:if test= "${not empty productList}">
							<li
								class="page-item <c:if test='${startPage == 1}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${startPage > 1}'>?page=${startPage - 10}&size=${pageSize}&cod=${param.cod}&warehouse=${param.warehouse}&employee=${param.employee}&account=${param.account}&preSearchDate=${param.preSearchDate}&postSearchDate=${param.postSearchDate}</c:if>">이전
									10 페이지</a>
							</li>

							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li
									class="page-item <c:if test='${i == currentPage}'>active</c:if>">
									<a class="page-link"
									href="?page=${startPage - 10}&size=${pageSize}&cod=${param.cod}&warehouse=${param.warehouse}&employee=${param.employee}&account=${param.account}&preSearchDate=${param.preSearchDate}&postSearchDate=${param.postSearchDate}">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item <c:if test='${endPage == totalPages}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${endPage < totalPages}'>?page=${startPage - 10}&size=${pageSize}&cod=${param.cod}&warehouse=${param.warehouse}&employee=${param.employee}&account=${param.account}&preSearchDate=${param.preSearchDate}&postSearchDate=${param.postSearchDate}</c:if>">다음
									10 페이지</a>
							</li>
							</c:if>
						</ul>
					</nav>
					<!-- 페이지네이션 END -->
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 공통 사용 테이블 END -->
      
      	<!-- 공통 수정 테이블 END -->
	<script type="text/javascript">
    /* valueModal START */
    function setValue(cod, value) {
       $('#modalInput').val(value);
       $('#kvModal').modal('hide');
       $('.modal-backdrop').remove();
    }

    $(document).ready(function () {
       $('#loadValues').on('click', function () {
          $.ajax({
             url: 'api/get-kv',
             method: 'GET',
             success: function (data) {
                let rows = '';
                data.forEach(function (item) {
                   if (item.id && item.cod) {
                      rows +=
                         '<tr onclick="setValue(\'' +
                         item.cod +
                         "', '" +
                         item.value +
                         '\')" ' +
                         'class="searchValue" data-cod="' +
                         item.cod +
                         '" data-value="' +
                         item.value +
                         '" style= "' +
                         'cursor: pointer' +
                         '">' +
                         '<td>' +
                         item.id +
                         '</td>' +
                         '<td>' +
                         item.cod +
                         '</td>' +
                         '<td>' +
                         item.value +
                         '</td>' +
                         '</tr>';
                   }
                });
                $('#modalTableBody').html(rows);
                $('#kvModal').modal('show');
             },
          });
       });

       $('#searchInput').on('keyup', function () {
          var searchInputVlaue = $(this).val().toLowerCase()
          $('.searchValue').each(function () {
             var cod = $(this).data('cod').toLowerCase()
             var value = $(this).data('value').toLowerCase()
             $(this).toggle(cod.includes(searchInputVlaue) || value.includes(searchInputVlaue));
          });
       });
    });
    /* valueModal END */
        function resetSearchForm() {
            $('#cod').val('');
            $('#warehouse').val('');
            $('#employee').val('');
            $('#account').val('');
            $('#preSearchDate').val('');
            $('#postSearchDate').val('');
            
        }

      // AJAX를 사용하지 않고, 원래 있던 코드로 display + 세션스토리 사용해서 간단히 게시판 따로 보여주기 구현
      document.addEventListener('DOMContentLoaded', function () {
        var activeSection = sessionStorage.getItem('activeSection');

        // 기본값 설정
        if (!activeSection) {
          activeSection = 'inventoryList';
          sessionStorage.setItem('activeSection', 'inventoryList');
        }

        showSection(activeSection);

        document.getElementById('btnInventoryList').addEventListener('click', function () {
          showSection('inventoryList');
        });

        document.getElementById('btnProductList').addEventListener('click', function () {
          showSection('productList');
        });
      });
      
      //페이지 이동 전 스크롤 위치를 저장하는 함수
      function saveScrollPosition() {
        var scrollPosition = window.scrollY || document.documentElement.scrollTop;
        sessionStorage.setItem('scrollPosition', scrollPosition);
      }

      //페이지 이동 후, 스크롤 위치를 저장된 위치로 이동시키는 함수
      function restoreScrollPostion() {
        var scrollPosition = sessionStorage.getItem('scrollPosition');
        if (scrollPosition !== null) {
          window.scrollTo({
            top: scrollPosition,
            behavior: 'auto',
          });
          sessionStorage.removeItem('scrollPosition');
        }
      }
      // display 보여주고 세션스토리지 사용해서 담아두기
      function showSection(section) {
        var inventorySection = document.getElementById('inventorySection');
        var productSection = document.getElementById('productSection');

        inventorySection.style.display = 'none';
        productSection.style.display = 'none';

        if (section === 'inventoryList') {
          inventorySection.style.display = 'block';
          sessionStorage.setItem('activeSection', 'inventoryList');
        } else if (section === 'productList') {
          productSection.style.display = 'block';
          sessionStorage.setItem('activeSection', 'productList');
        }
      }
    </script>
</body>
</html>
