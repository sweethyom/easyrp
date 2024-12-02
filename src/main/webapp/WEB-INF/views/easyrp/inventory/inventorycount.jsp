<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<!-- inventorycount START -->
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
							<a href="/easyrp/inventorycount">재고 실사 현황</a>
						</h3>

					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">재고 실사</li>
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
											<form id="searchForm" action="inventorycount" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr>
															<td width="100">실사 번호</td>
															<td>
																<input type="text" id="searchCod" name="searchCod" class="form-control" value="${searchVO.searchCod}" placeholder="실사 번호를 입력해주세요." />
															</td>
															<td width="100">창고</td>
															<td>
																<input type="text" id="searchWarehouse" name="searchWarehouse" class="form-control" value="${searchVO.searchWarehouse}" placeholder="창고를 입력해주세요." />
															</td>
															<td width="100">품명</td>
															<td>
																<input type="text" id="searchProduct" name="searchProduct" class="form-control" value="${searchVO.searchProduct}" placeholder="품명를 입력해주세요." />
															</td>
															<td width="100">자재명</td>
															<td>
																<input type="text" id="searchInventory" name="searchInventory" class="form-control" value="${searchVO.searchInventory}" placeholder="자재명을 입력해주세요." />
															</td>
															<td width="100">담당자</td>
															<td>
																<input type="text" id="searchEmployee" name="searchEmployee" class="form-control" value="${searchVO.searchEmployee}" placeholder="담당자명을 입력해주세요." />
															</td>
															
														</tr>
														<tr>
															<td width="100">검색 날짜</td>
															<td colspan="3"><input type="date"
																id="preSearchDate" name="preSearchDate"
																value="${searchVO.preSearchDate}" class="form-control"
																style="width: 47%; float: left" /> <span><i
																	class="fa-solid fa-arrow-right"
																	style="margin-top: 10px"></i></span> <input type="date"
																id="postSearchDate" name="postSearchDate"
																value="${searchVO.postSearchDate}" class="form-control"
																style="width: 47%; float: right" /></td>
														</tr>
													</table>
												</div>
												<input type="hidden" name="offset" value="${searchVO.offset}" /> <input
													type="hidden" name="size" value="${searchVO.pageSize}" />
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
												<th>실사번호</th>
												<th>실사일자</th>
												<th>재고기준일</th>
												<th>창고</th>
												<th>장소</th>
												<th>실사구분</th>
												<th>담당자</th>
												<th>처리구분</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${not empty inventoryCountList}">
											<c:forEach var="inventoryCountList" items="${inventoryCountList}">
												<tr onclick="countdetailpage('${inventoryCountList.cod}')">
													<td class="text-bold-500" >${inventoryCountList.cod }</td>
													<td><fmt:formatDate value="${inventoryCountList.countDate}" pattern="yyyy-MM-dd"/></td>
													<td class="text-bold-500"><fmt:formatDate value="${inventoryCountList.invDate}" pattern="yyyy-MM-dd"/></td>
													<td>${inventoryCountList.warehouse}</td>
													<td>${inventoryCountList.location}</td>
													<td>${inventoryCountList.countclass}</td>
													<td>${inventoryCountList.employee}</td>
													<td>${inventoryCountList.prcClass }</td>
													<td>
														
													</td>
												</tr>
											</c:forEach>
											</c:if>
											<c:if test="${empty inventoryCountList}">
											<tr>
												<td colspan='8' style="text-align:center">실사기록이 없습니다.</td>
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
								href="<c:if test='${startPage > 1}'>?page=${startPage - 10}&searchCod=${searchVO.searchCod}&searchWarehouse=${searchVO.searchWarehouse}&searchProduct=${searchVO.searchProduct}&searchLocation=${searchVO.searchLocation}&searchInventory=${searchVO.searchInventory}&searchCountClass=${searchVO.searchCountClass}&searchEmployee=${searchVO.searchEmployee}&searchAccount=${searchVO.searchAccount}&preSearchDate=${searchVO.preSearchDate}&postSearchDate=${searchVO.postSearchDate}</c:if>">이전
									10 페이지</a>
							</li>

							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li
									class="page-item <c:if test='${i == currentPage}'>active</c:if>">
									<a class="page-link"
									href="?page=${i}&searchCod=${searchVO.searchCod}&searchWarehouse=${searchVO.searchWarehouse}&searchProduct=${searchVO.searchProduct}&searchLocation=${searchVO.searchLocation}&searchInventory=${searchVO.searchInventory}&searchCountClass=${searchVO.searchCountClass}&searchEmployee=${searchVO.searchEmployee}&searchAccount=${searchVO.searchAccount}&preSearchDate=${searchVO.preSearchDate}&postSearchDate=${searchVO.postSearchDate}">${i}</a>
								</li>
							</c:forEach>
							<li
								class="page-item <c:if test='${endPage == totalPages}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${endPage < totalPages}'>?page=${endPage + 1}&searchCod=${searchVO.searchCod}&searchWarehouse=${searchVO.searchWarehouse}&searchProduct=${searchVO.searchProduct}&searchLocation=${searchVO.searchLocation}&searchInventory=${searchVO.searchInventory}&searchCountClass=${searchVO.searchCountClass}&searchEmployee=${searchVO.searchEmployee}&searchAccount=${searchVO.searchAccount}&preSearchDate=${searchVO.preSearchDate}&postSearchDate=${searchVO.postSearchDate}</c:if>">다음
									10 페이지</a>
							</li>
						</ul>
					</nav>

					<!-- 페이지네이션 END -->
					<div class="d-flex"
						style="padding-bottom: 0.5rem; padding-top: 0.5rem;">
						<div class="col-md-6">
							<button type="button" class="btn btn-primary">
								<a href="inventorycountinsert" style="color: white">등록</a>
							</button>
						</div>
						<form action="inventorycountdelivr" method="post" name="countdelivr" id="countdelivr">
							<input type="hidden" name="detailkey" id="hiddendetailkey" />
						</form>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 공통 사용 테이블 END -->
	    <script type="text/javascript">
        function resetSearchForm() {
            $('#searchCod').val('');
            $('#searchWarehouse').val('');
            $('#searchProduct').val('');
            $('#searchInventory').val('');
            $('#searchEmployee').val('');
            $('#preSearchDate').val('');
            $('#postSearchDate').val('');
            
        }

        function countdetailpage(key){
        	$("#hiddendetailkey").val(key);
        	$("#countdelivr").submit();
        }
        
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
	</script>
</body>
</html>
