<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

    <script>
 // 견적 상세 모달 관련 함수 시작
    
    // estimateDetail(cod) 시작
	// 견적 상세 모달에서 목록을 불러오는 함수입니다. 여기서 금액계산을 하고, 견적 상세 목록의 수정, 삭제하는 함수도 정의하였습니다. 함수안에 함수가 정의되어 있어서 헷갈릴 수 있습니다.
    function estimateDetail(cod) {
    	
    	// estimatedetail ajax 통신 시작
    	$.ajax({
    		url: 'api/get-invoicedetail',
    		type: 'GET',
    		data: {invoiceCod : cod},
    		dataType: 'JSON',
    		success: function(response) {
    			console.log(response);
    			
                var invoicedetailList = response.invoicedetailList;
                
                var invoiceCod = invoicedetailList[0].invoiceCod;
                var clientName = invoicedetailList[0].clientName;
                var invDate = invoicedetailList[0].invDate;
                var employeeName = invoicedetailList[0].employeeName;
                var note = invoicedetailList[0].note;
    		    
                // 견적 상세 모달 상단에 넣은 값입니다.
    			$('#invoiceCod').text(invoiceCod);
    			$('#clientName').text(clientName);
     			$('#invDate').text(invDate);
    			$('#employeeName').text(employeeName);
    			$('#note').text(note);
				
    			// estimateDetialList.forEach 상세 리스트의 각 요소에 적용하는 함수 시작
    			// 견적 상세 모달에서 각 상세 목록들에 들어가는 요소들 입니다.
    			invoicedetailList.forEach(function(item) {
    				
    				var newRow = $('<tr class="generatedRow">');
    				
    				newRow.append($('<td>').text(item.num));
    				if(item.invClass == '생산'){
    					newRow.append($('<td>').text(item.productCod));
    					newRow.append($('<td>').text(item.prodname));
    					newRow.append($('<td>').text(item.spec));
    					newRow.append($('<td>').text(item.unitName));
    					newRow.append($('<td>').append($('<input>').attr({
        					'id': 'qty_' + item.num,
        				    'type': 'number',
        				    'readonly': 'readonly',
        				    'class': 'form-control',
        				}).css('width', '120px').val(item.invQty)));
    					newRow.append($('<td>').text(item.mgmtUnitName));
    					newRow.append($('<td>').text(item.invMgmtQty));
    				}else{
    					newRow.append($('<td>').text(item.inventoryCod));
    					newRow.append($('<td>').text(item.invname));
    					newRow.append($('<td>').text(item.invSpec));
    					newRow.append($('<td>').text(item.invUnitName));
    					newRow.append($('<td>').text(item.invQty));
    					newRow.append($('<td>').text(item.invMgmtUnitName));
    					newRow.append($('<td>').append($('<input>').attr({
        					'id': 'qty_' + item.num,
        				    'type': 'number',
        				    'readonly': 'readonly',
        				    'class': 'form-control',
        				}).css('width', '120px').val(item.invMgmtQty)));
    				}
    				newRow.append($('<td>').text(item.clientName));
    				
    				// 각 견적 상세 목록에 수정과 삭제 버튼을 달아주었고 onclick 함수를 바로 정의했습니다.
    		        var editButton = $('<button>').text('수정').addClass('btn btn-primary').css('margin-right', '2px');
    		        //var deleteButton = $('<button>').text('삭제').addClass('btn btn-primary');
    		        //var buttonGroup = $('<div>').append(editButton).append(deleteButton);
    		        var buttonGroup = $('<div>').append(editButton);
    		        
    			    newRow.append($('<td>').append(buttonGroup));
    			    
    				$('#detailList').after(newRow);
    			    
    			    editButton.on('click', function() {
     				    var cod = item.invoiceCod;
    				    var num = item.num;
    				    var qty = $('#qty_' + item.num).val();
    				    
    				    
    				    $.ajax({
    				    	url: 'update-invoicedetail',
    				    	type: 'POST',
    				    	data: {
    				    		cod : cod,
    				    		qty : qty,
    				    		num : num
    				    	},
    				    	success: function(response){
    				    		console.log('성공');
    				    		alert('수정이 완료되었습니다.');
    				    		
    				            // 성공 시 기존 데이터 삭제
    				            $('.generatedRow').remove();
    				            
    				            // 수정 성공 시 해당 함수를 호출하여 전체적으로 다시 렌더링
    				            estimateDetail(cod);
    				            
    				    	},
    				    	error: function(xhr, status, error) {
    							console.error('실패');
    							console.log(xhr,status);
    						}
    				    });
    				    
    				});
    				
    				$('#detailModal').on('hidden.bs.modal', function () {
    				    // 모달이 닫힐 때 생성된 tr 요소 제거
    				    $('.generatedRow').remove();
    				
    				});	
    			});
    			// estimateDetialList.forEach 상세 리스트의 각 요소에 적용하는 함수 끝
    		},
    		error: function(xhr, status, error) {
    			console.error('실패');
    		}
    	});
    	// estimatedetail ajax 통신 끝
    }
 	// estimateDetail(cod) 끝

    	// readonly 없애는 함수
		function estimateChange() {
			$('input').removeAttr('readonly');
		}
 	
		// 견적 상세 모달 끄기
		function Modalclose() {
			$('#addRowButton').prop('disabled', false);
			$('.generatedRow').remove();
		}
   
   // 견적 상세 모달 관련 함수 끝

    </script>
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
							<a href="/easyrp/commontable">소요량전개 관리</a>
						</h3>
						<p class="text-subtitle text-muted">소요량전개 조회, 등록, 수정, 삭제</p>
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
											<form id="searchForm" action="mrpmanagement" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr>
															<td width="100">계획구분</td>
															<td><select id="searchPlan" name="searchPlan" class="form-select">
																<option value="수주">수주정보 기반</option>
																<option value="계획">생산계획 기반</option>
															</select></td>
															<td width="100">품 번</td>
															<td><input type="text" id="searchProdCod"
																name="searchProdCod" class="form-control"
																value="${search.searchProdCod}" placeholder="품번을 입력해주세요." /></td>
															<td width="100">품 명</td>
															<td><input type="text" id="searchProdName"
																name="searchProdName" class="form-control"
																value="${search.searchProdName}" placeholder="품명을 입력해주세요." /></td>
														</tr>
														<tr>
															<td width="100">검색 날짜</td>
															<td colspan="2"><input type="date"
																id="preSearchDate" name="preSearchDate"
																value="${search.preSearchDate}" class="form-control"
																style="width: 47%; float: left" /> <span><i
																	class="fa-solid fa-arrow-right"
																	style="margin-top: 10px"></i></span> <input type="date"
																id="postSearchDate" name="postSearchDate"
																value="${search.postSearchDate}" class="form-control"
																style="width: 47%; float: right" /></td>
														</tr>
													</table>
												</div>
												<input type="hidden" name="offset" value="${search.offset}" /> <input
													type="hidden" name="size" value="${search.pageSize}" />
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
												<th>소요량번호</th>
												<th>품번</th>
												<th>품명</th>
												<th>규격</th>
												<th>계획일자</th>
												<th>예정발주일</th>
												<th>납기일</th>
												<th>계획수량</th>
												<th>단위</th>
												<th>계정구분</th>
												<th>기능</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty mrpTable }">
												<c:forEach var="mrpTable" items="${mrpTable }">
													<tr>
														<td>${mrpTable.cod}</td>
														<td>
															<c:if test="${mrpTable.account eq '완제'}">${mrpTable.productCod}</c:if>
															<c:if test="${mrpTable.account eq '자재'}">${mrpTable.inventoryCod}</c:if>
														</td>
														<td>
															<c:if test="${mrpTable.account eq '완제'}">${mrpTable.prodname}</c:if>
															<c:if test="${mrpTable.account eq '자재'}">${mrpTable.invname}</c:if>
														</td>
														<td>
															<c:if test="${mrpTable.account eq '완제'}">${mrpTable.spec }</c:if>
															<c:if test="${mrpTable.account eq '자재'}">${mrpTable.invSpec }</c:if>
														</td>
														<td><fmt:formatDate value="${mrpTable.takeDate }" pattern="yyyy-MM-dd"/></td>
														<td><fmt:formatDate value="${mrpTable.poDate }" pattern="yyyy-MM-dd"/></td>
														<td><fmt:formatDate value="${mrpTable.dday }" pattern="yyyy-MM-dd"/></td>
														<td>${mrpTable.qty }</td>
														<td>
															<c:if test="${mrpTable.account eq '완제'}">${mrpTable.unitName }</c:if>
															<c:if test="${mrpTable.account eq '자재'}">${mrpTable.invUnitName }</c:if>
														</td>
														<td>${mrpTable.account }</td>
														<td>
															<div class="btn-group">
																<button type="button"
																	class="btn btn-primary dropdown-toggle"
																	data-bs-toggle="dropdown" aria-expanded="false">
																	<i class="fa-solid fa-gear"></i>
																</button>
																<ul class="dropdown-menu">
																	<li><a class="dropdown-item"
																		href="mrpupdate?cod=${mrpTable.cod}">수정</a></li>
																	<li><a class="dropdown-item"
																		href="mrpdeletefn?cod=${mrpTable.cod}">삭제</a></li>
																</ul>
															</div>
														</td>
													</tr>
												</c:forEach>
											</c:if>
											<c:if test="${empty mrpTable }">
												<tr>
													<td colspan="10" align="center">소요량전개 내역이 없습니다.</td>
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
								href="<c:if test='${startPage > 1}'>?page=${startPage - 10}&size=${searchVo.pageSize}&searchPlan=${searchVo.searchPlan }&searchProdCod=${searchVo.searchProdCod}&searchProdName=${searchVo.searchProdName}&preSearchDate=${searchVo.preSearchDate}&postSearchDate=${searchVo.postSearchDate}</c:if>">이전
									10 페이지</a>
							</li>

							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li
									class="page-item <c:if test='${i == currentPage}'>active</c:if>">
									<a class="page-link"
									href="?page=${i}&size=${searchVo.pageSize}&searchPlan=${searchVo.searchPlan }&searchProdCod=${searchVo.searchProdCod}&searchProdName=${searchVo.searchProdName}&preSearchDate=${searchVo.preSearchDate}&postSearchDate=${searchVo.postSearchDate}">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item <c:if test='${endPage == totalPages}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${endPage < totalPages}'>?page=${endPage + 1}&size=${searchVo.pageSize}&searchPlan=${searchVo.searchPlan }&searchProdCod=${searchVo.searchProdCod}&searchProdName=${searchVo.searchProdName}&preSearchDate=${searchVo.preSearchDate}&postSearchDate=${searchVo.postSearchDate}</c:if>">다음
									10 페이지</a>
							</li>
						</ul>
					</nav>

					<!-- 페이지네이션 END -->
					<div class="d-flex"
						style="padding-bottom: 0.5rem; padding-top: 0.5rem;">
						<div class="col-md-6">
							<button type="button" class="btn btn-primary">
								<a href="mrpinsert" style="color: white">등록</a>
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
    </script>
    
    <!-- 셀렉트박스 고정 자바스크립트 -->
    <script type="text/javascript">
    	window.onload = function(){
    		document.getElementById('searchPlan').value = '${searchPlan}';
    	}
    </script>
</html>