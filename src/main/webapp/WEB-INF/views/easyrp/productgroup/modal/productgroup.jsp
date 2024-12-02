<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <title>Insert title here</title>
   </head>
   <body>
      <!-- 제품 그룹 관리 Modal START  -->
      <div class="modal-header">
         <h5 class="modal-title" id="loadWrksModalLabel">제품 그룹 목록</h5>
         <input
            type="text"
            id="modalSearch"
            class="form-control"
            placeholder="그룹 코드 또는 제품 그룹명을 입력해주세요."
            style="margin-left: 10px; width: auto; flex-grow: 1"
         />
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <button type="button" class="btn btn-primary" style="width: 10rem; margin: 0.5rem" onclick="insertForm()">
         제품 그룹 등록
      </button>
      <div id="insertForm" style="display: none; margin: 0.5rem">
         <div><strong>제품 그룹명</strong></div>
         <div class="d-flex">
            <div class="flex-grow-1">
               <input type="hidden" id="cod" class="form-control" name="cod" readonly required />
               <input
                  type="text"
                  id="name"
                  name="name"
                  class="form-control"
                  placeholder="추가하고자 하는 제품 그룹 명을 기입해주세요."
                  required
               />
            </div>
            <div>
               <button type="button" id="insertbtn" class="btn btn-primary hynowoo-10vw">등록</button>
            </div>
         </div>
      </div>
      <div class="modal-body overflow-y-auto" style="height: 60vh">
         <table class="table">
            <thead>
               <tr>
                  <th scope="col">제품 그룹 코드</th>
                  <th scope="col">제품 그룹명</th>
                  <th scope="col">기 능</th>
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
      <!-- 제품 그룹 관리 Modal END  -->

      <script type="text/javascript">
         function insertForm() {
            if ($('#insertForm').css('display') == 'none') {
               $('#insertForm').css('display', 'block');
            } else $('#insertForm').css('display', 'none');
         }

         /* modal CRUD START */
         $(document).ready(function () {
            function loadData() {
               $.ajax({
                  url: 'api/get-productgroup',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     let strCod = data[0].cod.substring(0, 6);
                     let intCod = parseInt(data[0].cod.substring(6));
                     let stringChangeCod = String(intCod + 1).padStart(3, '0');
                     let maxCod = strCod.concat(stringChangeCod);
                     data.forEach(function (item, index) {
                        if (item.cod && item.deleteyn === 'N') {
                           rows += `<tr class="searchData" data-cod="\${item.cod}" data-name="\${item.name}">
                              <td>\${item.cod}</td>
                              <td class="hyunwoo-flex-wrap">
                              <input type="text" id="updateName\${item.cod}" name="name" class="form-control hyunwoo-input-disabled" value="\${item.name}" disabled />
                              <div class="updateSubmitBtn" data-target="\${item.cod}" style="display : none; margin-top : 0.5rem;">
                              <button class="btn btn-primary update-data" data-target="\${item.cod}" style="margin-right : 0.5rem;">등록</button>
                              <button class="btn btn-secondary cancel-update" data-target="\${item.cod}" data-content="\${item.name}" style="display : block;">취소</button>
                              </div>
                              </td>
                              <td>
                              <div class="btn-group">
                              <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                              <i class="fa-solid fa-gear"></i>
                              </button>
                              <ul class="dropdown-menu">
                              <li><a class="dropdown-item showUpdateForm" href="javascript:void(0);" data-cod="\${item.cod}">수정</a></li>
                              <li><a class="dropdown-item delete-data" href="javascript:void(0);" data-cod="\${item.cod}">삭제</a></li>
                              </ul>
                              </div>
                              </td>
                              </tr>`;
                        }
                     });
                     $('#modalDataTableBody').html(rows);
                     $('#name').val('');
                     $('#cod').val(maxCod);
                  },
                  error: function (xhr, status, error) {
                     alert('데이터 로드에 실패했습니다: ' + error);
                  },
               });
            }

            $('#insertbtn').click(function () {
               let cod = $('#cod').val();
               let name = $('#name').val();

               if (cod.length == 0 || name.length == 0) {
                  alert('데이터가 입력되지 않았습니다.');
                  return;
               } else {
                  $.ajax({
                     url: 'productgroupinsertfn',
                     data: { cod: cod, name: name },
                     type: 'post',
                     success: function (response) {
                        if (response === 'complete') {
                           alert('제품 그룹이 성공적으로 등록이 되었습니다.');
                           loadData();
                        }
                     },
                     error: function () {
                        alert('제품 그룹이 등록되지 않았습니다.');
                     },
                  });
               }
            });

            $(document).on('click', '.delete-data', function () {
               let cod = $(this).data('cod');
               console.log(cod);
               if (confirm('이 항목을 삭제하시겠습니까?')) {
                  $.ajax({
                     url: 'productgrodeletefn',
                     type: 'POST',
                     data: { cod: cod },
                     success: function (response) {
                        if (response === 'complete') {
                           alert('제품 그룹이 성공적으로 삭제되었습니다.');
                           loadData();
                        } else {
                           alert('삭제가 되지 않았습니다. 다시 시도해주세요.');
                        }
                     },
                     error: function (xhr, status, error) {
                        alert('삭제에 실패했습니다: ' + error);
                     },
                  });
               }
            });

            $(document).on('click', '.update-data', function () {
               let cod = $(this).data('target');
               let updatedName = $(`#updateName\${cod}`).val();
               console.log(cod);
               console.log(updatedName);
               if (updatedName.length === 0) {
                  alert('제품 그룹명이 입력되지 않았습니다.');
                  return;
               }
               $.ajax({
                  url: 'productgroupupdatefn',
                  type: 'POST',
                  data: {
                     cod: cod,
                     name: updatedName,
                  },
                  success: function (response) {
                     if (response === 'complete') {
                        alert('제품 그룹이 성공적으로 수정되었습니다.');
                        loadData();
                     } else {
                        alert('수정을 완료하지 못했습니다. 다시 시도해주세요.');
                     }
                  },
                  error: function (xhr, status, error) {
                     alert('수정에 실패했습니다: ' + error);
                  },
               });
            });

            $(document).on('click', '.showUpdateForm', function () {
               let cod = $(this).data('cod');
               $(`#updateName\${cod}`).removeClass('hyunwoo-input-disabled').attr('disabled', false);
               $(`[data-target='\${cod}'].updateSubmitBtn`).css('display', 'flex');
            });

            $(document).on('click', '.cancel-update', function () {
               let name = $(this).data('content');
               let cod = $(this).data('target');
               $(`#updateName\${cod}`).addClass('hyunwoo-input-disabled').attr('disabled', true);
               $(`[data-target='\${cod}'].updateSubmitBtn`).css('display', 'none');
               $(`#updateName\${cod}`).val(name);
            });

            /* 검색기능 START */
            $('#modalSearch').on('keyup', function () {
               let searchInputValue = $(this).val().toLowerCase();
               $('.searchData').each(function () {
                  let cod = $(this).data('cod').toString().toLowerCase();
                  let name = $(this).data('name').toString().toLowerCase();
                  if (cod.includes(searchInputValue) || name.includes(searchInputValue)) {
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
