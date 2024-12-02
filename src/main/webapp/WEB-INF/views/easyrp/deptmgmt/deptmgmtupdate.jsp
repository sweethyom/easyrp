<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <title>Insert title here</title>
   </head>
   <body>
      <!-- 부서 수정 테이블 START -->
      <div id="main">
         <header class="mb-3">
            <a href="#" class="burger-btn d-block d-xl-none"> <i class="bi bi-justify fs-3"></i> </a>
         </header>
         <div class="page-heading">
            <div class="page-title">
               <div class="row">
                  <div class="col-12 col-md-6 order-md-1 order-last">
                     <h3>부서 수정</h3>
                     <p class="text-subtitle text-muted">부서 수정을 위한 페이지</p>
                  </div>
                  <div class="col-12 col-md-6 order-md-2 order-first">
                     <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="/easyrp">home</a></li>
                           <li class="breadcrumb-item active" aria-current="page">부서 수정</li>
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
                              <h5 class="m-0">부서 수정</h5>
                           </div>
                        </div>
                        <div class="card-body mb-3">
                           <form action="deptmgmtupdatefn" method="post">
                              <div class="mb-4">
                                 <table class="table table-bordered">
                                    <tr>
                                       <td width="150">부서 번호</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="cod"
                                             name="cod"
                                             class="form-control"
                                             value="${getDeptData.cod}"
                                             readonly
                                             required
                                          />
                                       </td>
                                    </tr>
                                    <tr>
                                       <td width="150">부서 이름</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="name"
                                             name="name"
                                             class="form-control"
                                             value="${getDeptData.name }"
                                             placeholder="부서 이름을 입력해주세요."
                                             required
                                          />
                                       </td>
                                    </tr>
                                    <tr>
                                       <td width="150">사업장명</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="wrkname"
                                             name="wrkname"
                                             class="form-control"
                                             value="${getDeptData.wrkname }"
                                             style="width: 80%; float: left"
                                             placeholder="오른쪽의 사업장 검색버튼을 이용해서 입력해주세요."
                                             readonly
                                             required
                                          />
                                          <button
                                             type="button"
                                             class="btn btn-primary"
                                             id="loadWrks"
                                             data-bs-toggle="modal"
                                             data-bs-target="#loadWrksModal"
                                             style="margin-left: 2rem; width: 10%"
                                          >
                                             사업장 검색
                                          </button>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td width="150">지역명</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="location"
                                             name="location"
                                             class="form-control"
                                             value="${getDeptData.location }"
                                             placeholder="사업장 선택 시 자동으로 입력됩니다."
                                             readonly
                                             required
                                          />
                                       </td>
                                    </tr>
                                 </table>
                              </div>
                              <div style="text-align: center">
                                 <button
                                    type="submit"
                                    class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4"
                                 >
                                    부서수정
                                 </button>
                                 <a href="departmentmgmt" class="me-2">
                                    <button
                                       type="button"
                                       class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4"
                                    >
                                       수정취소
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
      <!-- 부서 수정 테이블 END -->
      
      <!-- 사업장 검색 Modal START  -->
      <div class="modal fade" id="loadWrksModal" tabindex="-1" aria-labelledby="loadWrksModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="loadWrksModalLabel">사업장 목록</h5>
                  <input
                     type="text"
                     id="loadWrkSearch"
                     class="form-control"
                     placeholder="사업장 번호 또는 사업장 명을 입력해주세요."
                     style="margin-left: 10px; width: auto; flex-grow: 1"
                  />
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                  <table class="table">
                     <thead>
                        <tr>
                           <th scope="col">사업장 번호</th>
                           <th scope="col">사업장명</th>
                           <th scope="col">사업장 지역</th>
                        </tr>
                     </thead>
                     <tbody id="loadWrksModalBody">
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
      <!-- 사업장 검색 Modal END  -->
      
      <script type="text/javascript">
      
         function setValue(name, location) {
        	$('#wrkname').val(name);
            $('#location').val(location);
            $('#loadWrksModal').modal('hide');
            $('.modal-backdrop').remove();
         }

         $(document).ready(function () {
            $('#loadWrks').on('click', function () {
               $.ajax({
                  url: 'api/get-wrkdata',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item) {
                        if (item.name && item.location) {
                           rows +=
                              '<tr onclick="setValue(\'' +
                              item.name +
                              "', '" +
                              item.location +
                              '\')" ' +
                              'class="searchValue" data-cod="' +
                              item.code +
                              '" data-value="' +
                              item.name +
                              '" style= "' +
                              'cursor: pointer' +
                              '">' +
                              '<td>' +
                              item.code +
                              '</td>' +
                              '<td>' +
                              item.name +
                              '</td>' +
                              '<td>' +
                              item.location +
                              '</td>' +
                              '</tr>';
                        }
                     });
                     $('#loadWrksModalBody').html(rows);
                     $('#loadWrksModal').modal('show');
                  },
               });
            });

            $('#loadWrkSearch').on('keyup', function () {
                var searchInputVlaue = $(this).val().toLowerCase();
                $('.searchValue').each(function () {
                   var cod = $(this).data('cod').toString().toLowerCase();
                   var value = $(this).data('value').toString().toLowerCase();
                   $(this).toggle(cod.includes(searchInputVlaue) || value.includes(searchInputVlaue));
                });
             });
          });
         /* 사업장 검색 Modal END */
      </script>
   </body>
</html>
