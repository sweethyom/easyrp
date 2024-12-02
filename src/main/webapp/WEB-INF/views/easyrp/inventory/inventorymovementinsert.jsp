<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            <a href="#" class="burger-btn d-block d-xl-none"> <i class="bi bi-justify fs-3"></i> </a>
         </header>
         <div class="page-heading">
            <div class="page-title">
               <div class="row">
                  <div class="col-12 col-md-6 order-md-1 order-last">
                     <h3>재고 이동 등록</h3>
                     <p class="text-subtitle text-muted">재고 이동 등록</p>
                  </div>
                  <div class="col-12 col-md-6 order-md-2 order-first">
                     <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="/easyrp">home</a></li>
                           <li class="breadcrumb-item active" aria-current="page">재고 이동 등록</li>
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
                              <h5 class="m-0">재고 이동 등록</h5>
                              <button
                                 type="button"
                                 class="btn btn-primary"
                                 id="loadDatas"
                                 data-bs-toggle="modal"
                                 data-bs-target="#dataPurchaseOrderModal"
                                 style="float: left; width: 10%"
                              >
                                 발주 데이터
                              </button>
                           </div>
                        </div>
                        <div class="card-body mb-3">
                           <form action="inventorymovementinsertfn" method="post">
                              <div class="mb-4">
                                 <table class="table table-bordered">
                                   <tr>
                                       <td width="150">이동코드</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="movecod"
                                             name="movecod"
                                             class="form-control"
                                             placeholder="이동코드를 선택해주세요."
                                             required
                                          />
                                       </td>
                                    </tr>
                                    <tr>
                                       <td width="150">이동날짜</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="movedate"
                                             name="movedate"
                                             class="form-control"
                                             placeholder="이동날짜를 선택해주세요."
                                             required
                                          />
                                       </td>
                                    </tr>
                                    <!-- 글쓴이 INPUT (로그인 시 자동으로 값 입력 readonly) -->
                                    <tr>
                                       <td width="150">담당자</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="manager"
                                             name="manager"
                                             class="form-control"
                                             value="${empName }"
                                             placeholder="로그인을 하면 자동으로 입력됩니다."
                                             readonly
                                             required
                                          />
                                       </td>
                                    </tr>
                                   <!-- 출고 창고/장소, 입고 창고/장소 -->
                                    <tr>
                                       <td width="150">출고 창고</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="oboundwarehouse"
                                             name="oboundwarehouse"
                                             class="form-control"
                                             placeholder="출고창고를 선택해주세요."
                                             readonly
                                             required
                                          />
                                       </td>
                                    </tr>
									<tr>
                                       <td width="150">출고 장소</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="oboundlocation"
                                             name="oboundlocation"
                                             class="form-control"
                                             placeholder="출고장소를 선택해주세요."
                                             readonly
                                             required
                                          />
                                       </td>
                                    </tr>
                                    <tr>
                                       <td width="150">입고 창고</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="iboundwarehouse"
                                             name="iboundwarehouse"
                                             class="form-control"
                                             placeholder="입고창고를 선택해주세요."
                                             readonly
                                             required
                                          />
                                       </td>
                                    </tr>
									<tr>
                                       <td width="150">입고 장소</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="iboundlocation"
                                             name="iboundlocation"
                                             class="form-control"
                                             placeholder="입고장소를 선택해주세요."
                                             readonly
                                             required
                                          />
                                       </td>
                                    </tr>
                                    <tr>
                                       <td width="150">품번</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="prodcod"
                                             name="prodcod"
                                             class="form-control"
                                             placeholder="품번을 선택해주세요."
                                             readonly
                                             required
                                          />
                                       </td>
                                    </tr>
                                    <tr>
                                       <td width="150">품명</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="prodname"
                                             name="prodname"
                                             class="form-control"
                                             placeholder="품명을 선택해주세요."
                                             readonly
                                             required
                                          />
                                       </td>
<<<<<<< HEAD
                                    </tr>                                                     
=======
                                    <!-- 모달로 입력 테스트 -->
>>>>>>> origin/feature/feature-hyomihome
                                    <tr>
                                       <td width="150">단위</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="unit"
                                             name="unit"
                                             class="form-control"
                                             style="width: 80%; float: left"
                                             placeholder="단위를 선택해주세요."
                                             required
                                          />
                                          <button
                                             type="button"
                                             class="btn btn-primary"
                                             id="loadValues"
                                             data-bs-toggle="modal"
                                             data-bs-target="#kvModal"
                                             style="margin-left: 2rem; width: 10%"
                                          >
                                             단위 선택하기
                                          </button>
                                       </td>
                                    </tr>
<<<<<<< HEAD
                                       <tr>
