<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <title>Insert title here</title>
   </head>
   <body>
      <!-- 2024년 5월 19일 오후 1시 35분 박현우 -->
      <!-- BOM 상세 및 수정 페이지 START -->
      <div id="main">
         <header class="mb-3">
            <a href="#" class="burger-btn d-block d-xl-none"> <i class="bi bi-justify fs-3"></i> </a>
         </header>
         <div class="page-heading">
            <div class="page-title">
               <div class="row">
                  <div class="col-12 col-md-6 order-md-1 order-last">
                     <h3>제품 및 BOM 상세보기</h3>
                     <p class="text-subtitle text-muted">제품 및 BOM 상세보기를 위한 페이지</p>
                  </div>
                  <div class="col-12 col-md-6 order-md-2 order-first">
                     <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="/easyrp">home</a></li>
                           <li class="breadcrumb-item active" aria-current="page">제품 및 BOM 상세보기</li>
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
                              <h5 class="m-0 col-6">제품 및 BOM 상세보기</h5>
                              <div class="d-flex col-6 justify-content-end">
                                 <button
                                    type="button"
                                    class="btn btn-primary mx-2"
                                    id="bomUpdateSetting"
                                    onclick="updateFormSetting();"
                                    style="float: left; width: 24%"
                                 >
                                    BOM 수정하기
                                 </button>
                              </div>
                           </div>
                        </div>
                        <div class="card-body mb-3">
                           <form id="bomUpdateForm" action="bomupdatefn" method="post">
                              <table class="table">
                                 <tr>
                                    <th width="7%">제품 번호</th>
                                    <td width="20%">
                                       <input
                                          type="text"
                                          class="form-control hyunwoo-input-disabled"
                                          id="prodCod"
                                          name="prodCod"
                                          value="${getBomDetailData[0].prodCod}"
                                          readonly
                                       />
                                    </td>
                                    <th width="7%">제품 명</th>
                                    <td width="20%">
                                       <input
                                          type="text"
                                          class="form-control hyunwoo-input-disabled"
                                          id="productName"
                                          value="${getBomDetailData[0].productName}"
                                          disabled
                                       />
                                    </td>
                                    <th width="7%">제품 그룹 명</th>
                                    <td width="20%">
                                       <input
                                          type="text"
                                          class="form-control hyunwoo-input-disabled"
                                          id="productGroupName"
                                          value="${getBomDetailData[0].productGroupName}"
                                          disabled
                                       />
                                    </td>
                                    <td></td>
                                 </tr>
                              </table>
                              <table id="materialTable" class="table">
                                 <tr id="detailList">
                                    <th width="7%">원자재 코드</th>
                                    <th width="20%">원자재 명</th>
                                    <th width="7%">수 량</th>
                                    <th width="15%">단 가&nbsp;(원)</th>
                                    <th width="15%">금 액&nbsp;(수량 * 단가)</th>
                                    <th width="20%">삭 제</th>
                                 </tr>
                                 <c:forEach var="getBomDetail" items="${getBomDetailData}" varStatus="status">
                                    <tr data-row-id="${status.index}">
                                       <td>
                                          <input
                                             type="text"
                                             id="invCod${status.index}"
                                             name="bomList[${status.index}].invCod"
                                             class="form-control hyunwoo-input-disabled update-disabled"
                                             value="${getBomDetail.invCod }"
                                             disabled
                                          />
                                       </td>
                                       <td>
                                          <input
                                             type="text"
                                             id="invName${status.index}"
                                             class="form-control hyunwoo-input-disabled update-disabled"
                                             data-bs-toggle="modal"
                                             data-bs-target="#loadModal"
                                             onclick="setValueInventoryModal(${status.index});"
                                             value="${getBomDetail.invName }"
                                             placeholder="이 곳을 눌러 원자재를 입력해주세요."
                                             disabled
                                          />
                                       </td>
                                       <td>
                                          <input
                                             type="text"
                                             id="quantity${status.index}"
                                             name="bomList[${status.index}].quantity"
                                             value="${getBomDetail.quantity }"
                                             class="form-control quantity-input hyunwoo-input-disabled update-disabled"
                                             disabled
                                          />
                                       </td>
                                       <td>
                                          <strong id="unitprice${status.index}" class="unitprice"
                                             ><fmt:formatNumber value="${getBomDetail.invUnitprice }" pattern="#,###"
                                          /></strong>
                                       </td>
                                       <td><strong id="totalAmount${status.index}" class="totalAmount"></strong></td>
                                       <td><button class="btn btn-danger deleteRowButton" disabled>삭제</button></td>
                                    </tr>
                                 </c:forEach>
                                 <tr>
                                    <th colspan="1">총 합</th>
                                    <td colspan="1"></td>
                                    <td colspan="1"></td>
                                    <td colspan="1"></td>
                                    <td colspan="2">
                                       <input
                                          type="text"
                                          class="form-control hyunwoo-input-disabled hyunwoo-stdprice"
                                          id="stdprice"
                                          name="stdprice"
                                          value="여기에 자재금액 합계"
                                          readonly
                                       />
                                    </td>
                                    <td></td>
                                 </tr>
                                 <tr>
                                    <td colspan="6" style="border-bottom-width: 0px">
                                       <button type="button" class="btn btn-primary" id="addtrButton" disabled>
                                          원자재 추가
                                       </button>
                                    </td>
                                 </tr>
                              </table>
                              <div style="text-align: center">
                                 <button
                                    type="button"
                                    id="bomUpdateSubmitBtn"
                                    class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4"
                                    onclick="parseIntSubmit();"
                                    style="display: none"
                                 >
                                    BOM 수정
                                 </button>
                                 <a href="productmgmt" class="me-2">
                                    <button
                                       type="button"
                                       class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4"
                                    >
                                       돌아가기
                                    </button>
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
      <!-- BOM 상세 및 수정 페이지 END -->

      <!-- 공통 Modal START  -->
      <div
         class="modal fade"
         id="loadModal"
         tabindex="-1"
         data-bs-backdrop="static"
         data-bs-keyboard="false"
         aria-labelledby="loadModalLabel"
         aria-hidden="true"
      >
         <div class="modal-dialog">
            <div class="modal-content">
               <!-- 여기에 Modal JSP가 삽입됩니다. -->
            </div>
         </div>
      </div>
      <!-- 공통 Modal END  -->

      <script type="text/javascript">

                function setValueProductData() {
                   $('.modal-content').load('setvalueproductdata');
                }


                $(document).ready(function () {
               	let rowIdCounter = ${getBomDetailData.size()};
                   let invCodSet = new Set(); // 중복을 확인하는 Set (Set는 중복을 허용하지않는 value를 넣을 수있는 배열)

                   <c:forEach var="getBomDetail" items="${getBomDetailData}">
                   invCodSet.add("${getBomDetail.invCod}");
                   </c:forEach>

                   console.log(invCodSet);

                   /* input type=text에 숫자만 들어가게 하는 이벤트 START */
                   $('#materialTable').on('input', '.quantity-input', function () {
                      // 숫자 이외의 문자 제거
                      this.value = this.value.replace(/[^0-9]/g, '');

                      // 천 단위 콤마 추가
                      let value = $(this).val();
                      $(this).val(Number(value.replace(/,/g, '')).toLocaleString());
                   });
                   /* input type=text에 숫자만 들어가게 하는 이벤트 END */

                   /* 가격에 한국식 콤마 붙이는 Fn START  */
                   function addCommas(value) {
                      if (value === undefined || value === null) {
                         return '';
                      }
                      value = value.toString().replace(/,/g, '');
                      return Number(value).toLocaleString();
                   }
                   /* 가격에 한국식 콤마 붙이는 Fn END  */

                   /* 총합 계산 함수 START */
                   function updateTotalPrice() {
                      let totalPrice = 0;
                      $('#materialTable .totalAmount').each(function () {
                         let amount = parseInt($(this).text().replace(/,/g, ''), 10);
                         if (!isNaN(amount)) {
                            totalPrice += amount;
                         }
                      });
                      $('#stdprice').val(addCommas(totalPrice));
                   }
                   /* 총합 계산 함수 END */

                      function updateRowTotal($row) {
             let quantity = parseInt($row.find('.quantity-input').val().replace(/,/g, ''), 10);
             let unitprice = parseInt($row.find('.unitprice').text().replace(/,/g, ''), 10);
             let totalAmount = quantity * unitprice;

             if (!isNaN(totalAmount)) {
                $row.find('.totalAmount').text(addCommas(totalAmount));
             } else {
                $row.find('.totalAmount').text('0');
             }
          }

                   /* 수량 * 단가 기입 이벤트 START */
                   $('#materialTable').on('input', '.quantity-input, .unitprice', function () {
                       let $row = $(this).closest('tr');
                       updateRowTotal($row);
                       updateTotalPrice();
                   });
                   /* 수량 * 단가 기입 이벤트 END */

                   /* addtrButton 클릭 시 동적 tr 생성 방식 START */
                   $('#addtrButton').click(function () {
                      let totalRow = $('#materialTable tr').eq(-2);

                      let newRow = `
                       <tr data-row-id="\${rowIdCounter}">
                           <td><input type="text" id="invCod\${rowIdCounter}" name="bomList[\${rowIdCounter}].invCod" class="form-control" readonly /></td>
                           <td><input type="text" id="invName\${rowIdCounter}" class="form-control" data-bs-toggle="modal" data-bs-target="#loadModal" onclick="setValueInventoryModal(\${rowIdCounter});" placeholder="이 곳을 눌러 원자재를 입력해주세요." readonly /></td>
                           <td><input type="text" id="quantity\${rowIdCounter}" name="bomList[\${rowIdCounter}].quantity" class="form-control quantity-input" disabled/></td>
                           <td><strong id="unitprice\${rowIdCounter}" class="unitprice"></strong></td>
                           <td><strong id="totalAmount\${rowIdCounter}" class="totalAmount">수량 입력 시 계산</strong></td>
                           <td><button class="btn btn-danger deleteRowButton">삭제</button></td>
                       </tr>
                   `;

                      // 새로운 행을 '총 합' 행 위에 삽입
                      $(newRow).insertBefore(totalRow);
                      rowIdCounter++;
                   });
                   /* addtrButton 클릭 시 동적 tr 생성 방식 END */

                   /* 모달에서 값을 설정하는 것 START  */
                   $(document).on('click', '.setValue', function () {
                      let valueName = $(this).data('name');
                      let valueCod = $(this).data('cod');
                      let valueUnitprice = $(this).data('unitprice');
                      let rowId = $('#loadModal').data('row-id');
                      let $parentRow = $(parent.document).find(`tr[data-row-id="\${rowId}"]`);
                      let originalCod = $parentRow.find(`#invCod\${rowId}`).data('original-cod');

                      // Set에서 기존 값을 제거
                      if (originalCod) {
                         invCodSet.delete(originalCod);
                      }

                      if (invCodSet.has(valueCod)) {
                         alert('이미 추가된 원자재입니다.');
                         return;
                      }

                      invCodSet.add(valueCod); // Set에 추가

                      $parentRow.find(`#invName\${rowId}`).val(valueName);
                      $parentRow.find(`#invCod\${rowId}`).val(valueCod).data('original-cod', valueCod);
                      $parentRow.find(`#unitprice\${rowId}`).text(addCommas(valueUnitprice));
                      $parentRow.find(`#quantity\${rowId}`).prop('disabled', false);


                      updateRowTotal($parentRow);
                      updateTotalPrice();

                      $('#loadModal', parent.document).modal('hide');
                      $(parent.document).find('.modal-backdrop').remove();
                      $('body').removeClass('modal-open');

                   });
                   /* 모달에서 값을 설정하는 것 END  */

                   /* 동적으로 생성된 tr 삭제 버튼 클릭 이벤트 START  */
                   $('#materialTable').on('click', '.deleteRowButton', function () {
                      let rowId = $(this).closest('tr').data('row-id');
                      let invCod = $(`#invCod\${rowId}`).val();
                      invCodSet.delete(invCod);
                      $(this).closest('tr').remove();

                      updateTotalPrice();
                   });
                   /* 동적으로 생성된 tr 삭제 버튼 클릭 이벤트 END  */

                   /* 페이지 로드 시 총합 계산 START  */
          $('#materialTable tr').each(function () {
             let $row = $(this);
             let $quantityInput = $row.find('.quantity-input');
             let $unitprice = $row.find('.unitprice');
             if ($quantityInput.length && $unitprice.length) {
                updateRowTotal($row);
             }
          });
          updateTotalPrice();
                   /* 페이지 로드 시 총합 계산 END  */
                   updateTotalPrice();

                });

                /* 수정하기 form 세팅 하기 START  */
                function updateFormSetting() {
               	 $('.deleteRowButton').prop('disabled', false);
               	 $('#addtrButton').prop('disabled', false);
               	 $('#bomUpdateSubmitBtn').css('display', 'inline');
               	 $('.update-disabled').prop('disabled', false).removeClass("hyunwoo-input-disabled");
                }
                /* 수정하기 form 세팅 하기 END  */

                /* 원자재 모달 불러오기 START  */
                function setValueInventoryModal(rowId) {
                   $('#loadModal').data('row-id', rowId);
                   $('.modal-content').load('setvalueinventorymodal', function () {
                      $(this).attr('data-row-id', rowId);
                   });
                }
                /* 원자재 모달 불러오기 END  */

               /* 콤마 있는 부분 제거 한 후 ParseInt해서 submit START */
         		function parseIntSubmit() {
                $('#stdprice').val(parseInt($('#stdprice').val().replace(/,/g, ''), 10));

                // 폼을 제출합니다.
                $('#bomUpdateForm').submit();
         }
         /* 콤마 있는 부분 제거 한 후 ParseInt해서 submit END */
      </script>
   </body>
</html>
