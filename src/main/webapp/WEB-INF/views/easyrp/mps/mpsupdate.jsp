<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
						<h3>주계획 수정</h3>
						<p class="text-subtitle text-muted">주계획 수정</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">공통
									테이블</li>
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
								<div>
									<h5 class="m-0">주계획 수정</h5>
								</div>
							</div>
							<div class="card-body mb-3">
								<form action="mpsupdatefn" method="post">
									<div class="mb-4">
										<table class="table table-bordered">
											<!-- 계획일 INPUT -->
		                                    <tr>
		                                       <td width="150">계획일</td>
		                                       <td>
		                                          <input
		                                             type="date"
		                                             id="planDate"
		                                             name="planDate"
		                                             class="form-control"
		                                             value="${mpsData.planDate}"
		                                             required
		                                          />
		                                       </td>
		                                    </tr>
											<!-- 품번 INPUT -->
											<tr>
												<td width="150">품번</td>
												<td><input type="text" id="productCod" name="productCod"
													class="form-control" value="${mpsData.productCod}" disabled/>
												</td>
											</tr>
											<!-- 품명 INPUT -->
											<tr>
												<td width="150">품명</td>
												<td><input type="text" id="prodname" name="prodname"
													class="form-control" value="${mpsData.prodname}" disabled/>
												</td>
											</tr>
											<!-- 규격 INPUT -->
											<tr>
												<td width="150">규격</td>
												<td><input type="text" id="spec" name="spec"
													class="form-control" value="${mpsData.spec}" disabled/>
												</td>
											</tr>
											<!-- 단위 INPUT -->
											<tr>
												<td width="150">단위</td>
												<td><input type="text" id="unitName"
													name="unitName" class="form-control"
													style="width: 100%; float: left" value="${mpsData.unitName}" disabled/>
											<!-- 출고예정일 INPUT -->
											<tr>
												<td width="150">출고예정일</td>
												<td><input type="text" id="deliveryDate" name="deliveryDate"
													class="form-control" value="" disabled/>
												</td>
											</tr>
											<!-- 납기일 INPUT -->
											<tr>
												<td width="150">고객명</td>
												<td><input type="text" id="dday" name="dday"
													class="form-control" value="${mpsData.dday}" disabled/>
												</td>
											</tr>
											<!-- 수량 INPUT -->
											<tr>
												<td width="150">수량</td>
												<td><input type="text" id="qty" name="qty"
													class="form-control" value="${mpsData.qty}" required 
													oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
													maxlength="5" />
												</td>
											</tr>
											<!-- 고객명 INPUT -->
											<tr>
												<td width="150">고객명</td>
												<td><input type="text" id="clientName" name="clientName"
													class="form-control" value="${mpsData.clientName}" disabled/>
												</td>
											</tr>
											<!-- 비고 INPUT -->
											<tr>
												<td width="150">비고</td>
												<td><input type="text" id="note" name="note"
													class="form-control" value="${mpsData.note}"/>
												</td>
											</tr>
										</table>
									</div>
									<input type="hidden" name="cod" value="${mpsData.cod}" />
									<!-- 공통등록 Button START -->
									<div style="text-align: center">
										<button type="submit"
											class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
											수정</button>
										<a href="mpsmanagement" class="me-2">
											<button type="button"
												class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
												수정 취소</button>
										</a>
									</div>
									<!-- 공통 수정 Button END -->
								</form>
								<!-- 공통 수정 END -->
							</div>
						</div>
						<!-- 공통 수정 FORM END -->
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
</html>