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
	<!-- 2024년 5월 7일 오전 10시 6분 박현우 -->
	<!-- 거래처 등록 테이블 START -->
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
						<h3>거래처 등록</h3>
						<p class="text-subtitle text-muted">거래처의 기초 등록을 위한 페이지</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">거래처
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
								<div class="d-flex" style="justify-content: space-between">
									<h5 class="m-0">거래처 등록</h5>
								</div>
							</div>
							<div class="card-body mb-3">
								<form action="clientinsertfn" method="post">
									<div class="mb-4">
										<table class="table table-bordered">
											<tr>
												<td width="150">거래처 번호</td>
												<td><input type="text" id="cod" name="cod"
													class="form-control" value="${nextCod}"
													placeholder="거래처 번호를 입력해주세요." readonly required /></td>
											</tr>
											<tr>
												<td width="150">거래처명</td>
												<td><input type="text" id="name" name="name"
													class="form-control" placeholder="거래처명을 입력해주세요." maxlength="100" required />
												</td>
											</tr>
											<tr>
												<td width="150">거래처 대표자명</td>
												<td><input type="text" id="representative"
													name="representative" class="form-control"
													placeholder="거래처 대표자 명을 입력해주세요." required /></td>
											</tr>
											<tr>
												<td width="150">거래처측 매니저명</td>
												<td><input type="text" id="managerName"
													name="managerName" class="form-control"
													placeholder="거래처측 매너지 이름을 입력해주세요." required /></td>
											</tr>
											<tr>
												<td width="150">매니저 번호</td>
												<td><input type="text" id="managerTel"
													name="managerTel" class="form-control"
													placeholder="거래처측 매니저 전화번호를 입력해주세요." required /></td>
											</tr>
											<tr>
												<td width="150">Fax</td>
												<td><input type="text" id="faxnum" name="faxnum"
													class="form-control" placeholder="Fax번호를 입력해주세요. (- 입력 필수)"
													required /></td>
											</tr>
											<tr>
												<td width="150">거래처 주소</td>
												<td><input type="text" id="address" name="address"
													class="form-control" placeholder="거래처 주소를 입력해주세요." required />
												</td>
											</tr>
											<tr>
												<td width="150">우편 번호</td>
												<td><input type="text" id="postcode" name="postcode"
													class="form-control" placeholder="거래처 우편번호를 입력해주세요."
													required /></td>
											</tr>
<!-- 											<tr>
												<td width="150">거래처 등급</td>
												<td><input type="text" id="discountClass"
													name="discountClass" class="form-control"
													style="width: 70%; float: left"
													placeholder="거래처 등급 입력 버튼을 눌러 입력해주세요." readonly required />
													<button type="button" class="btn btn-primary"
														id="loadDiscountValues" data-bs-toggle="modal"
														data-bs-target="#loadDiscountValuesModal"
														style="margin-left: 2rem; width: 15%">거래처 등급 입력</button></td>
											</tr> -->
										</table>
									</div>
									<div style="text-align: center">
										<button type="submit"
											class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
											거래처 등록</button>
										<a href="client" class="me-2">
											<button type="button"
												class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
												등록취소</button>
										</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 부서 등록 테이블 END -->

	<!--  loadDiscountValues Modal START  -->
	<div class="modal fade" id="loadDiscountValuesModal" tabindex="-1"
		aria-labelledby="loadDiscountValuesLavel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loadDiscountValuesLavel">데이터 선택</h5>
					<input type="text" id="searchDataInput" class="form-control"
						placeholder="검색할 데이터를 입력해주세요."
						style="margin-left: 10px; width: auto; flex-grow: 1" />
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">등급</th>
								<th scope="col">할인율</th>
							</tr>
						</thead>
						<tbody id="modalDataTableBody">
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
	<!-- loadDiscountValues Modal END  -->

	<script type="text/javascript">
         /* loadDiscountValues START */
         function setData(className) {
            $('#discountClass').val(className);
            $('#loadDiscountValuesModal').modal('hide');
            $('.modal-backdrop').remove();
         }

         $(document).ready(function () {
 			/* input type=text에 숫자만 들어가게 하는 이벤트 START */
 			$('#postcode').on('input', function() {
 	            // 숫자 이외의 문자 제거
 	            this.value = this.value.replace(/[^0-9]/g, '');
 			});
 			/* input type=text에 숫자만 들어가게 하는 이벤트 END */
        	 
        	 
            $('#loadDiscountValues').on('click', function () {
               $.ajax({
                  url: 'api/get-discount',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item) {
                        if (item.className) {
                           rows +=
                              '<tr onclick="setData(\'' +
                              item.className +
                              '\')" ' +
                              'class="searchData" data-className="' +
                              item.className +
                              '" data-discrate="' +
                              item.discrate +
                              '" style= "' +
                              'cursor: pointer' +
                              '">' +
                              '<td>' +
                              item.className +
                              '</td>' +
                              '<td>' +
                              item.discrate +
                              '</td>' +
                              '</tr>';
                        }
                     });
                     $('#modalDataTableBody').html(rows);
                     $('#loadDiscountValuesModal').modal('show');
                  },
               });
            });
            
            $('#searchDataInput').on('keyup', function () {
               let searchInputData = $(this).val();
               $('.searchData').each(function () {
                  let className = $(this).data('className');
                  let discrate = $(this).data('discrate');
                  $(this).toggle(className.includes(searchInputData) || discrate.includes(searchInputData));
               });
            });
         });
         /* loadDiscountValues END */
      </script>
</body>
</html>
