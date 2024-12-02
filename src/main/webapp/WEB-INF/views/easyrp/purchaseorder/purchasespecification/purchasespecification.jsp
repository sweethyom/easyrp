<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>발주명세서</title>
<!-- CSS 추가 START (현우 추가)  -->
<link rel="stylesheet"
	href="resources/easyrp/assets/compiled/css/hyunwoo-css.css" />
<link rel="stylesheet"
	href="resources/easyrp/assets/compiled/css/common-css.css" />
<!-- CSS 추가 END (현우 추가)  -->

<!-- Font START (현우 추가)  -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet" />
<!-- Font END (현우 추가)  -->

<script src="resources/easyrp/assets/extensions/jquery/jquery.min.js"></script>

<style>
body {
	font-family: 'Noto Sans KR', sans-serif !important;
	font-optical-sizing: auto;
	font-style: normal;
}
</style>
</head>
<body>
	<div class="invoice-box">
		<div class="flex-container">
			<div class="flex-item">
				<h2 class="title">발주명세서</h2>
				거래처 명 : <strong>${getPurchaseDatas[0].clientName }</strong><br />
				거래처 주소: <strong>${getPurchaseDatas[0].clientAddress }</strong><br />
				TEL: <strong>${getPurchaseDatas[0].clientTel }</strong><br />
			</div>
			<div class="flex-item" style="text-align: right">
				<div>
					발주번호&nbsp;:&nbsp;<strong>${getPurchaseDatas[0].purchaseCod }</strong>
				</div>
				<div>
					사업자등록번호&nbsp;:&nbsp;<strong>123-456-789</strong>
				</div>
				<div>
					대표명&nbsp;:&nbsp;<strong>김이지</strong>
				</div>
				<div>
					상호&nbsp;:&nbsp;<strong>(주)영남쉬운ERP</strong>
				</div>
				<div>
					주소&nbsp;:&nbsp;<strong>대구광역시 서구 서대구로 30</strong>
				</div>
			</div>
		</div>
		<br />
		<div id="totalPriceTax"
			style="text-align: center; font-size: 1.5em; font-weight: bold"></div>
		<br />
		<table id="materialTable" cellpadding="0" cellspacing="0">
			<tr class="heading">
				<td>일자</td>
				<td>품목명[규격]</td>
				<td>수량[재고단위 기준]</td>
				<td>단가</td>
				<td>공급가액</td>
				<td>부가세</td>
			</tr>
			<c:forEach var="purchaseDatas" items="${getPurchaseDatas}">
				<tr class="item">
					<td>${purchaseDatas.purchaseDate}</td>
					<td>${purchaseDatas.inventoryName}</td>
					<c:set var="supplyPrice" value="${purchaseDatas.unitPrice * purchaseDatas.purchaseInvQty}" />
					<td>${purchaseDatas.purchaseInvQty}</td>
					<td><fmt:formatNumber value="${purchaseDatas.unitPrice}"
							pattern="#,###" />원</td>
					<td class="supplyPrice"><fmt:formatNumber
							value="${supplyPrice }" pattern="#,###" />원</td>
					<td class="tax"><c:set var="tax"
							value="${supplyPrice * 0.1}" /> <fmt:formatNumber
							value="${tax}" pattern="#,###" />원</td>
				</tr>
			</c:forEach>
			<tr class="total">
				<td colspan="4"></td>
				<td id="totalAmount"></td>
				<td id="totalTax" style="font-weight: bold"></td>
			</tr>
		</table>
		<br />
		<div style="text-align: right">
			<div>본 사 : (주)영남쉬운ERP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(인)</div>
			<br />
			<div>발주거래처 : ${getPurchaseDatas[0].clientName }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(인)</div>
		</div>
		<button type="button" onclick="printPage()" class="no-print">출력</button>
	</div>
	<script type="text/javascript">
		function printPage() {
			$('.no-print').hide();
			window.print();
			$('.no-print').show();
		}

		$(document)
				.ready(
						function() {
							/* 가격에 한국식 콤마 붙이는 Fn START  */
							function addCommas(value) {
								if (value === undefined || value === null) {
									return '';
								}
								value = value.toString().replace(/,/g, '');
								return Number(value).toLocaleString();
							}
							/* 가격에 한국식 콤마 붙이는 Fn END  */

							/* 숫자를 한글로 변환하는 함수 START */
							function numberToKorean(num) {
								const units = [ '', '만', '억', '조' ];
								const digits = [ '영', '일', '이', '삼', '사', '오',
										'육', '칠', '팔', '구' ];

								let result = '';
								let unitIdx = 0;

								while (num > 0) {
									let part = num % 10000;
									num = Math.floor(num / 10000);

									if (part > 0) {
										let partStr = '';
										for (let i = 0; i < 4; i++) {
											const digit = part % 10;
											if (digit > 0) {
												partStr = digits[digit]
														+ (i > 0 ? [ '', '십',
																'백', '천' ][i]
																: '') + partStr;
											}
											part = Math.floor(part / 10);
										}
										result = partStr
												+ (unitIdx > 0 ? units[unitIdx]
														: '') + result;
									}

									unitIdx++;
								}

								return result || '영';
							}
							/* 숫자를 한글로 변환하는 함수 END */

							/* 총합 계산 함수 START */
							function updateTotalPrice() {
								let totalPrice = 0;
								let totalTax = 0;
								$('#materialTable .supplyPrice').each(
										function() {
											console.log($(this).text());
											let amount = parseInt($(this)
													.text().replace(/,/g, ''),
													10);
											if (!isNaN(amount)) {
												totalPrice += amount;
											}
										});
								$('#materialTable .tax').each(
										function() {
											console.log($(this).text());
											let taxAmount = parseInt($(this)
													.text().replace(/,/g, ''),
													10);
											if (!isNaN(taxAmount)) {
												totalTax += taxAmount;
											}
										});
								$('#totalAmount').text(
										addCommas(totalPrice) + '원');
								$('#totalTax').text(addCommas(totalTax) + '원');

								let totalAmountWithTax = totalPrice + totalTax;
								let totalAmountKorean = numberToKorean(totalAmountWithTax);

								$('#totalPriceTax').text(
										'금 액: ' + totalAmountKorean + '원 정'
												+ ' ('
												+ addCommas(totalAmountWithTax)
												+ '원)');
							}
							/* 총합 계산 함수 END */

							// 최초 총합 계산
							updateTotalPrice();

						}); // <- 닫는 태그 추가
	</script>
</body>
</html>
