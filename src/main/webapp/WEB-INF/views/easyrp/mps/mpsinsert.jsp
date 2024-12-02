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
						<h3>주계획 등록</h3>
						<p class="text-subtitle text-muted">주계획을 등록해주세요.</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">주계획 등록</li>
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
											<!-- 
										<button type="button" class="btn btn-primary" id="loadDatas"
											data-bs-toggle="modal" data-bs-target="#dataModal"
											style="float: left; width: 24%">
											판매계획 가져오기</button> -->
									</div>
								</div>
							</div>
							<div class="card-body mb-3">
								<form action="mpsinsertfn" method="post">
									<div class="mb-4">
										<table class="table table-bordered">
											<!-- 수주번호 INPUT -->
											<tr>
												<td width="150">수주번호</td>
												<td><input type="text" id="orderCod" name="orderCod"
													class="form-control" placeholder="수주번호를 불러오세요." required readonly/>
												</td>
											</tr>
											<!-- 수주번호 상세 INPUT -->
											<tr>
												<td width="150">수주상세번호</td>
												<td><input type="text" id="orderdetailNum" name="orderdetailNum"
													class="form-control" placeholder="수주상세번호를 불러오세요." required readonly/>
												</td>
											</tr>
											<!-- 등록자 INPUT (로그인 시 자동으로 값 입력 readonly) -->
											<tr>
												<td width="150">등록자</td>
												<td><input type="text" id="author" name="author"
													class="form-control readonly" value="${empName }"
													placeholder="로그인을 하면 자동으로 입력됩니다." required readonly />
												</td>
											</tr>
											<!-- 수주일자 INPUT -->
											<tr>
												<td width="150">수주일자</td>
												<td><input type="text" id="orderDate" name="orderDate"
													class="form-control" placeholder="수주일자를 불러오세요." required readonly/>
												</td>
											</tr>
											<!-- 고객명 INPUT -->
											<tr>
												<td width="150">고객명</td>
												<td><input type="text" id="clientName" name="clientName"
													class="form-control" placeholder="고객명을 불러오세요." required readonly/>
												</td>
											</tr>
											<!-- 품번 INPUT -->
											<tr>
												<td width="150">품번</td>
												<td><input type="text" id="productCod" name="productCod"
													class="form-control" placeholder="품번을 불러오세요." required readonly/>
												</td>
											</tr>
											<!-- 품명 INPUT -->
											<tr>
												<td width="150">품명</td>
												<td><input type="text" id="prodname" name="prodname"
													class="form-control" placeholder="품명을 불러오세요." required readonly/>
												</td>
											</tr>
											<!-- 수량 INPUT -->
											<tr>
												<td width="150">수주수량</td>
												<td><input type="text" id="orderQty" name="orderQty"
													class="form-control" placeholder="수량을 불러오세요." readonly/>
												</td>
											</tr>
											<!-- 수량 INPUT -->
											<tr>
												<td width="150">수주잔량</td>
												<td><input type="text" id="remainQty" name="remainQty"
													class="form-control" placeholder="수량을 불러오세요." readonly/>
												</td>
											</tr>
											<!-- 수량 INPUT -->
											<tr>
												<td width="150">계획수량</td>
												<td><input type="text" id="qty" name="qty"
													class="form-control" placeholder="수량을 입력해주세요." required 
													oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
													maxlength="5"/>
												</td>
											</tr>
											<!-- 단위 INPUT (모달) -->
											<tr>
												<td width="150">단위</td>
												<td><input type="text" id="unitName"
													name="unitName" class="form-control"
													style="width: 100%; float: left" placeholder="단위를 불러오세요."
													required readonly/>
													<!-- 
													<button type="button" class="btn btn-primary"
														id="loadValues" data-bs-toggle="modal"
														data-bs-target="#kvModal"
														style="margin-left: 2rem; width: 10%">
														단위 불러오기</button></td>  -->
											<!-- 납기일 INPUT -->
											<tr>
												<td width="150">납기일</td>
												<td><input type="text" id="dday" name="dday"
													class="form-control" placeholder="납기일을 불러오세요." required readonly/>
												</td>
											</tr>
											<!-- 계획일 INPUT -->
		                                    <tr>
		                                       <td width="150">계획일</td>
		                                       <td>
		                                          <input
		                                             type="date"
		                                             id="planDate"
		                                             name="planDate"
		                                             class="form-control"
		                                             placeholder="계획일을 입력해주세요."
		                                             required
		                                          />
		                                       </td>
		                                    </tr>
		                                    <!-- 조달구분 INPUT -->
											<tr style="display:none">
												<td width="150">조달구분</td>
												<td><select id="procurement" name="procurement" class="form-select">
													<option value="구매">구매</option>
													<option value="생산">생산</option>
												</select>
												</td>
											</tr>
											<!-- 비고 INPUT -->
											<tr>
												<td width="150">비고</td>
												<td><input type="text" id="note" name="note"
													class="form-control" placeholder="" />
												</td>
											</tr>
										</table>
									</div>
									<div>
										<input type="hidden" id="employeeCod" name="employeeCod" value="${empCode}" />
										<input type="hidden" id="plan" name="plan" value='수주' />
									</div>
									<!-- 등록 Button START -->
									<div style="text-align: center">
										<button type="submit"
											class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
											등록</button>
										<a href="mpsmanagement" class="me-2">
											<button type="button"
												class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
												등록취소</button>
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
	<!-- 공통 사용 테이블 END -->
	<!-- Unit Value Modal START  -->
	<div class="modal fade" id="kvModal" tabindex="-1"
		aria-labelledby="kvModalLabel" aria-hidden="true" data-bs-backdrop='static' data-bs-keyboard='false' >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="kvModalLabel">코드-값 선택</h5>
					<input type="text" id="searchInput" class="form-control"
						placeholder="코드 또는 값을 입력해주세요."
						style="margin-left: 10px; width: auto; flex-grow: 1" />
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body overflow-y-auto" style="height: 60vh">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Code</th>
								<th scope="col">Value</th>
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
	<!-- Value Modal END  -->
	<!-- Data Modal START  -->
	<div class="modal fade modal-lg" id="dataModal" tabindex="-1"
		aria-labelledby="dataModalLabel" aria-hidden="true" data-bs-backdrop='static' data-bs-keyboard='false'>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="dataModalLabel">데이터 선택</h5>
					<input type="text" id="searchDataInput" class="form-control"
						placeholder="검색할 데이터를 입력해주세요."
						style="margin-left: 10px; width: auto; flex-grow: 1" />
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body overflow-y-auto" style="height: 60vh">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">수주번호</th>
								<th scope="col">No.</th>
								<th scope="col">주문일자</th>
								<th scope="col">품번</th>
								<th scope="col">품명</th>
								<th scope="col">수량</th>
								<th scope="col">단위</th>
								<th scope="col">고객</th>
								<th scope="col">납기일</th>
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
</body>
	<!-- Data Modal END  -->
     <script type="text/javascript">
         /* valueModal START */
         function setValue(cod, name) {
        	$('#unitName').val(name);
            $('#kvModal').modal('hide');
            $('.modal-backdrop').remove();
         }

         $(document).ready(function () {
            $('#loadValues').on('click', function () {
               $.ajax({
                  url: 'api/get-unit',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item) {
                        if (item.cod) {
                           rows +=
                              '<tr onclick="setValue(\'' +
                              item.name +
                              '\')" ' +
                              'class="searchValue" data-cod="' +
                              item.cod +
                              '" data-name="' +
                              item.name +
                              '" style= "' +
                              'cursor: pointer' +
                              '">' +
                              '<td>' +
                              item.cod +
                              '</td>' +
                              '<td>' +
                              item.name +
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
            	  var cod = String($(this).data('cod')).toLowerCase()
                  var name = String($(this).data('name')).toLowerCase()
                  $(this).toggle(cod.includes(searchInputVlaue) || name.includes(searchInputVlaue));
               });
            });
         });
         /* valueModal END */

         /* DataModal START */
          function setData(cod, num, orderDate, productCod, clientName, prodname, qty, curRemainQty, unitName, dday, note) {
            $('#orderCod').val(cod);
            $('#orderdetailNum').val(num);
            $('#orderDate').val(orderDate);
            $('#productCod').val(productCod);
            $('#clientName').val(clientName);
            $('#prodname').val(prodname);
            $('#orderQty').val(qty);
            $('#remainQty').val(curRemainQty);
            $('#unitName').val(unitName);
            $('#dday').val(dday);
            if(note != "null"){
            	$('#note').val(note);
            }
            $('#dataModal').modal('hide');
            $('.modal-backdrop').remove();
         }

         $(document).ready(function () {
            $('#loadDatas').on('click', function () {
               $.ajax({
                  url: 'api/get-ov',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item) {
                        if (item.cod) {
                           rows +=
                              '<tr onclick="setData(\'' +
                              item.cod +
                              "', '" +
                              item.num +
                              "', '" +
                              item.orderDate +
                              "', '" +
                              item.productCod +
                              "', '" +
                              item.clientName +
                              "', '" +
                              item.prodname +
                              "', '" +
                              item.qty +
                              "', '" +
                              item.curRemainQty +
                              "', '" +
                              item.unitName +
                              "', '" +
                              item.dday +
                              "', '" +
                              item.note +
                              '\')" ' +
                              'class="searchData" data-cod="' +
                              item.cod +
                              '" data-clientName="' +
                              item.clientName +
                              '" data-productCod="' +
                              item.productCod +
                              '" data-prodname="' +
                              item.prodname +
                              '" style= "' +
                              'cursor: pointer' +
                              '">' +
                              '<td>' +
                              item.cod +
                              '</td>' +
                              '<td>' +
                              item.num +
                              '</td>' +
                              '<td>' +
                              item.orderDate +
                              '</td>' +
                              '<td>' +
                              item.productCod +
                              '</td>' +
                              '<td>' +
                              item.prodname +
                              '</td>' +
                              '<td>' +
                              item.qty +
                              '</td>' +
                              '<td>' +
                              item.unitName +
                              '</td>' +
                              '<td>' +
                              item.clientName +
                              '</td>' +
                              '<td>' +
                              item.dday +
                              '</td>' +
                              '</tr>';
                        }
                     });
                     $('#modalDataTableBody').html(rows);
                     $('#dataModal').modal('show');
                  },
               });
            });
            
            $('#searchDataInput').on('keyup', function () {
               let searchInputData = $(this).val();
               $('.searchData').each(function () {
                  let cod = String($(this).data('cod')).toLowerCase();
                  let clientName = String($(this).data('clientname')).toLowerCase();
                  let productCod = String($(this).data('productcod')).toLowerCase();
                  let prodname = String($(this).data('prodname')).toLowerCase();
                  $(this).toggle(cod.includes(searchInputData) || clientName.includes(searchInputData)
                		  || productCod.includes(searchInputData) || prodname.includes(searchInputData));
               });
            });
         });
         /* DataModal END */
	</script>
	<script type="text/javascript">
		$('.readonly').on('keydown paste focus mousedown',(function(e){
			if(e.keyCode == '')
				e.preventDefault();
		});
	</script>
</html>
