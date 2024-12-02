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
	<!-- setValue ProductData Modal START  -->
	<div class="modal-header">
		<h5 class="modal-title" id="loadModalLabel">제품 목록</h5>
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
					<th scope="col">제품 번호</th>
					<th scope="col">제품 이름</th>
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
	<!-- setValue ProductData Modal END  -->

	<script type="text/javascript">
         /* modal CRUD START */
         $(document).ready(function () {
            function loadData() {
               $.ajax({
                  url: 'api/get-hyunwoo-productdata',
                  method: 'POST',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item, index) {
                        if (item.prodCod) {
                           rows += `<tr class="searchData setData hyunwoo-pointer" data-prodcod="\${item.prodCod}" data-productname="\${item.productName}" data-productgroupname="\${item.productGroupName}" >
                              <td>\${item.prodCod}</td>
                              <td>
                              <input type="text" class="form-control hyunwoo-input-disabled hyunwoo-pointer" value="\${item.productName}" readonly />
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

            $(document).on('click', '.setData', function () {
				let prodCod = $(this).data('prodcod');
				let productName = $(this).data('productname');
				let productGroupName = $(this).data('productgroupname');
               
               $(parent.document).find('#prodCod').val(prodCod);
               $(parent.document).find('#productName').val(productName);
               $(parent.document).find('#productGroupName').val(productGroupName);
               $(parent.document).find('#addtrButton').attr('disabled', false);

               $('#loadModal', parent.document).modal('hide');
            });

            /* 검색기능 START */
            $('#modalSearch').on('keyup', function () {
               let searchInputValue = $(this).val().toString().toLowerCase();
               $('.searchData').each(function () {
                  let prodCod = $(this).data('prodcod').toString().toLowerCase();
                  let productName = $(this).data('productname').toString().toLowerCase();
                  if (
                		  prodCod.includes(searchInputValue) ||
                		  productName.includes(searchInputValue)
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
