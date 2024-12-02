<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<!-- ( 2024년 5월 22일 오전 10시 45분 손지은 ) -->
	<!-- 입고 완료 매출 마감 테이블 START -->
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
							<a href="purchaseclosing">입고 완료 매입 마감 관리</a>
						</h3>
						<p class="text-subtitle text-muted">입고 완료 된 수주건에 대해 매입 마감 관리를
							할 수 있는 현황판</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">입고
									완료 매입 마감 관리</li>
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
											<form id="searchForm" action="purchaseclosing" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr class="text-center">
															<td width="8%">마감 발주 번호</td>
															<td width="15%"><input type="text"
																id="searchPurchaseCod" name="searchPurchaseCod"
																class="form-control" value="${searchVO.searchPurchaseCod}"
																placeholder="수주번호를 입력해주세요." /></td>
															<td width="9%">매입 마감 유무</td>
															<td width="10%"><select class="form-control"
																id="searchPurchaseClosingState"
																name="searchPurchaseClosingState">
																	<option value=0
																		${searchVO.searchPurchaseClosingState == '0' ? 'selected' : ''}>선택</option>
																	<option value=204
																		${searchVO.searchPurchaseClosingState == 204 ? 'selected' : ''}>마감
																		완료</option>
																	<option value=203
																		${searchVO.searchPurchaseClosingState == 203 ? 'selected' : ''}>마감
																		미완료</option>
															</select></td>
															<td width="10%">매출 마감 완료 날짜</td>
															<td colspan="4"><input type="date"
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
												<div style="text-align: end; margin-right: 0.5rem">
													<button type="submit" class="btn btn-primary">검색</button>
													<button type="button" class="btn btn-primary"
														onclick="resetSearchForm()">초기화</button>
												</div>
											</form>
										</div>
									</div>
									<!-- 검색 FORM END -->

									<form id="purchaseClosingForm" action="purchaseclosingupdate" method="post" onsubmit="return confirm('한번 매입마감 처리를 하면 되돌릴 수 없습니다. 정말 매입마감 처리를 하시겠습니까?');">
										<table class="table table-hover mb-0">
											<thead>

												<tr>
													<th width="1%"><input type="checkbox"
														id="purchaseAllCheck" class="form-check-input" /></th>
													<th width="5%">마감 수주 번호</th>
													<th width="10%">매입 마감 금액</th>
													<th width="10%">마감 완료 유무</th>
													<th width="10%">마감 완료 날짜</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="purchaseClosing" items="${purchaseClosing}"
													varStatus="status">
													<tr data-row-id="${status.index}" data-purchase-closing-state="${purchaseClosing.stateCod}" data-purchase-closing-date="${purchaseClosing.closingDate}" class="commonDetailTable">
														<td><input type="checkbox" name="purchaseCodChk"
															class="form-check-input" /></td>
														<td class="text-bold-500">${purchaseClosing.purchaseCod}</td>
														<input type="hidden" name ="rowPurchaseCodDatas[${status.index}].purchaseCod" value="${purchaseClosing.purchaseCod}" />
														<!-- 마감 수주 번호  -->
														<td><fmt:formatNumber value="${purchaseClosing.total }"
																pattern="#,###" />원</td>
														<!-- 매출 마감 금액  -->
														<td>
															<c:if test="${purchaseClosing.stateCod eq 204}">Y</c:if>
															<c:if test="${purchaseClosing.stateCod eq 203}">N</c:if>
														</td>
														<!-- 매출 마감 완료 유무 -->
														<td>${purchaseClosing.closingDate }</td>
														<!-- 초과일수 -->
													</tr>
												</c:forEach>
												<c:if test="${empty purchaseClosing}">
													<tr>
														<td colspan="7" class="text-center">데이터가 존재하지 않습니다.</td>
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
								href="<c:if test='${startPage > 1}'>?page=${startPage - 10}&searchPurchaseCod=${searchVO.searchPurchaseCod }&searchPurchaseClosingState=${searchVO.searchPurchaseClosingState}
								&preSearchDate=${searchVO.preSearchDate }&postSearchDate=${searchVO.postSearchDate }</c:if>">이전
									10 페이지</a>
							</li>
							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li
									class="page-item <c:if test='${i == currentPage}'>active</c:if>">
									<a class="page-link"
									href="?page=${i}&searchPurchaseCod=${searchVO.searchPurchaseCod }&searchPurchaseClosingState=${searchVO.searchPurchaseClosingState}
								&preSearchDate=${searchVO.preSearchDate }&postSearchDate=${searchVO.postSearchDate }">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item <c:if test='${endPage == totalPages}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${endPage < totalPages}'>?page=${endPage + 1}&searchPurchaseCod=${searchVO.searchPurchaseCod }&searchPurchaseClosingState=${searchVO.searchPurchaseClosingState}
								&preSearchDate=${searchVO.preSearchDate }&postSearchDate=${searchVO.postSearchDate }</c:if>">다음
									10 페이지</a>
							</li>
						</ul>
					</nav>
					<!-- 페이지네이션 END -->
					<div class="d-flex"
						style="padding-bottom: 0.5rem; padding-top: 0.5rem">
						<div class="col-md-6">
							<button type="submit" id="closingSubmitBtn"
								class="btn btn-primary" disabled>매입 마감 등록
							</button>
						</div>
					</div>
					</form>
				</div>
			</section>
		</div>
	</div>
	<!-- 출고 완료 매출 마감 관리 테이블 END -->


	<script type="text/javascript">
		/* 검색 form 초기화 START */
		function resetSearchForm() {
			$('#searchPurchaseCod').val('');
			$("#searchPurchaseClosingState").val("").prop("selected", true);
			$('#preSearchDate').val('');
			$('#postSearchDate').val('');
		}
		/* 검색 form 초기화 END */

		/* checkBtn 활성화 함수 START  */
		function checkedBtnActive() {
			$('#closingSubmitBtn').prop('disabled', false);
		}
		/* checkBtn 활성화 함수 END  */

		/* checkBtn Disabled 함수 START  */
		function checkedBtnDisabled() {
			$('#closingSubmitBtn').prop('disabled', true);
		}
		/* checkBtn Disabled 함수 END  */

		$(document).ready(function() {
			
		    $('#purchaseClosingForm').submit(function(event) {
		        // 체크되지 않은 항목 제거
		        $("input[name='purchaseCodChk']:not(:checked)").each(function() {
		            var rowId = $(this).closest('tr').data('row-id');
		            console.log(rowId);
		            $(`input[name='rowPurchaseCodDatas[\${rowId}].purchaseCod']`).remove();
		        });
		    });

		    // 체크박스 클릭 이벤트 처리
		    $("input[name='purchaseCodChk']").click(function() {
		        var $row = $(this).closest('tr');
		        var purchaseClosingState = $row.data('purchase-closing-state');
		        var purchaseClosingDate = $row.data('purchase-closing-date');

		        if (purchaseClosingDate) {
		            alert("이미 매입마감이 완료된 데이터 입니다.");
		            $(this).prop('checked', false); // 체크 해제
		        }

		        // 전체 체크박스 상태 업데이트
		        updateAllCheckState();
		        // 제출 버튼 상태 업데이트
		        updateSubmitButtonState();
		    });

		    // 전체 체크박스 클릭 이벤트 처리
		    $("#purchaseAllCheck").click(function() {
		        if ($(this).is(":checked")) {
		            $("input[name='purchaseCodChk']").each(function() {
		                var $row = $(this).closest('tr');
		                var purchaseClosingState = $row.data('purchase-closing-state');
		                var purchaseClosingDate = $row.data('purchase-closing-date');

		                if (purchaseClosingDate) {
		                    alert("매입마감이 되지 않은 데이터만 체크합니다.");
		                    $(this).prop('checked', false); // 체크 해제
		                } else {
		                    $(this).prop('checked', true); // 체크 설정
		                }
		            });
		        } else {
		            $("input[name='purchaseCodChk']").prop("checked", false); // 모든 체크 해제
		        }
		        // 제출 버튼 상태 업데이트
		        updateSubmitButtonState();
		    });

		    // 전체 체크박스 상태 업데이트 함수
		    function updateAllCheckState() {
		        let totalChk = $("input[name='purchaseCodChk']").length;
		        let checked = $("input[name='purchaseCodChk']:checked").length;

		        $("#purchaseAllCheck").prop('checked', totalChk === checked);
		    }

		    // 제출 버튼 활성화/비활성화 업데이트 함수
		    function updateSubmitButtonState() {
		        if ($("input[name='purchaseCodChk']:checked").length > 0) {
		            $('#closingSubmitBtn').prop('disabled', false);
		        } else {
		            $('#closingSubmitBtn').prop('disabled', true);
		        }
		    }

		    // 초기 제출 버튼 상태 설정
		    updateSubmitButtonState();
		});
	</script>
</body>
</html>
