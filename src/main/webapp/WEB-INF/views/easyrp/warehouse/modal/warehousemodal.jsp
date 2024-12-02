<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <title>Insert title here</title>
   </head>
   <body>
      <!-- 창고 Modal START  -->
      <div class="modal-header">
         <h5 class="modal-title" id="loadWrksModalLabel">창고 목록</h5>
         <input
            type="text"
            id="modalSearch"
            class="form-control"
            placeholder="검색어를 입력해주세요."
            style="margin-left: 10px; width: auto; flex-grow: 1"
         />
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body overflow-y-auto" style="height: 60vh">
         <table class="table">
            <thead>
               <tr>
                  <th scope="col">창고번호</th>
                  <th scope="col">창고명</th>
                  <th scope="col">창고위치</th>
               </tr>
            </thead>
            <tbody id="modalDataTableBody">
               <!-- 여기에 Ajax Body 넣어주기 -->
            </tbody>
         </table>
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
      <!-- 창고 Modal END  -->

      <script type="text/javascript">
         /* modal CRUD START */
         $(document).ready(function () {
            function loadData() {
               $.ajax({
                  url: 'api/get-warehouse',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item, index) {
                        if (item.cod && item.deleteyn === 'N') {
                           rows += `<tr class="searchData setValueWarehouse hyunwoo-pointer" data-cod="\${item.cod}" data-name="\${item.name}" data-location="\${item.location}" >
                              <td>\${item.cod}</td>
                              <td class="hyunwoo-flex-wrap">
                              <input type="text" id="updateName\${item.cod}" name="name" class="form-control hyunwoo-input-disabled hyunwoo-pointer" value="\${item.name}" readonly />
                              <div class="updateSubmitBtn" data-target="\${item.cod}" style="display : none; margin-top : 0.5rem;">
                              <button class="btn btn-primary update-data" data-target="\${item.cod}" style="margin-right : 0.5rem;">등록</button>
                              <button class="btn btn-secondary cancel-update" data-target="\${item.cod}" data-content="\${item.name}" style="display : block;">취소</button>
                              </div>
                              </td>
                              <td>\${item.location}</td>
                              </tr>`;
                        }
                     });
                     $('#modalDataTableBody').html(rows);
                  },
                  error: function (xhr, status, error) {
                     alert('데이터 로드에 실패했습니다: ' + error);
                  },
               });
            }

            $(document).on('click', '.setValueWarehouse', function () {
               let warehouseCode = $(this).data('cod');
               let warehouseName = $(this).data('name');

               $(parent.document).find('#warehouseCod').val(warehouseCode);
               $(parent.document).find('#warehouseName').val(warehouseName);

               $('#loadModal', parent.document).modal('hide');
            });

            /* 검색기능 START */
            $('#modalSearch').on('keyup', function () {
               let searchInputValue = $(this).val().toLowerCase();
               $('.searchData').each(function () {
                  let cod = $(this).data('cod').toString().toLowerCase();
                  let name = $(this).data('name').toString().toLowerCase();
                  let location = $(this).data('location').toString().toLowerCase();
                  if (
                     cod.includes(searchInputValue) ||
                     name.includes(searchInputValue) ||
                     location.includes(searchInputValue)
                  ) {
                     $(this).show();
                  } else {
                     $(this).hide();
                  }
               });
            });
            /* 검색기능 END */

            loadData();
         });

         /* modal CRUD END */
      </script>
   </body>
</html>
