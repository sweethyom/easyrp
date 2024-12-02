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
	<!-- ( 2024년 5월 8일 오전 9시 19분 박현우 ) -->
	<!-- 제품 관리 테이블 START -->
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
							<a href="productmgmt">제품 관리</a>
						</h3>
						<p class="text-subtitle text-muted">제품 관리를 할 수 있는 현황판</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">제품
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
											<form id="searchForm" action="productmgmt" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr class="text-center">
															<td width="8%">제품번호</td>
															<td><input type="text" id="searchCod"
																name="searchCod" class="form-control"
																value="${searchVO.searchCod}"
																placeholder="제품번호를 입력해주세요." /></td>
															<td width="6%">제품명</td>
															<td><input type="text" id="searchName"
																name="searchName" class="form-control"
																value="${searchVO.searchName}"
																placeholder="제품명을 입력해주세요." /></td>
															<td width="5%">창고명</td>
															<td><input type="text" id="searchWarehouseName"
																name="searchWarehouseName" class="form-control"
																value="${searchVO.searchWarehouseName}"
																placeholder="제품이 있는 창고명을 입력해주세요." /></td>
														</tr>
														<tr class="text-center">
															<td width="6%">제품 그룹</td>
															<td colspan="3"><input type="text"
																id="searchProductGroupName"
																name="searchProductGroupName" class="form-control"
																value="${searchVO.searchProductGroupName}"
																style="width: 70%; float: left"
																placeholder="제품 그룹을 우측 버튼을 이용하거나 직접 입력해주세요." />
																<button type="button" class="btn btn-primary"
																	id="prodGroupSearchModalBtn" data-bs-toggle="modal"
																	data-bs-target="#productGroupSearchModal"
																	style="width: 15%"
																	onclick="loadProductGroupSearchData()">제품 그룹
																	조회</button></td>
															<td width="5%">사원 코드</td>
															<td><input type="text" id="searchEmployeeCod"
																name="searchEmployeeCod" class="form-control"
																value="${searchVO.searchEmployeeCod}"
																placeholder="제품 등록 사원 코드를 입력해주세요." /></td>
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
												<th width="5%">제품번호</th>
												<th width="25%">제품명</th>
												<th width="10%">BOM 등록 유무</th>
												<th width="15%">제품그룹</th>
												<th width="10%">제품창고</th>
												<th width="5%">개 수</th>
												<th width="5%">기 능</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="productmgmt" items="${productMgmt}">
												<tr class="commonDetailTable">
													<td class="text-bold-500">${productmgmt.cod}</td>
													<td>${productmgmt.prodname}</td>
													<th width="5%">${productmgmt.isBominsert }</th>
													<td class="text-bold-500">${productmgmt.prodGroupName}</td>
													<td>${productmgmt.warehouseName }</td>
													<td>${productmgmt.curInvQty }</td>
													<td>
														<div class="btn-group">
															<button type="button"
																class="btn btn-primary dropdown-toggle"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-gear"></i>
															</button>
															<ul class="dropdown-menu">
																<li><a class="dropdown-item"
																	href="productmgmtupdate?cod=${productmgmt.cod}">수정</a>
																</li>
																<li><a class="dropdown-item"
																	href="productmgmtdeletefn?cod=${productmgmt.cod}">삭제</a>
																</li>
																<li><a class="dropdown-item"
																	href="bomdetail?prodCod=${productmgmt.cod}">상세페이지</a></li>
															</ul>
														</div>
													</td>
												</tr>
											</c:forEach>
											<c:if test="${empty productMgmt}">
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
								href="<c:if test='${endPage < totalPages}'>?page=${endPage + 1}&&searchCod=${searchVO.searchCod }&searchName=${searchVO.searchName}&searchWarehouseName=${searchVO.searchWarehouseName}
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
								<a href="productmgmtinsert" style="color: white">등록</a>
							</button>
							<button type="button" class="btn btn-primary">
								<a href="bominsert" style="color: white">BOM 등록</a>
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
			<div class="modal-content">
				<!-- 여기에 값이 들어갑니다. -->
			</div>
		</div>
	</div>
	<!-- 공통 Modal END  -->

	<!-- 원자재 선택 Modal START  -->
	<div class="modal fade" id="inventoryModal" tabindex="-1"
		aria-labelledby="inventoryModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inventoryModalLabel">코드-원자재 선택</h5>
					<input type="text" id="inventorySearchInput" class="form-control"
						placeholder="코드 또는 상품명을 입력해주세요."
						style="margin-left: 10px; width: auto; flex-grow: 1" />
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Code</th>
								<th scope="col">상품 명</th>
							</tr>
						</thead>
						<tbody id="modalTableBody">
							<!-- 여기에 Ajax로 만든 html 속성이 들어감  -->
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 원자재 선택 Modal END  -->


	<!-- 제품 그룹 조회 Modal START  -->
	<div class="modal fade" id="productGroupSearchModal" tabindex="-1"
		aria-labelledby="productGroupSearchModalLabel" aria-hidden="true"
		data-bs-backdrop="static" data-bs-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="productGroupSearchModalLabel">제품
						그룹 목록</h5>
					<input type="text" id="productGroupSearchInput"
						class="form-control" placeholder="검색어를 입력해주세요."
						style="margin-left: 10px; width: auto; flex-grow: 1" />
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body overflow-y-auto" style="height: 60vh">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">제품 그룹 코드</th>
								<th scope="col">제품 그룹명</th>
							</tr>
						</thead>
						<tbody id="productGroupModalBody">
							<!-- 여기에 Ajax로 만든 html 속성이 들어감  -->
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 제품 그룹 조회 Modal END  -->

	<!-- 제품 그룹 CRUD Modal START  -->
	<div class="modal fade" id="productGroupMgmtModal" tabindex="-1"
		aria-labelledby="productGroupMgmtModalLabel" aria-hidden="true"
		data-bs-backdrop="static" data-bs-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="productGroupMgmtModalLabel">제품 그룹
						목록</h5>
					<input type="text" id="productGroupSearchInput"
						class="form-control" placeholder="검색어를 입력해주세요."
						style="margin-left: 10px; width: auto; flex-grow: 1" />
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">제품 그룹 코드</th>
								<th scope="col">제품 그룹명</th>
							</tr>
						</thead>
						<tbody id="productGroupModalBody">
							<!-- 여기에 Ajax로 만든 html 속성이 들어감  -->
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 제품 그룹 조회 Modal END  -->



	<!-- 제품 관리 테이블 END -->



	<!-- 2024년 5월 5일 오전 7시 47분 추가  -->
	<!-- 초기화 버튼 작동 자바스크립트  -->
	<script type="text/javascript">
	
    function unitModal() {
        $('.modal-content').load('unitmodal');
     }

     function productGroupModal() {
        $('.modal-content').load('productgroupmodal');
     }
	
         // 예시: 제품 상세 정보를 가져오는 함수
         const getProductDetails = (productCod) => {
            $.ajax({
               url: 'api/get-productdata',
               type: 'GET',
               data: { productCod: productCod },
               dataType: 'json',
               success: (response) => {
                  populateProductDetails(response);
               },
               error: (xhr, status, error) => {
                  console.error('실패', error);
               },
            });
         };

         // 예시: 제품 상세 정보를 화면에 표시하는 함수
         const populateProductDetails = (details) => {
            const detailList = $('#detailList');
            let totalPrice = 0,
               totalVat = 0,
               totalSum = 0;

            $('#productCod').text(details.productCod);
            $('#productName').text(details.productName);
            $('#warehouseName').text(details.warehouseName);
            $('#deptName').text(details.deptName);
            $('#empCod').text(details.empCod);
            $('#empName').text(details.empName);

            details.forEach((item) => {
               const totalPriceItem = item.unitprice * item.qty;
               const vat = Math.floor(totalPriceItem * 0.1);
               const totalItem = totalPriceItem + vat;

               totalPrice += totalPriceItem;
               totalVat += vat;
               totalSum += totalItem;

               const newRow = $(`
	            <tr class="generatedRow">
	                <td>${item.productCod}</td>
	                <td>${item.prodName}</td>
	                <td><input type="number" id="qty_${item.num}" readonly class="form-control" value="${
                  item.qty
               }" style="width: 120px;"></td>
	                <td>${item.unitprice.toLocaleString()}</td>
	                <td>${totalPriceItem.toLocaleString()}</td>
	                <td>${vat.toLocaleString()}</td>
	                <td>${totalItem.toLocaleString()}</td>
	                <td>
	                    <div>
	                        <button class="btn btn-primary" onclick="editProduct(${item.num}, ${item.productCod}, ${
                  details[0].cod
               })" style="margin-right: 2px;">수정</button>
	                        <button class="btn btn-primary" onclick="deleteProduct(${item.productCod}, ${
                  details[0].cod
               })">삭제</button>
	                    </div>
	                </td>
	            </tr>
	        `);
               detailList.after(newRow);
            });

            $('#totalprice').text(totalPrice.toLocaleString());
            $('#totalvax').text(totalVat.toLocaleString());
            $('#totalsum').text(totalSum.toLocaleString());
         };

         // 제품 수정 함수
         const editProduct = (num, productCod, estimateCod) => {
            const qty = $(`#qty_${num}`).val();
            $.ajax({
               url: 'estimateupdate',
               type: 'POST',
               data: { cod: estimateCod, qty: qty, num: num },
               dataType: 'json',
               success: (response) => {
                  console.log('수정 성공');
                  alert('수정이 완료되었습니다.');
                  $('.generatedRow').remove();
                  getProductDetails(estimateCod);
               },
               error: (xhr, status, error) => {
                  console.error('수정 실패', error);
               },
            });
         };

         // 제품 삭제 함수
         const deleteProduct = (productCod, estimateCod) => {
            $.ajax({
               url: 'estimatedetaildelete',
               type: 'POST',
               data: { productCod: productCod, cod: estimateCod },
               dataType: 'json',
               success: (response) => {
                  console.log('삭제 성공');
                  alert('삭제가 완료되었습니다.');
                  $('.generatedRow').remove();
                  getProductDetails(estimateCod);
               },
               error: (xhr, status, error) => {
                  console.error('삭제 실패', error);
               },
            });
         };

         // 모달 닫기 함수
         const closeModal = () => {
            $('#addColumnButton').prop('disabled', false);
         };

         /* 원자재 행 추가 START */
         function addColumn() {
            const newRowHtml = `
        <tr class="generatedRow">
            <td>
            	<input type="text" class="form-control hyunwoo-input-disabled" name="inventoryCod" id="inventoryCod" placeholder="원자재 코드" readonly>
            </td>
            <td>
                <input type="text" readonly class="form-control" id="inventoryName" placeholder="원자재 선택" style="width: 140px;">
            </td>
            <td>
                <input type="number" class="form-control" name="inventoryQty" id="inventoryQty" placeholder="수량 입력" style="width: 120px;">
            </td>
            <td>--</td>
            <td>--</td>
            <td>--</td>
            <td>--</td>
            <td id="buttonrow">
                <div>
                    <button type="button" class="btn btn-primary" style="margin-right: 2px;">확인</button>
                    <button class="btn btn-primary">취소</button>
                </div>
            </td>
        </tr>
    `;

            const newRow = $(newRowHtml);

            newRow.find('input#inventoryName').on('click', function () {
               $('#inventoryModal').modal('show'); // 자식 모달 열기
               loadInventoryData();
            });

            /* 개별 등록 Ajax 호출 START */
            newRow.find('button:contains("확인")').on('click', function () {
               console.log('확인 버튼 누름');
               const prodCod = $('#productCod').text();
               const invCod = $('#inventoryCod').val();
               const quantity = $('#inventoryQty').val();

               insertAjax(prodCod, invCod, quantity);
            });
            /* 개별 등록 Ajax 호출 END */
            
         function insertAjax(prodCod, invCod, quantity) {
			$.ajax({
	    		url: 'bominsertfn',
	    		type: 'POST',
	    		data: {
	    			prodCod: prodCod,
	    			invCod: invCod,
	    			quantity: quantity,
	    		},
                success: function (response) {
                    if (response === 'complete') {
                    	console.log('BOM 항목이 추가되었습니다.');
                    	alert('BOM 항목이 추가되었습니다.');
                    	$('.generatedRow').remove();
                    	$('#addColumnButton').prop('disabled', false);
                    	estimateDetail(prodCod);
                    }
                 },
	    		error: function(xhr, status, error){
	    			console.error('같은 원자재가 이미 존재합니다.');
	    			alert('같은 원자재가 이미 존재합니다.');
	    		}
		    });		    	
		}

            /* 개별 취소 버튼 눌렀을 때, tr input 태그 삭제 START  */
            newRow.find('button:contains("취소")').on('click', function () {
               $(this).closest('tr').remove(); // 새로 추가된 행 삭제
               $('#addColumnButton').prop('disabled', false);
            });

            $('#detailList').after(newRow);

            $('#addColumnButton').prop('disabled', true);
            
            /* 개별 취소 버튼 눌렀을 때, tr input 태그 삭제 END  */
         }
         
         
         /* 원자재 행 추가 END */
        
            
         /* 원자재 모달 API DATA START */
         
         /* inventory setValue START */
         function inventorySetValue(cod, name) {
        	  $('#inventoryCod').val(cod);
              $('#inventoryName').val(name);
              $('#inventoryModal').modal('hide');
              $('.modal-backdrop').remove();
          }
         /* inventory setValue END */
         
			function loadInventoryData() {
				$.ajax({
					url: 'api/get-inventory',
					method: 'GET',
					success: function(data) {
						console.log(data);
						let rows = '';
						data.forEach(function(item, index) {
							if (item.cod && item.deleteyn === 'N') {
								rows += `<tr class="searchData hyunwoo-pointer" onclick="inventorySetValue('\${item.cod}', '\${item.name}')" data-cod="\${item.cod}" data-name="\${item.name}" >
									<td>\${item.cod}</td>
									<td class="hyunwoo-flex-wrap">
									<input type="text" class="form-control hyunwoo-input-disabled hyunwoo-pointer" value="\${item.name}" readonly />
									</td>
								</tr>`;
							}
						});
						$('#modalTableBody').html(rows);
						$('#inventoryModal').modal('show');
					},
					error: function(xhr, status, error) {
						alert('데이터 로드에 실패했습니다: ' + error);
					},
				});
			}

			
			/* 검색기능 START */
			$('#inventorySearchInput').on('keyup', function() {
				let searchInputValue = $(this).val().toLowerCase();
				$('.searchData').each(function() {
					let cod = $(this).data('cod').toString().toLowerCase();
					let name = $(this).data('name').toString().toLowerCase();
					if (cod.includes(searchInputValue) || name.includes(searchInputValue)) {
						$(this).show();
					} else {
						$(this).hide();
					}
				});
			});
			/* 검색기능 END */
			/* 원자재 모달 API DATA END */
			
			
			
		/* 제품 그룹 찾기 모달 API DATA START */
		
		/* productSearchSetValue START */
         function productSearchSetValue(name) {
              $('#searchProductGroupName').val(name);
              $('#productGroupSearchModal').modal('hide');
              $('.modal-backdrop').remove();
          }
         /* productSearchSetValue END */
         
         
		 function loadProductGroupSearchData() {
               $.ajax({
                  url: 'api/get-productgroup',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item, index) {
                        if (item.cod && item.deleteyn === 'N') {
                           rows += `<tr class="searchData hyunwoo-pointer" onclick="productSearchSetValue('\${item.name}')" data-cod="\${item.cod}" data-name="\${item.name}" >
                              <td>\${item.cod}</td>
                              <td class="hyunwoo-flex-wrap">
                              <input type="text" id="updateName\${item.cod}" name="name" class="form-control hyunwoo-input-disabled hyunwoo-pointer" value="\${item.name}" readonly />
                              </td>
                              </tr>`;
                        }
                     });
                     $('#productGroupModalBody').html(rows);
                     $('#productGroupSearchModal').modal('show');
                  },
                  error: function (xhr, status, error) {
                     alert('데이터 로드에 실패했습니다: ' + error);
                  },
               });
            }


            /* 검색기능 START */
            $('#productGroupSearchInput').on('keyup', function () {
               let searchInputValue = $(this).val().toLowerCase();
               $('.searchData').each(function () {
                  let cod = $(this).data('cod').toString().toLowerCase();
                  let name = $(this).data('name').toString().toLowerCase();
                  if (
                     cod.includes(searchInputValue) ||
                     name.includes(searchInputValue)
                  ) {
                     $(this).show();
                  } else {
                     $(this).hide();
                  }
               });
            });
			
			
         // 제품 추가 행 취소 함수
         const cancelProductRow = () => {
            $(this).closest('tr').remove();
            $('#addColumnButton').prop('disabled', false);
         };
         
     	/* 제품 그룹 찾기 모달 API DATA END */
     	
     	
     	/* 전체 검색 기능 초기화 버튼 */
     	function resetSearchForm() {
            $('#searchCod').val('');
            $('#searchName').val('');
            $('#searchWarehouseName').val('');
            $('#searchProductGroupName').val('');
            $('#searchEmployeeCod').val('');
         }
     	/* 전체 검색 기능 초기화 버튼 */
      </script>
</body>
</html>
