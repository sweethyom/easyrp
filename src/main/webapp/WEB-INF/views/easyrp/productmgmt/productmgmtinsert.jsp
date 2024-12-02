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
	<!-- 2024년 5월 11일 오전 1시 10분 박현우 -->
	<!-- 제품 등록 테이블 START -->
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
						<h3>제품 등록</h3>
						<p class="text-subtitle text-muted">제품의 기초 등록을 위한 페이지</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">제품
									등록</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="row" id="table-hover-row">
					<div class="col-12">
						<div class="card mb-4">
							<div class="card-header py-3">
								<div class="d-flex">
									<h5 class="m-0">제품 등록</h5> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<strong>필수 입력 정보는 <span style="color:red;">*</span> 로 표시됩니다.</strong>
								</div>
							</div>
							<div class="card-body mb-3">
								<form action="productmgmtinsertfn" method="post">
									<div class="mb-4">
										<table class="table table-bordered">
											<tr>
												<td width="170"><span style="color:red; font-size:1.2rem;">*</span>&nbsp;제품 번호</td>
												<td><input type="text" id="cod" name="cod"
													class="form-control" value="${nextCod}"
													placeholder="제품 번호를 입력해주세요." readonly required /></td>
											</tr>
											<tr>
												<td width="150"><span style="color:red; font-size:1.2rem;">*</span>&nbsp;제품명</td>
												<td><input type="text" id="prodname" name="prodname"
													class="form-control" placeholder="제품명을 입력해주세요."
													maxlength="100" required /></td>
											</tr>
											<tr>
												<td width="150"><span style="color:red; font-size:1.2rem;">*</span>&nbsp;완제품 단가(원)</td>
												<td><input type="text" id="unitprice"
													name="unitprice" class="form-control"
													placeholder="완제품 판매 단가(공급가)를 기입해주세요." required="required" /></td>
											</tr>
											<tr>
												<td width="150"><span style="color:red; font-size:1.2rem;">*</span>&nbsp;기초재고 수량</td>
												<td><input type="text" id="basicInvQty"
													name="basicInvQty" class="form-control"
													placeholder="현재 입고된 기준의 재고수량을 입력해주세요." required /></td>
											</tr>
											<tr>
												<td width="150"><span style="color:red; font-size:1.2rem;">*</span>&nbsp;기초재고 금액</td>
												<td><input type="number" id="basicInvPrice"
													name="basicInvPrice" class="form-control"
													placeholder="단가 * 기초재고 수량으로 계산해 자동 입력됩니다." readonly
													required /></td>
											</tr>
											<tr>
												<td width="150">사양 및 규격</td>
												<td><input type="text" id="spec" name="spec"
													class="form-control" placeholder="필요 시 사양 및 규격을 입력해주세요."
													maxlength="100" /></td>
											</tr>
											<tr>
												<td width="150"><span style="color:red; font-size:1.2rem;">*</span>&nbsp;안전재고 수량</td>
												<td><input type="number" id="safteyInvQty"
													name="safteyInvQty" class="form-control"
													placeholder="품절을 막기위한 최소한의 수량 커트라인을 기입해주세요." required /></td>
											</tr>
											<tr>
												<td width="150"><span style="color:red; font-size:1.2rem;">*</span>&nbsp;제품 그룹</td>
												<td><input type="text" id="productGroupName"
													class="form-control" style="width: 70%; float: left"
													placeholder="우측 제품 그룹 조회 버튼을 통해 제품 그룹을 선택해주세요." disabled
													required /> <input type="hidden" id="productGroupCod"
													name="productGroupCod" />
													<button type="button" class="btn btn-primary"
														id="setValueProdGroupModalBtn" data-bs-toggle="modal"
														data-bs-target="#loadModal"
														style="margin-left: 2rem; width: 15%"
														onclick="setValueProdGroupModal()">제풉 그룹 조회</button></td>
											</tr>
											<tr>
												<td width="150"><span style="color:red; font-size:1.2rem;">*</span>&nbsp;재고 단위</td>
												<td><input type="text" id="unitName"
													class="form-control" style="width: 70%; float: left"
													placeholder="우측 재고 단위 조회 버튼을 통해 재고 단위를 선택해주세요." disabled
													required /> <input type="hidden" id="unitCod"
													name="unitCod" />
													<button type="button" class="btn btn-primary"
														id="setValueUnitModalBtn" data-bs-toggle="modal"
														data-bs-target="#loadModal"
														style="margin-left: 2rem; width: 15%"
														onclick="setValueUnitModal()">재고 단위 조회</button></td>
											</tr>
											<tr>
												<td width="150"><span style="color:red; font-size:1.2rem;">*</span>&nbsp;재고 단위 기초 수량</td>
												<td><input type="number" id="unitAmount"
													name="unitAmount" class="form-control"
													placeholder="사내에서 관리하는 재고 단위 수량을 입력해주세요." required /></td>
											</tr>
											<tr>
												<td width="150"><span style="color:red; font-size:1.2rem;">*</span>&nbsp;관리 단위</td>
												<td><input type="text" id="mgmtUnitName"
													class="form-control" style="width: 70%; float: left"
													placeholder="우측 관리 단위 조회 버튼을 통해 관리 단위를 선택해주세요." disabled
													required /> <input type="hidden" id="mgmtUnitCod"
													name="mgmtUnitCod" />
													<button type="button" class="btn btn-primary"
														id="setValueMgmtUnitModalBtn" data-bs-toggle="modal"
														data-bs-target="#loadModal"
														style="margin-left: 2rem; width: 15%"
														onclick="setValueMgmtUnitModal()">관리 단위 조회</button></td>
											</tr>
											<tr>
												<td width="150"><span style="color:red; font-size:1.2rem;">*</span>&nbsp;관리 단위 기초 수량</td>
												<td><input type="number" id="mgmtUnitAmount"
													name="mgmtUnitAmount" class="form-control"
													placeholder="거래처와 사용하는 단위 수량을 입력해주세요." required /></td>
											</tr>
											<tr>
												<td width="150"><span style="color:red; font-size:1.2rem;">*</span>&nbsp;제품 창고</td>
												<td><input type="text" id="warehouseName"
													class="form-control" style="width: 70%; float: left"
													placeholder="우측 창고 조회 버튼을 통해 재고가 있는 창고를 선택해주세요." disabled
													required /> <input type="hidden" id="warehouseCod"
													name="warehouseCod" />
													<button type="button" class="btn btn-primary"
														id="warehouseModalBtn" data-bs-toggle="modal"
														data-bs-target="#loadModal"
														style="margin-left: 2rem; width: 15%"
														onclick="openWarehouseModal()">창고 조회</button></td>
											</tr>
											<tr>
												<td width="150"><span style="color:red; font-size:1.2rem;">*</span>&nbsp;등록 사원명</td>
												<td><input type="text" id="empName"
													class="form-control hyunwoo-disabled" maxlength="100"
													value="${empName }" placeholder="필요 시 메모를 남겨주세요." disabled />
													<input type="hidden" id="employeeCod" name="employeeCod"
													value="${empCode }" /></td>
											</tr>
											<tr>
												<td width="150">메 모</td>
												<td><input type="text" id="note" name="note"
													class="form-control" maxlength="100"
													placeholder="필요 시 메모를 남겨주세요." /></td>
											</tr>
										</table>
									</div>
									<div style="text-align: center">
										<button type="submit"
											class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
											제품 등록</button>
										<a href="productmgmt" class="me-2">
											<button type="button"
												class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
												등록취소</button>
										</a>
									</div>
									<input type="hidden" id="curInvQty" name="curInvQty" readonly
										required /> <input type="hidden" id="curInvPrice"
										name="curInvPrice" readonly required />
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 부서 등록 테이블 END -->

	<!-- 공통 Modal START  -->
	<div class="modal fade" id="loadModal" tabindex="-1"
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="loadModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 여기에 Modal JSP가 삽입됩니다. -->
			</div>
		</div>
	</div>
	<!-- 공통 Modal END  -->

	<script type="text/javascript">
		$(document).ready(function() {
			$('#unitprice, #basicInvQty').on('input', function() {
				let unitPrice = $('#unitprice').val();
				let qty = $('#basicInvQty').val();
				let price = parseInt(unitPrice) * qty;

				$('#basicInvPrice').val(price);
				$('#curInvQty').val(qty);
				$('#curInvPrice').val(price);
			});
		});

		function openWarehouseModal() {
			$('.modal-content').load('warehousemodal');
		}

		function openBOMModal() {
			$('.modal-content').load('openbommodal');
		}

		function setValueProdGroupModal() {
			$('.modal-content').load('searchproductgroupmodal');
		}

		function setValueUnitModal() {
			$('.modal-content').load('setvalueunitmodal');
		}

		function setValueMgmtUnitModal() {
			$('.modal-content').load('setvaluemgmtunitmodal');
		}
		
		function setValueInventoryModal() {
			$('.modal-content').load('setvalueinventorymodal');
		}
		
		
	</script>
</body>
</html>
