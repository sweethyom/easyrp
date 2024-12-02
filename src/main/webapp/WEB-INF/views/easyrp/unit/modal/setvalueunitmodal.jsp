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
	<!-- setValue 단위 Modal START  -->
	<div class="modal-header">
		<h5 class="modal-title" id="loadWrksModalLabel">단위 목록</h5>
		<input type="text" id="modalSearch" class="form-control"
			placeholder="검색어를 입력해주세요."
			style="margin-left: 10px; width: auto; flex-grow: 1" />
		<button type="button" class="btn-close" data-bs-dismiss="modal"
			aria-label="Close"></button>
	</div>
	<div class="modal-body overflow-y-auto" style="height: 60vh">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">단위번호</th>
					<th scope="col">단위명</th>
				</tr>
			</thead>
			<tbody id="modalDataTableBody">
				<!-- 여기에 Ajax Body 넣어주기 -->
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-secondary"
			data-bs-dismiss="modal">닫기</button>
	</div>
	<!-- setValue 단위 Modal END  -->

	<script type="text/javascript">
         /* modal CRUD START */
         $(document).ready(function () {
            function loadData() {
               $.ajax({
                  url: 'api/get-unit',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item, index) {
                        if (item.cod && item.deleteyn === 'N') {
                           rows += `<tr class="searchData setUnit hyunwoo-pointer" data-cod="\${item.cod}" data-name="\${item.name}" >
                              <td>\${item.cod}</td>
                              <td class="hyunwoo-flex-wrap">
                              <input type="text" id="updateName\${item.cod}" name="name" class="form-control hyunwoo-input-disabled hyunwoo-pointer" value="\${item.name}" readonly />
                              </td>
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

            $(document).on('click', '.setUnit', function () {
               let unitName = $(this).data('name');
               let unitCod = $(this).data('cod');
               
               /* 제품등록부분 value 삽입 */
               $(parent.document).find('#unitName').val(unitName);
               $(parent.document).find('#unitCod').val(unitCod);

               $('#loadModal', parent.document).modal('hide');
            });

            /* 검색기능 START */
            $('#modalSearch').on('keyup', function () {
               let searchInputValue = $(this).val().toLowerCase();
               $('.searchData').each(function () {
                  let cod = $(this).data('cod').toString().toLowerCase();
                  let name = $(this).data('name').toString().toLowerCase();
                  if (
                     cod.includes(searchInputValue) ||
                     name.includes(searchInputValue)
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
