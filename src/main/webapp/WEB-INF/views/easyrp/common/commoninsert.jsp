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
                     <h3>공통 테이블</h3>
                     <p class="text-subtitle text-muted">공통 테이블 소개(부제목)</p>
                  </div>
                  <div class="col-12 col-md-6 order-md-2 order-first">
                     <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="/easyrp">home</a></li>
                           <li class="breadcrumb-item active" aria-current="page">공통 테이블</li>
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
                              <h5 class="m-0">공통 등록</h5>
                              <button
                                 type="button"
                                 class="btn btn-primary"
                                 id="loadDatas"
                                 data-bs-toggle="modal"
                                 data-bs-target="#dataModal"
                                 style="float: left; width: 10%"
                              >
                                 데이터 가져오기
                              </button>
                           </div>
                        </div>
                        <div class="card-body mb-3">
                           <form action="commoninsertfn" method="post">
                              <div class="mb-4">
                                 <table class="table table-bordered">
                                    <!-- 글제목 INPUT INPUT -->
                                    <tr>
                                       <td width="150">글제목</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="title"
                                             name="title"
                                             class="form-control"
                                             placeholder="제목을 입력해주세요."
                                             required
                                          />
                                       </td>
                                    </tr>
                                    <!-- 내용 INPUT -->
                                    <tr>
                                       <td width="150">내 용</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="content"
                                             name="content"
                                             class="form-control"
                                             placeholder="내용을 입력해주세요."
                                             required
                                          />
                                       </td>
                                    </tr>
                                    <!-- 글쓴이 INPUT (로그인 시 자동으로 값 입력 readonly) -->
                                    <tr>
                                       <td width="150">글쓴이</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="author"
                                             name="author"
                                             class="form-control"
                                             value="${empName }"
                                             placeholder="로그인을 하면 자동으로 입력됩니다."
                                             readonly
                                             required
                                          />
                                       </td>
                                    </tr>
                                    <!-- 모달로 입력 테스트 -->
                                    <tr>
                                       <td width="150">모달 입력 테스트</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="modalInput"
                                             name="modalInput"
                                             class="form-control"
                                             style="width: 80%; float: left"
                                             placeholder="모달을 이용해서 입력하는 테스트"
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
                                             저장 값 가져오기
                                          </button>
                                       </td>
                                    </tr>
                                 </table>
                              </div>
                              <!-- 공통등록 Button START -->
                              <div style="text-align: center">
                                 <button
                                    type="submit"
                                    class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4"
                                 >
                                    공통등록
                                 </button>
                                 <a href="commontable" class="me-2">
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
      <div class="modal fade" id="dataModal" tabindex="-1" aria-labelledby="dataModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="dataModalLabel">데이터 선택</h5>
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
                           <th scope="col">제목</th>
                           <th scope="col">저자</th>
                        </tr>
                     </thead>
                     <tbody id="modalDataTableBody">
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
            $('#modalInput').val(value);
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

         /* DataModal START */
         function setData(title, content, author) {
            $('#title').val(title);
            $('#content').val(content);
            $('#dataModal').modal('hide');
            $('.modal-backdrop').remove();
         }

         $(document).ready(function () {
            $('#loadDatas').on('click', function () {
               $.ajax({
                  url: 'api/get-data',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item) {
                        if (item.title && item.content) {
                           rows +=
                              '<tr onclick="setData(\'' +
                              item.title +
                              "', '" +
                              item.content +
                              '\')" ' +
                              'class="searchData" data-title="' +
                              item.title +
                              '" data-author="' +
                              item.author +
                              '" style= "' +
                              'cursor: pointer' +
                              '">' +
                              '<td>' +
                              item.title +
                              '</td>' +
                              '<td>' +
                              item.author +
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
                  let title = $(this).data('title');
                  let author = $(this).data('author');
                  $(this).toggle(title.includes(searchInputData) || author.includes(searchInputData));
               });
            });
         });
         /* DataModal END */
      </script>
   </body>
</html>
