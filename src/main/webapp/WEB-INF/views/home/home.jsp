<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EasyRP</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/chosen/1.1.0/chosen.min.css">
<link rel="stylesheet" type="text/css" href="resources/easyrp/assets/compiled/css/hyunseok-home.css">

<!-- JS -->
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/chosen/1.1.0/chosen.jquery.min.js"></script>

</head>
<body>
	<div id="main">
		<header class="mb-3">
			<a href="#" class="burger-btn d-block d-xl-none"> <i
				class="bi bi-justify fs-3"></i>
			</a>
		</header>

		<div class="page-heading">
			<h3>전체 현황</h3>
		</div>
		<div class="page-content">
			<section class="row">
				<div class="col-12 col-lg-9">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h4>월별 판매계획 대비 목표 달성량</h4>
								</div>
								<div class="card-body">
									<div>
										<div class="selector-container">
											<select class="chosen-select" id="yearSelector" style="width : 100px">
												<option value="2024">2024</option>
												<option value="2023">2023</option>
												<option value="2022">2022</option>
												<option value="2021">2021</option>
												<option value="2020">2020</option>
												<option value="2019">2019</option>
											</select> 
											<select class="chosen-select" id="productSelector">
												<c:forEach items="${productList}" var="p">
													<option value="${p.productCod }">${p.prodname }</option>
												</c:forEach>
											</select>
										</div>
										<canvas id="myChart"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
				<div class="col-12 col-lg-3">
				
					<div class="card">
						<div class="card-header">
							<h4>제품별 매출 비율</h4>
						</div>
						<div class="card-body">
						
							<div class="selector-container2">
								<select class="chosen-select" id="Donut_yearSelector"
									style="width: 70px">
									<option value="2024">2024</option>
									<option value="2023">2023</option>
									<option value="2022">2022</option>
									<option value="2021">2021</option>
									<option value="2020">2020</option>
									<option value="2019">2019</option>
								</select>
								<select class="chosen-select" id="Donut_monthSelector"
									style="width: 80px">
									<option value="1">1월</option>
									<option value="2">2월</option>
									<option value="3">3월</option>
									<option value="4">4월</option>
									<option value="5">5월</option>
									<option value="6">6월</option>
									<option value="7">7월</option>
									<option value="8">8월</option>
									<option value="9">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</select>
							</div>
								<canvas id="SalesRatioByProduct"></canvas>
						</div>
					</div>
					
					<div class="card">
						<div class="card-header">
							<h4>회사 정보</h4>
						</div>
						<div class="card-content pb-4">
							<div class="recent-message d-flex px-4 py-3">
								<div class="avatar avatar-lg">
									<img src="resources/easyrp/assets/compiled/jpg/4.jpg">
								</div>
								<div class="name ms-4">
									<h5 class="mb-1">(주)영남쉬운ERP</h5>
									<h6 class="text-muted mb-0">대표명 : 김이지</h6>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</section>
		</div>

		<footer>
			<div class="footer clearfix mb-0 text-muted">
				<div class="float-start">
					<p>2024 &copy; EasyRP</p>
				</div>
			</div>
		</footer>
	</div>
</body>
<script>

	
	
    $(document).ready(function() { // 문서 완전히 로드시 자동으로 실행
    	
    	let myChart;
    	let SalesRatioByProduct;
    	
    	function fetchDonutGraph() {
    		const year = $('#Donut_yearSelector').val();
    		const month = $('#Donut_monthSelector').val();
    		
    		$.ajax({
    			url: 'DonutChartUpdate',
    			data: {
    				donut_year: year,
    				month: month
    			},
    			dataType: 'JSON',
    			method: 'GET',
    			success: function(DonutData) {
    				
    				console.log('DonutData : ' + DonutData);
    				
    				
    				const chartData = {
    						labels: DonutData.labels,
    						datasets: [{
    							data: DonutData.data,
    							backgroundColor: [
    								'rgba(255, 99, 132, 0.5)',
    	                            'rgba(54, 162, 235, 0.5)',
    	                            'rgba(255, 206, 86, 0.5)'
    							]
    						}]
    				};
    				
    				console.log('chartData : ' + chartData);
    				
    				if (!SalesRatioByProduct) {
    					
                        createDonutChart(chartData);
                        
                    } else {
                        SalesRatioByProduct.data = chartData;
                        SalesRatioByProduct.update();
                    }
    				
    				
    			},
    			error: function(xhr, status, error) {
    				console.error('fetchDonutGraph 실패');
    			}
    		});
    		
    	}
    	
    	function createDonutChart(chartData) {
    		 const ctx = document.getElementById('SalesRatioByProduct').getContext('2d');
    		 
    		 
    		 SalesRatioByProduct = new Chart(ctx, {
    			 type: 'doughnut',
    			 data: chartData,
    		 });
    	}
    	
    	
        function fetchData() {
            const productCod = $('#productSelector').val();
            const year = $('#yearSelector').val();
			
            
            $.ajax({
                url: `ChartUpdate?productCod=\${productCod}&year=\${year}`,
                method: 'GET',
                success: function(data) {
                    
                    const orderData = data.orderData;
                    const planData = data.planData;
					
                    
                    const orderSalesData = Array(12).fill(0);
                    orderData.forEach(item => {
                        orderSalesData[item.month - 1] = item.totalQty;  // 월별 주문량 데이터 채우기
                        // orderSalesData 라는 리스트의 인덱스는 1월은 0, 2월은 1 ...  item.month에 없는 월은 0으로 초기화 되있어서 상관없음
                    });
                    
                    const planSalesData = Array(12).fill(0);
                    planData.forEach(item => {
                        planSalesData[item.month - 1] = item.totalQty;  // 월별 판매 계획량 데이터 채우기
                    });
                    
                    if (!myChart) {
                        // 차트가 없는 경우 차트를 생성
                        createChart(orderSalesData, planSalesData);
                    } else {
                        // 차트가 있는 경우 데이터를 업데이트
                        updateChart(myChart, orderSalesData, planSalesData);
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching data: ", error);
                }
            });
        }

        function createChart(orderData, planData) {
        	
        	// 전월 대비 주문 증가량 계산
//         	const orderGrowthData = orderData.map((value, index) => {
//         		if(index === 0) return 0;
//         		return value - orderData[index -1];
//         	})
        	
        	
        	
            const ctx = document.getElementById('myChart').getContext('2d');
            myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                    datasets: [
                        {
                            label: '주문 수량',
                            data: orderData,
                            backgroundColor: 'rgba(81, 155, 255, 0.5)',
                            borderColor: 'rgba(47, 135, 255, 1)',
                            borderWidth: 1,
                            type: 'bar'
                        },
                        {
                            label: '판매 계획 수량',
                            data: planData,
                            backgroundColor: 'rgba(243, 110, 59, 0.2)',
                            borderColor: 'rgba(240, 67, 0, 1)',
                            borderWidth: 1,
                            type: 'line'
                        }
                    ]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }

        function updateChart(chart, orderData, planData) {
            chart.data.datasets[0].data = orderData;
            chart.data.datasets[1].data = planData;
            chart.update();
        }

        $('#productSelector, #yearSelector').change(fetchData);
        $('#Donut_yearSelector, #Donut_monthSelector').change(fetchDonutGraph);
        fetchDonutGraph();
        fetchData();  // 초기 로드 시 데이터 가져오기
    });
    

		$(".chosen-select").chosen({no_results_text: "해당 항목이 없습니다."});
    
    
	
</script>

</html>