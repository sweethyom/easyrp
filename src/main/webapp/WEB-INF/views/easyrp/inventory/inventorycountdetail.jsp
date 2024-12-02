<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                     <h3>재고 실사 상세</h3>
                     <p class="text-subtitle text-muted">재고 실사 상세</p>
                  </div>
                  <div class="col-12 col-md-6 order-md-2 order-first">
                     <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="/easyrp">home</a></li>
                           <li class="breadcrumb-item active" aria-current="page">재고 실사 상세</li>
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
                              <h5 class="m-0">재고 실사 상세</h5>
                              	
                           </div>
                           <div class="mt-5 mb-3">
	                              <table class="table table-hover mb-0">
											<thead>
												<tr>
													<th>실사번호</th>
													<th>실사일자</th>
													<th>재고기준일</th>
													<th>창고</th>
													<th>장소</th>
													<th>실사구분</th>
													<th>담당자</th>
												</tr>
											</thead>
											<tbody>
											<c:if test="${not empty inventoryCountList}">
												<c:forEach var="inventoryCountList" items="${inventoryCountList}">
													<tr>
														<td class="text-bold-500" >${inventoryCountList.cod }</td>
														<td>
															<fmt:formatDate value="${inventoryCountList.countDate}" pattern="yyyy-MM-dd"/>
														</td>
														<td class="text-bold-500">
															<fmt:formatDate value="${inventoryCountList.invDate}" pattern="yyyy-MM-dd"/>
														</td>
														<td>${inventoryCountList.warehouse}</td>
														<td>${inventoryCountList.location}</td>
														<td>${inventoryCountList.countclass}</td>
														<td>${inventoryCountList.employee}</td>
													</tr>
												</c:forEach>
											</c:if>
											<c:if test="${empty inventoryCountList}">
												<tr>
													<td colspan='8' style="text-align:center">실사기록이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
								</div>
                        </div>

                        
                        <div class="card-body mb-3">
                           <form id="adjustmntfn" name="adjustmntfn" action="inventoryadjustmentfn" method="post">      	
							<div class="mb-5">
                               <table class="table table-hover mb-0">
                              <!-- 재고 목록 모달 -->
                              <tr>
                              </tr>
										<thead>
											<tr>
												<th>품번</th>
												<th>품명</th>
												<th>품목구분</th>
												<th>전산재고</th>
												<th>실사재고</th>
												<th>조정수량</th>
												<th>처리구분</th>
												<th>단가</th>
												<th>조정금액</th>
												<th>비고</th>
											</tr>
											<tr/>
										</thead>
										<tbody id="inventoryCountDetailBody">
										<c:if test="${not empty inventoryCountDetailList }">
											<c:forEach var="inventoryCountDetailList" items="${inventoryCountDetailList }">
											<tr>
												<c:if test="${empty inventoryCountDetailList.productCod }">
													<td>${inventoryCountDetailList.inventoryCod }</td>
												</c:if>
												<c:if test="${empty inventoryCountDetailList.inventoryCod }">
													<td>${inventoryCountDetailList.productCod }</td>
												</c:if>
												<c:if test="${empty inventoryCountDetailList.product }">
													<td>${inventoryCountDetailList.inventory }</td>
												</c:if>
												<c:if test="${empty inventoryCountDetailList.inventory }">
													<td>${inventoryCountDetailList.product }</td>
												</c:if>
													<td class="text-bold-500">${inventoryCountDetailList.account }</td>
													<td>${inventoryCountDetailList.computingQty }</td>
													<td>${inventoryCountDetailList.qty }</td>
													<td>${inventoryCountDetailList.diffQty}</td>
													<td>${inventoryCountDetailList.procClass }</td>
													<td>${inventoryCountDetailList.unitprice }</td>
													<td>${inventoryCountDetailList.price}</td>
													<td>
														<input type="text" id="note${inventoryCountDetailList.num }" name="note" class="form-control" placeholder="비고를 입력해주세요."/>
													</td>
													<td>
														<input type="hidden"  name="adjustmntqty" id="${inventoryCountDetailList.num}" class="adjustmntqtyinput form-control" value="${inventoryCountDetailList.diffQty}" />
													</td>
											</tr>
											</c:forEach>
											</c:if>
										</tbody>
									</table>
                              </div>
                              <!-- 공통등록 Button START -->
                              <div style="text-align: center">
                                 <button type="button" onclick="adjustmentlist()" class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">등록</button>
                                 <a href="inventorycount" class="me-2">
                                    <button type="button"class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">등록취소</button>
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
      
     
      <script type="text/javascript">
		 function adjustmentlist() {
           let adjustmentQty = $('input[name="adjustmntqty"]');
           let note = $('input:text[name="note"]');

           let adjustmentQtyList = [];
           let noteList = [];
		   let adjustmentnumList = [];          

           for(i =0; i< adjustmentQty.length; i++){
        	   adjustmentnumList.push(adjustmentQty.eq(i).attr("id"));
        	   adjustmentQtyList.push(adjustmentQty.eq(i).val());
        	}
           
           for(i =0; i< note.length; i++){
        	   noteList.push(note.eq(i).val());
           }
           
           console.log("adjustmentQtyList : ",adjustmentQtyList); 
           console.log("note list : ", noteList);
           console.log("adjustmentnumList : ", adjustmentnumList);
           
            $.ajax({
               url: 'api/get-adjustment',
               traditional: true,
               data: {
                   adjust: adjustmentQtyList,
                   note : noteList,
                   adjustnum : adjustmentnumList,
               },
               method: 'POST',
               success: function (data) {
            	   console.log(data);
        			if(data === "Y"){
        				alert("데이터가 정상적으로 생성되었습니다.");
        			let url = `/easyrp/inventorycount`;
        			location.replace(url);
                   }
           }, error: function(error){
        	   console.log("error :", error);
           } 
       }); 
      } 
      </script>
   </body>
</html>
