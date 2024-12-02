<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <title>Insert title here</title>
   </head>
   <body>
      <div id="main">
         <header class="mb-3">
            <a href="#" class="burger-btn d-block d-xl-none">
               <i class="bi bi-justify fs-3"></i>
            </a>
         </header>

         <div class="page-heading">
            <div class="page-title">
               <div class="row">
                  <div class="col-12 col-md-6 order-md-1 order-last">
                     <h3>판매 계획 관리 및 목록</h3>
                     <p class="text-subtitle text-muted">판매계획에 대한 관리를 할 수 있는 목록</p>
                  </div>
                  <div class="col-12 col-md-6 order-md-2 order-first">
                     <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="/easyrp">home</a></li>
                           <li class="breadcrumb-item active" aria-current="page">판매 계획 관리</li>
                        </ol>
                     </nav>
                  </div>
               </div>
            </div>

            <!-- Basic Tables start -->
            <section class="section">
               <div class="card">
                  <div class="card-header">
                     <h5 class="card-title">jQuery Datatable</h5>
                  </div>
                  <div class="card-body">
                     <div class="table-responsive">
                        <table class="table" id="table1">
                           <thead>
                              <tr>
                                 <th>Name</th>
                                 <th>Email</th>
                                 <th>Phone</th>
                                 <th>City</th>
                                 <th>Status</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr>
                                 <td>Graiden</td>
                                 <td>vehicula.aliquet@semconsequat.co.uk</td>
                                 <td>076 4820 8838</td>
                                 <td>Offenburg</td>
                                 <td>
                                    <span class="badge bg-success">Active</span>
                                 </td>
                              </tr>
                              
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
            </section>
            <!-- Basic Tables end -->
         </div>
      </div>
   </body>
</html>
