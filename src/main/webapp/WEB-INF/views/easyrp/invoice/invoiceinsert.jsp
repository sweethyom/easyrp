<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<h3>청구 등록</h3>
						<p class="text-subtitle text-muted">청구를 등록해주세요.</p>
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
										<button type="button" class="btn btn-primary mx-2" id="loadInventory"
										data-bs-toggle="modal" data-bs-target="#dataModal"
										style="float: left; width: 24%">
											구매 청구</button>
										<button type="button" class="btn btn-primary mx-2" id="loadProduct"
										data-bs-toggle="modal" data-bs-target="#dataModal"
										style="float: left; width: 24%">
											생산 청구</button>
									</div>
								</div>
							</div>
							<div class="card-body mb-3">
								<form id="formContainer" action="invoiceinsertfn" method="post">
									<div class="mb-4">
										<table class="table table-bordered">
											<!-- 청구일자 INPUT -->
											<tr>
												<td width="150">청구일자</td>
												<td><input type="text" id="invDate" name="invDate" class="form-control" readonly/>
												</td>
											</tr>
											<!-- 청구구분 INPUT -->
											<tr>
												<td width="150">청구구분</td>
												<td><input type="text" id="invClass" name="invClass"
													class="form-control" placeholder="청구구분을 불러오세요." readonly/>
												</td>
											</tr>
											<!-- 청구자 INPUT -->
											<tr>
												<td width="150">청구자</td>
												<td><input type="text" id="employeeName" name="employeeName" value="${empName }"
													class="form-control" placeholder="로그인하면 자동으로 불러옵니다." required readonly/>
												</td>
											</tr>
											<!-- 비고 INPUT -->
											<tr>
												<td width="150">비고</td>
												<td><input type="text" id="note" name="note" class="form-control"/>
												</td>
											</tr>
										</table>
										<div>
											<input type="hidden" id="employeeCod" name="employeeCod" value="${empCode}" />
										</div>
										<div id="mrpCodContent">
											<!-- 여기에 ajax로 생성된 hidden input이 만들어진다. -->
										</div>
										<br/>
										<table class="table table-hover mb-0">
											<thead>
												<tr>
													<th>순번</th>
													<th>품번</th>
													<th>품명</th>
													<th>규격</th>
													<th>요청일</th>
													<th>재고단위</th>
													<th>재고단위수량</th>
													<th>관리단위</th>
													<th>관리단위수량</th>
													<th>거래처</th>
												</tr>
											</thead>
											<tbody id="mrpTableBody">
												<!-- 여기에 Ajax로 만든 html 속성이 들어감  -->
												<tr>
													<td colspan="10" align="center">청구를 등록해주세요.</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- 등록 Button START -->
									<div style="text-align: center">
										<button type="submit"
											class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
											등록</button>
										<a href="invoicemanagement" class="me-2">
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
					<h5 class="modal-title" id="kvModalLabel">품번-품명 선택</h5>
					<input type="text" id="searchInput" class="form-control"
						placeholder="품번 또는 품명을 입력해주세요."
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
								<th scope="col"><input type="checkbox" id="checkAllBtn"/></th>
								<th scope="col">mrp번호</th>
								<th scope="col">계획일자</th>
								<th scope="col">발주예정일</th>
								<th scope="col">품번</th>
								<th scope="col">품명</th>
								<th scope="col">규격</th>
								<th scope="col">단위</th>
								<th scope="col">수량</th>
							</tr>
						</thead>
						<tbody id="modalDataTableBody">
							<!-- 여기에 Ajax로 만든 html 속성이 들어감  -->
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" onclick="setData()">선택</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- Data Modal END  -->
     <script type="text/javascript">
         /* dataModal START */
          function setData() {
        	 var rowData = new Array();
        	 var mrpCodList = new Array();
        	 var checkbox = $("input[name=chk]:checked");
        	 
        	 checkbox.each(function(i){
        		 var tr = checkbox.parent().parent().eq(i);
        		 var td = tr.children();
        		 
        		 rowData.push(tr.text());
        		 
        		 var cod = td.eq(1).text();
        		 
        		 mrpCodList.push(cod);
        	 })
        	 
        	  $.ajax({
                  url: 'api/get-mrpselectbycodval',
                  method: 'GET',
                  data: {
                	  mrpCodList : mrpCodList
                  },
                  traditional:true,
                  success: function (data) {
                     let rows = '';
                     let contents = '';
                     data.forEach(function (item, index) {
                        if (item.account == '완제') {
                           rows +=
                              '<tr>' +
                              '<td>' +
                              (index+1) +
                              '</td>' +
                              '<td>' +
                              item.productCod +
                              '</td>' +
                              '<td>' +
                              item.prodname +
                              '</td>' +
                              '<td>' +
                              item.spec +
                              '</td>' +
                              '<td>' +
                              item.takeDate +
                              '</td>' +
                              '<td>' +
                              item.unitName +
                              '</td>' +
                              '<td>' +
                              item.qty +
                              '</td>' +
                              '<td>' +
                              item.invoiceUnitName +
                              '</td>' +
                              '<td>' +
                              Math.ceil(item.qty / item.invoiceAmount) +
                              '</td>' +
                              '<td>' +
                              item.clientName +
                              '</td>' +
                              '</tr>';
                           contents +=
                           	  '<div>'+
                           	  '<input type="hidden" name="mrpCod" value="' +
                           	  item.cod +
                           	  '"/>' + 
                           	  '</div>'
                        }
                        if (item.account == '자재') {
                           rows +=
                              '<tr>' +
                              '<td>' +
                              (index+1) +
                              '</td>' +
                              '<td>' +
                              item.inventoryCod +
                              '</td>' +
                              '<td>' +
                              item.invname +
                              '</td>' +
                              '<td>' +
                              item.invSpec +
                              '</td>' +
                              '<td>' +
                              item.takeDate +
                              '</td>' +
                              '<td>' +
                              item.invUnitName +
                              '</td>' +
                              '<td>' +
                              item.qty +
                              '</td>' +
                              '<td>' +
                              item.invoiceInvUnitNmae +
                              '</td>' +
                              '<td>' +
                              Math.ceil(item.qty / item.invoiceUnitAmount) +
                              '</td>' +
                              '<td>' +
                              item.clientName +
                              '</td>' +
                              '</tr>';
                           contents +=
                            	  '<div>'+
                            	  '<input type="hidden" name="mrpCod" value="' +
                            	  item.cod +
                            	  '"/>' + 
                            	  '</div>'
                        }
                     });
                     $('#mrpTableBody').html(rows);
                     $('#mrpCodContent').html(contents);
                     
                     if(data[0].account == '완제'){
                    	 $('#invClass').val('생산');	 
                     }else{
                    	 $('#invClass').val('구매');
                     }
                  },
               });
        	
			$('#dataModal').modal('hide');
			$('.modal-backdrop').remove();
         }

         $(document).ready(function () {
            $('#loadProduct').on('click', function () {
               $.ajax({
                  url: 'api/get-mrpval',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item) {
                        if (item.account == '완제') {
                           rows +=
                              '<tr class="searchData" data-productCod="' +
                              item.productCod +
                              '" data-prodname="' +
                              item.prodname +
                              '" style= "' +
                              'cursor: pointer' +
                              '">' +
                              '<td><input type="checkbox" class="chk" name="chk"/></td>' +
                              '<td>' +
                              item.cod +
                              '</td>' +
                              '<td>' +
                              item.takeDate +
                              '</td>' +
                              '<td>' +
                              item.poDate +
                              '</td>' +
                              '<td>' +
                              item.productCod +
                              '</td>' +
                              '<td>' +
                              item.prodname +
                              '</td>' +
                              '<td>' +
                              item.spec +
                              '</td>' +
                              '<td>' +
                              item.unitName +
                              '</td>' +
                              '<td>' +
                              item.qty +
                              '</td>' +
                              '</tr>';
                        }
                     });
                     $('#modalDataTableBody').html(rows);
                     
                     $('#dataModal').modal('show');
                  },
               });
            });
            
            $('#loadInventory').on('click', function () {
                $.ajax({
                   url: 'api/get-mrpval',
                   method: 'GET',
                   success: function (data) {
                      let rows = '';
                      data.forEach(function (item) {
                         if (item.account == '자재') {
                            rows +=
                               '<tr class="searchData" data-productCod="' +
                               item.productCod +
                               '" data-prodname="' +
                               item.prodname +
                               '" style= "' +
                               'cursor: pointer' +
                               '">' +
                               '<td><input type="checkbox" class="chk" name="chk"/></td>' +
                               '<td>' +
                               item.cod +
                               '</td>' +
                               '<td>' +
                               item.takeDate +
                               '</td>' +
                               '<td>' +
                               item.poDate +
                               '</td>' +
                               '<td>' +
                               item.inventoryCod +
                               '</td>' +
                               '<td>' +
                               item.invname +
                               '</td>' +
                               '<td>' +
                               item.invSpec +
                               '</td>' +
                               '<td>' +
                               item.invUnitName +
                               '</td>' +
                               '<td>' +
                               item.qty +
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
                  let productCod = String($(this).data('productcod')).toLowerCase();
                  let prodname = String($(this).data('prodname')).toLowerCase();
                  $(this).toggle(productCod.includes(searchInputData) || prodname.includes(searchInputData));
               });
            });
         });
         
         /* dataModal END */
         
         // tr 행을 클릭하면 체크박스를 선택해주는 함수
         $('#modalDataTableBody').on('click', 'tr', function(e){
        	 if($(e.target).is('input:checkbox')) return;
        	 var chkbox = $(this).find('td:first-child :checkbox');
        	 chkbox.prop('checked', !chkbox.prop('checked'));
         });
         
         // 클릭하면 전체 체크박스가 선택되고, 해제된다.
         // 체크박스를 이미 선택해놨을 시 제대로 작동하지 않아서 보완 필요
         // (아무것도 선택되어 있지 않거나, 모두 선택되어 있을 때만 제대로 작동)
         $('#checkAllBtn').click(function(){
        	 if($(this).is(":checked")){
        		 $(".chk").attr("checked", true);
        	 }else {
        		 $(".chk").attr("checked", false);
        	 }
         })
         
         // 선택한 데이터만큼 tr 행을 만들어준다.
         //function getData(){
        	// var rowData = new Array();
        	// var tdArr = new Array();
        	// var checkbox = $("input[name=chk]:checked");
        	 
        	// checkbox.each(function(i){
        		// var tr = checkbox.parent().parent().eq(i);
        		// var td = tr.children();
        		 
        	//	 rowData.push(tr.text());
        		 
        	//	 var 
        	// })
         //}
         
         
	</script>
	<script>
		var today = new Date();
		var year = today.getFullYear();
		var month = (today.getMonth() + 1).toString().padStart(2, '0');
		var day = today.getDate().toString().padStart(2, '0');
		
		var formattedDate = year + '-' + month + '-' + day;
		document.getElementById('invDate').value = formattedDate;
	</script>
</html>