=======
>>>>>>> origin/feature/feature-hyomihome
                                       <td width="150">이동수량</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="qty"
                                             name="qty"
                                             class="form-control"
                                             placeholder="이동수량을 선택해주세요."
                                             readonly
                                             required
                                          />
                                       </td>
                                    </tr>                                   
<<<<<<< HEAD
=======

>>>>>>> origin/feature/feature-hyomihome
                                 </table>
                              </div>
                              <!-- 공통등록 Button START -->
                              <div style="text-align: center">
                                 <button
                                    type="submit"
                                    class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4"
                                 >
                                    등록
                                 </button>
                                 <a href="inventorymovement" class="me-2">
                                    <button
                                       type="button"
                                       class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4"
                                    >
                                       등록취소
                                    </button>
                                 </a>
                              </div>
                              <!-- 공통등록 Button END -->
                           </form>
                           <!-- 공통등록 END -->
                        </div>
                     </div>
                     <!-- 공통등록 FORM END -->
                  </div>
               </div>
            </section>
         </div>
      </div>
      <!-- 공통 사용 테이블 END -->
      <!-- Value Modal START  -->
      <div class="modal fade" id="kvModal" tabindex="-1" aria-labelledby="kvModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="kvModalLabel">코드-값 선택</h5>
                  <input
                     type="text"
                     id="searchInput"
                     class="form-control"
                     placeholder="코드 또는 값을 입력해주세요."
                     style="margin-left: 10px; width: auto; flex-grow: 1"
                  />
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                  <table class="table">
                     <thead>
                        <tr>
                           <th scope="col">#</th>
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
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
               </div>
            </div>
         </div>
      </div>
      <!-- Value Modal END  -->
      <!-- Data Modal START  -->
      <div class="modal fade" id="dataPurchaseOrderModal" tabindex="-1" aria-labelledby="dataModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="dataModalLabel">선택</h5>
                  <input
                     type="text"
                     id="searchDataInput"
                     class="form-control"
                     placeholder="검색할 데이터를 입력해주세요."
                     style="margin-left: 10px; width: auto; flex-grow: 1"
                  />
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                  <table class="table">
                     <thead>
                        <tr>
                           <th scope="col">발주번호</th>
                           <th scope="col">담당자코드</th>
                        </tr>
                     </thead>
                     <tbody id="purchaseOrderModalDataTableBody">
                        <!-- 여기에 Ajax로 만든 html 속성이 들어감  -->
                     </tbody>
                  </table>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
               </div>
            </div>
         </div>
      </div>
      <!-- Data Modal END  -->
      <script type="text/javascript">
         /* valueModal START */
         function setValue(cod, value) {
            $('#unit').val(value);
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


         /*PurchaseOrderModalTable START */
         function setData(movecod, movedate, manager,oboundwarehouse,oboundlocation, iboundwarehouse,iboundlocation,prodcod,prodname,unit,qty) {
            $('#movecod').val(moveCod);
            $('#movedate').val(moveDate);
            $('#manager').val(employeeCod);
            $('#oboundwarehouse').val(oboundWarehouse);
            $('#oboundlocation').val(oboundLocation);
            $('#iboundwarehouse').val(iboundWarehouse);
            $('#iboundlocation').val(iboundLocation);
            $('#prodcod').val(prodCod);
            $('#prodname').val(prodName);
            $('#unit').val(unit);
            $('#qty').val(qty);
            $('#dataPurchaseOrderModal').modal('hide');
            $('.modal-backdrop').remove();
         }

         $(document).ready(function () {
            $('#loadDatas').on('click', function () {
               $.ajax({
                  url: 'api/get-podata',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item) {
                        if (item.cod && item.manager) {
                           rows +=
                              '<tr onclick="setData(\'' +item.movecod +
                              "', '" +
                              item.manager +
                              '\')" ' +
                              'class="searchData" data-cod="' +
                              item.cod +
                              '" data-manager="' +
                              item.manager +
                              '" style= "' +
                              'cursor: pointer' +
                              '">' +
                              '<td>' +
                              item.cod +
                              '</td>' +
                              '<td>' +
                              item.manager +
                              '</td>' +
                              '</tr>';
                        }
                     });
                     console.log(rows);
                     $('#purchaseOrderModalDataTableBody').html(rows);
                     
                     $('#dataPurchaseOrderModal').modal('show');
                  },
               });
            });
            
            $('#searchDataInput').on('keyup', function () {
               let searchInputData = $(this).val();
               $('.searchData').each(function () {
                  let movecod = $(this).data('movecod');
                  let manager = $(this).data('manager');
                  $(this).toggle(movecod.includes(searchInputData) || movecod.includes(searchInputData));
               });
            });
         });
         /* DataModal END */
      </script>
   </body>
</html>
