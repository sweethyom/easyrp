<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<h3>소요량 등록</h3>
						<p class="text-subtitle text-muted">소요량을 수정해주세요.</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">소요량 전개</li>
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
								<div class="d-flex" style="justify-content: space-between">
									<h5 class="m-0 col-6">등록</h5>
									<div class="d-flex col-6 justify-content-end">
										<button type="button" class="btn btn-primary mx-2" id="loadDatas"
										data-bs-toggle="modal" data-bs-target="#dataModal"
										style="float: left; width: 24%">
											수주정보 가져오기</button>
										<button type="button" class="btn btn-primary" id="loadDatas"
											data-bs-toggle="modal" data-bs-target="#dataModal"
											style="float: left; width: 24%">
											판매계획 가져오기</button>
									</div>
								</div>
							</div>
							<div class="card-body mb-3">
								<form id="formContainer" action="mrpupdatefn" method="post">
									<div class="mb-4">
										<table class="table table-bordered">
											<!-- mps 번호 INPUT -->
											<tr>
												<td width="150">계획번호</td>
												<td><input type="text" id="mpsCod" name="mpsCod"
													class="form-control" value="${mrpData.cod }" disabled/>
												</td>
											</tr>
											<!-- 등록자 INPUT -->
											<tr>
												<td width="150">등록자</td>
												<td><input type="text" id="employeeName" name="employeeName" value="${empName }"
													class="form-control" placeholder="로그인하면 자동으로 불러옵니다." disabled/>
												</td>
											</tr>
											<!-- 품번 INPUT -->
											<tr>
												<td width="150">품번</td>
												<c:if test="${mrpData.account eq '완제'}">
													<td><input type="text" id="productCod" name="productCod" class="form-control" value="${mrpData.productCod }" disabled/></td>
												</c:if>
												<c:if test="${mrpData.account eq '자재'}">
													<td><input type="text" id="inventoryCod" name="inventoryCod" class="form-control" value="${mrpData.inventoryCod }" disabled/></td>
												</c:if>
											</tr>
											<!-- 품명 INPUT -->
											<tr>
												<td width="150">품명</td>
												<c:if test="${mrpData.account eq '완제' }">
													<td><input value="${mrpData.prodname }" type="text" id="prodname" name="prodname" class="form-control" disabled /></td>
												</c:if>
												<c:if test="${mrpData.account eq '자재' }">
													<td><input value="${mrpData.invname }" type="text" id="invname" name="invname" class="form-control" disabled /></td>
												</c:if> 
											</tr>
											<!-- 규격 INPUT -->
											<tr>
												<td width="150">규격</td>
												<c:if test="${mrpData.account eq '완제' }">
													<td><input value="${mrpData.spec }" type="text" id="spec" name="spec" class="form-control readonly" disabled/></td>
												</c:if>
												<c:if test="${mrpData.account eq '자재' }">
													<td><input value="${mrpData.invSpec }" type="text" id="invSpec" name="invSpec" class="form-control readonly" disabled/></td>
												</c:if>
											</tr>
											<!-- 계획일 INPUT -->
											<tr>
												<td width="150">계획일</td>
												<td><input value="${mrpData.takeDate }" type="text" id="takeDate" name="takeDate"
													class="form-control" disabled/>
												</td>
											</tr>
										<!-- 예정발주일 INPUT -->
											<tr>
												<td width="150">예정발주일</td>
												<td><input value="${mrpData.poDate }" type="date" id="poDate" name="poDate"
													class="form-control" required/>
												</td>
											</tr>
											<!-- 납기일 INPUT -->
											<tr>
												<td width="150">납기일</td>
												<td><input value="${mrpData.dday }" type="text" id="dday" name="dday"
													class="form-control" placeholder="납기일을 불러오세요." disabled/>
												</td>
											</tr>
											<!-- 예정수량 INPUT -->
											<tr>
												<td width="150">예정수량</td>
												<td><input value="${mrpData.qty }" type="text" id="qty" name="qty"
													class="form-control" placeholder="예정수량을 입력해주세요." disabled/>
												</td>
											</tr>
											<!-- 단위 INPUT -->
											<tr>
												<td width="150">단위</td>
												<c:if test="${mrpData.account eq '완제' }">
													<td><input value="${mrpData.unitName }" type="text" id="unitName" name="unitName" class="form-control" placeholder="단위를 불러오세요." disabled/></td>
												</c:if>
												<c:if test="${mrpData.account eq '자재' }">
													<td><input value="${mrpData.invUnitName }" type="text" id="unitName" name="unitName" class="form-control" placeholder="단위를 불러오세요." disabled/></td>
												</c:if>
											</tr>
											<!-- 계정구분 INPUT -->
											<tr>
												<td width="150">계정구분</td>
												<td><input value="${mrpData.account }" type="text" id="account" name="account"
													class="form-control" placeholder="계정구분을 불러오세요." disabled/>
												</td>
											</tr>
										</table>
										<div>
											<input type="hidden" id="cod" name="cod" value="${mrpData.cod}" />
										</div>
									<!-- 등록 Button START -->
									<div style="text-align: center">
										<button type="submit"
											class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
											수정</button>
										<a href="mrpmanagement" class="me-2">
											<button type="button"
												class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
												수정취소</button>
										</a>
									</div>
									<!-- 등록 Button END -->
								</form>
								<!-- 등록 END -->
							</div>
						</div>
						<!-- 등록 FORM END -->
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
</html>