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
                     <h3>재고 실사 등록</h3>
                     <p class="text-subtitle text-muted">재고 실사 등록</p>
                  </div>
                  <div class="col-12 col-md-6 order-md-2 order-first">
                     <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="/easyrp">home</a></li>
                           <li class="breadcrumb-item active" aria-current="page">재고 실사 등록</li>
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
                              <h5 class="m-0">재고 실사 등록</h5>
                           </div>
                        </div>

                        
                        <div class="card-body mb-3">
                           <form id="insertForm" name="insertForm" action="api/get-prodinvinsert" method="post">
                              <div class="mb-4">
	                              <div class="form-check form-check-inline">
	                             <span style="font-weight:bold">창고</span>
	                              </div>
				                  	<div class="form-check form-check-inline">
					                  	<select id="warehouseBox" class="form-select" style="width: 150px">
					                	  	<option value="">선택해주세요.</option>
					                  		 <c:forEach var="warehouseinv" items="${warehouseinv }">
					                  		 	<option id="${warehouseinv.cod }" value="${warehouseinv.name}">${warehouseinv.name }</option>
					                  		 </c:forEach>
					                 	</select>
				                 	</div>
				                 	<div class="form-check form-check-inline">
				                 	<div class="form-check form-check-inline"><span style="font-weight:bold">품목구분</span></div>
					                 	<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="accountBtn" id="productinventoryRadioButton" value="전체" checked>
											  <label class="form-check-label" for="productinventoryRadioButton">전체</label>
											</div>
						                 	<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="accountBtn" id="productRadioButton" value="완제품">
											  <label class="form-check-label" for="productRadioButton">완제품</label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="accountBtn" id="inventoryRadioButton" value="자재">
											  <label class="form-check-label" for="inventoryRadioButton">자재</label>
											</div>
											<div>
												<input type="hidden" name="employee" value="${sessionScope.empCode }" />
											</div>
									</div>
							</div>
							<div class="mb-5">
                               <table class="table table-hover mb-0">
                              <!-- 재고 목록 모달 -->
                              <tr>
                              </tr>
										<thead>
											<tr>
												<th></th>
												<th>품번</th>
												<th>품명</th>
												<th>품목구분</th>
												<th>전산재고</th>
												<th>실사재고</th>
												<th>차이수량</th>
												<th>처리구분</th>
												<th>조정수량</th>
												<th>비고</th>
											</tr>
											<tr/>
										</thead>
										<tbody id="inventoryCountInsertBody">
											<!-- 선택한 데이터 Ajax로 html속성 삽입 -->
										</tbody>
									</table>
                              </div>
                              <!-- 공통등록 Button START -->
                              <div style="text-align: center">
                                 <button type="button" onclick="accountlist()" class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">등록</button>
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
         const checkinput = (checkThis) => {
		    const prodInvCod = document.getElementsByName("prodInvCod");
		    const countqty = document.getElementsByName("countqty");
	    	const note = document.getElementsByName("note");
	    	
	    	Array.from(prodInvCod).forEach((checkbox, index) => {
	            if (checkbox !== checkThis) {
	                countqty[index].disabled = true;
	                note[index].disabled = true;
	            } else {
	                countqty[index].disabled = false;
	                note[index].disabled = false;
	            }
	            console.log(index, checkbox.checked);
	        });
	    };
		  
        function setCountDiff(countQtyInputId, computingQtyId){
        	let countQtyInputData = $('#'+countQtyInputId).val();
            if (countQtyInputData != null && countQtyInputData !== "") {
            	
             	let computingQty =$('#'+computingQtyId).text(); // 전산재고
            	console.log(computingQty);
            	let diffQty=computingQty-countQtyInputData; //차이수량
            	$('#' + countQtyInputId).closest('tr').find('.diffQty').text(diffQty);
            } else {
                // 입력된 값이 비어 있으면 차이수량을 0으로 설정
                $('#' + countQtyInputId).closest('tr').find('.diffQty').text(0);
               }
        }
         
        
      $('#warehouseBox').on('change', function () {
    	    if ($('#inventoryCountInsertBody').children().length > 0) {
    	        if (!confirm("창고 변경 시, 기존 데이터가 소멸됩니다. 변경하시겠습니까?")) {
    	            return;
    	        }
    	    }
    	    warehouselist = $("#warehouseBox").val();
			
    	    // 새로운 Promise 객체 생성
    	    new Promise((resolve, reject) => {
    	        $.ajax({
    	            url: 'api/get-prodinv',
    	            traditional: true,
    	            data: {
    	                warehouse: warehouselist,
    	            },
    	            method: 'GET',
    	            success: function (data) {
    	                console.log(data);
    	                let rows = '';
    	                if (data.length < 1) {
    	                    rows += `<tr><td colspan='9' style="text-align:center">창고에 재고가 없습니다.</td></tr>`;
    	                }
    	                data.forEach(function (item) {
    	                    if (item.cod) {
    	                        let num = rows.length;
    	                        let diffQty = item.computingQty - item.countQty;
    	                        let procclass = '';
    	                        if (item.procclass != null) {
    	                            procclass = item.procclass;
    	                        } else {
    	                            procclass = '미처리';
    	                        }
    	                        rows +=
    	                            `<tr class="searchData" data-cod="\${item.cod}" data-name="\${item.name}" style="cursor: pointer">
    	                                <td><input type="checkbox" name="prodInvCod" value="\${item.cod}"></td>
    	                                <td class="cod">\${item.cod}</td>
    	                                <td class="name">\${item.name}</td>
    	                                <td class="account" id="\${item.account}\${num}" value="\${item.account}">\${item.account}</td>
    	                                <td class="computingQty" id="\${item.cod}\${num}">\${item.computingQty}</td>
    	                                <td width=100 class="countQty">
    	                                    <input type="number" name="countqty" onkeyup="setCountDiff(this.id, '\${item.cod}\${num}')" id="\${item.cod}" class="countqtyinput form-control" placeholder="실사재고량을 입력해주세요." />
    	                                </td>
    	                                <td class="diffQty">\${diffQty}</td>
    	                                <td class="procclass">\${procclass}</td>
    	                                <td class="adjQty">\${item.adjQty}</td>
    	                                <td class="note">
    	                                	<input type="text" id="note\${item.cod}" name="note" class="form-control" placeholder="비고를 입력해주세요." />
    	                                </td>
    	                                <tr/>
    	                            </tr>`;
    	                    };
    	                });
    	                $('#inventoryCountInsertBody').html(rows);
    	                resolve(); // Promise 객체 성공 상태로 변경
    	            },
    	            error: function (xhr, status, error) {
    	                reject(error); // Promise 객체 실패 상태로 변경
    	                console.error('AJAX error:', error);
    	            }
    	        });
    	    }).then(() => {
    	        $('input[name=accountBtn]').on('change', function () {
    	        	
    	        	let prodinvaccountlist = $('input:radio[name="accountBtn"]:checked').val();
    	        	 
    	        	$.ajax({
     	                url: 'api/get-prodinvlist',
     	                traditional: true,
     	                data: {
     	                    warehouse: warehouselist,
     	                    prodinv: prodinvaccountlist,
     	                },
     	                method: 'GET',
     	                success: function (data2) {
     	                    console.log(data2);
     	                    let rows = '';
     	                    data2.forEach(function (items) {
     	                        if (items.cod) {
     	                            let num = rows.length;
     	                            let diffQty = items.computingQty - items.countQty;
     	                            let procclass = '';
     	                            if (items.procclass != null) {
     	                                procclass = items.procclass;
     	                            } else {
     	                                procclass = '미처리';
     	                            }
     	                            if (items.account == '완제품' && data2.length < 1) {
     	                                rows += `<tr><td colspan='9' style="text-align:center">완제품이 없습니다.</td></tr>`;
     	                            } else if ((items.account == '부품' || items.account == '원자재') && data2.length < 1) {
     	                                rows += `<tr><td colspan='9' style="text-align:center">자재가 없습니다.</td></tr>`;
     	                            }
     	                            rows +=
     	                                `<tr class="searchdata" data2-cod="\${items.cod}" name="countList" data2-name="\${items.name}" style= "cursor: pointer">
     	                                    <td><input type="checkbox" name="prodInvCod" value="\${items.cod}"></td>
     	                                    <td class="cod">\${items.cod}</td>
     	                                    <td class="name">\${items.name}</td>
     	                                    <td class="account" id="\${items.account}\${num}" value="\${items.account}">\${items.account}</td>
     	                                    <td class="computingQty" id="\${items.cod}\${num}">\${items.computingQty}</td>
     	                                    <td width=100 class="countQty">
     	                                        <input type="number" name="countqty" onkeyup="setCountDiff(this.id, '\${items.cod}\${num}')" id="\${items.cod}" class="countqtyinput form-control" placeholder="실사재고량을 입력해주세요." />
     	                                    </td>
     	                                    <td class="diffQty">\${diffQty}</td>
     	                                    <td class="procclass">\${procclass}</td>
     	                                    <td class="adjQty">\${items.adjQty}</td>
     	                                    <td class="note"><input type="text" id="note\${items.cod}" name="note" class="form-control" placeholder="비고를 입력해주세요."/></td>
     	                                   <tr/>
     	                                    </tr>`;
     	                        };
     	                    });
     	                    $('#inventoryCountInsertBody').html(rows);
     	                },
     	                error: function (items) {
     	                    console.error('AJAX error:', error);
     	                }
     	            });
    	        });
    	        
    	           
    	        });
    	    });

      
       function accountlist() {
           let prodinvcod = $('input:checkbox[name="prodInvCod"]:checked');
           let prodinvaccountlist = $('input:radio[name="accountBtn"]:checked').val();
           let checkedInput = $('input[name="countqty"]');
           let checkedNote = $('input:text[name="note"]');
           warehouselist = $("#warehouseBox").val();
           let countqty = [];
           let note = [];
           let prodinvlist = [];
           
           for(i =0; i< prodinvcod.length; i++){
        		  prodinvlist.push(prodinvcod.eq(i).val());
        	}
           
           for(i =0; i< prodinvlist.length; i++){
        	   countqty.push($("#"+ prodinvlist[i]).val());
        	   note.push($("#note"+prodinvlist[i]).val());
           }
           
           console.log("countqty list : ",countqty); 
           console.log("note list : ",note); 
           
           $.ajax({
               url: 'api/get-prodinvinsert',
               traditional: true,
               data: {
                   warehouse: warehouselist,
                   prodinvaccount: prodinvaccountlist,
                   countqty: countqty,
                   note : note,
                   prodinvcod : prodinvlist,
               },
               method: 'GET',
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
             
  /*       $(document).ready(function () {
                $.ajax({
                   url: 'api/get-warehouselist',
                 method: 'GET',
                 success: function (data) {
                     let rows = '';
                     data.forEach(function (item) {
                        if (item.cod) {
                           rows +=
                        	   `<option id="\${item.cod }" value="\${item.name}">\${item.name }</option>`
                        }
                     });
                     $('#warehouseBox').html(rows);  
                  },
               });
            });*/
            
         /* Product&InventoryModalTable END */
		

      </script>
   </body>
</html>
