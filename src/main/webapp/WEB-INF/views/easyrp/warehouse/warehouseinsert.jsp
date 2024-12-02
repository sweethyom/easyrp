<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <title>Insert title here</title>
   </head>
   <body>
   <!-- 2024년 5월 5일 오전 9시 49분 박현우 -->
      <!-- 부서 등록 테이블 START -->
      <div id="main">
         <header class="mb-3">
            <a href="#" class="burger-btn d-block d-xl-none"> <i class="bi bi-justify fs-3"></i> </a>
         </header>
         <div class="page-heading">
            <div class="page-title">
               <div class="row">
                  <div class="col-12 col-md-6 order-md-1 order-last">
                     <h3>창고 등록</h3>
                     <p class="text-subtitle text-muted">창고의 기초 등록을 위한 페이지</p>
                  </div>
                  <div class="col-12 col-md-6 order-md-2 order-first">
                     <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="/easyrp">home</a></li>
                           <li class="breadcrumb-item active" aria-current="page">창고 등록</li>
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
                              <h5 class="m-0">창고 등록</h5>
                           </div>
                        </div>
                        <div class="card-body mb-3">
                           <form action="warehouseinsertfn" method="post">
                              <div class="mb-4">
                                 <table class="table table-bordered">
                                    <tr>
                                       <td width="150">창고 번호</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="cod"
                                             name="cod"
                                             class="form-control"
                                             value="${nextCod}"
                                             placeholder="창고 번호를 입력해주세요."
                                             readonly
                                             required
                                          />
                                       </td>
                                    </tr>
                                    <tr>
                                       <td width="150">창고명</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="name"
                                             name="name"
                                             class="form-control"
                                             placeholder="창고명을 입력해주세요."
                                             maxlength="100"
                                             required
                                          />
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
                                             placeholder="창고가 위치한 지역을 기입해주세요. ex) 대구, 부산, 서울"
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
                                    창고등록
                                 </button>
                                 <a href="warehouse" class="me-2">
                                    <button
                                       type="button"
                                       class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4"
                                    >
                                       등록취소
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
      <!-- 부서 등록 테이블 END -->
   </body>
</html>
