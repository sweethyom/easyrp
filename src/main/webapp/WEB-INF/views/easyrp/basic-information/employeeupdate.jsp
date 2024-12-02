<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>

<body>
	<div id="main">
		<header class="mb-3">
			<a href="#" class="burger-btn d-block d-xl-none"> <i
				class="bi bi-justify fs-3"></i>
			</a>
		</header>
		<div class="page-heading">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>사원수정</h3>
						<p class="text-subtitle text-muted">사원의 정보를 수정할수있는 페이지 입니다.</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">사원수정</li>
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
								<div class="d-flex">
										<h5 class="m-0">사원 수정</h5>
									</div>
							</div>
							<div class="card-body mb-3">
								<form action="empupdatefn" method="post" onsubmit="finalChk()">
									<div class="mb-4">
										<table class="table table-bordered">
											<tr>
												<td width="150">사원번호</td>
												<td><input type="text" id="cod" name="cod"
													class="form-control" value="${emp.cod }" readonly /></td>
											</tr>
											<tr>
												<td width="150">사원명</td>
												<td><input type="text" id="name" name="name"
													class="form-control" placeholder="사원명을 입력해주세요."
													value="${emp.name }" required /></td>
											</tr>
											<tr>
											<td width="150">부서번호</td>
												<td>
													<input type="text"
														   id="deptCodPrint"
														   class="form-control"
														   style="width: 70%; float: left"
														   value="${emp.departmentCod }"
														   disabled
														   readonly />
													<input type="hidden" id="deptCod" name="departmentCod" />
													<button type="button"
														    class="btn btn-primary"
														    id="loadValues"
														    style="margin-left: 2rem; width: 15%"
															data-bs-toggle="modal"
															data-bs-target="#kvModal">
													부서 조회</button>
												</td>
											</tr>
											<tr>
												<td width="150">직책</td>
												<td><input type="text" id="empPosition" name="empPosition"
													value="${emp.empPosition }" class="form-control"
													placeholder="직책을 입력해주세요." required /></td>
											</tr>
											<tr>
												<td width="150">입사일</td>
												<td>
												<input type="date" id="regdate" name="regdate"
													value="<fmt:formatDate value="${emp.regdate}" pattern="yyyy-MM-dd" />" class="form-control"
													placeholder="입사일을 입력해주세요." required /></td>
											</tr>
											<tr>
												<td width="150">이메일</td>
												<td><input type="text" id="email" name="email"
													value="${emp.email }" class="form-control"
													placeholder="이메일을 입력해주세요." required /></td>
											</tr>
											<tr>
												<td width="150">전화번호</td>
												<td><input type="text" id="tel" name="tel"
													value="${emp.tel }" class="form-control"
													placeholder="전화번호를 입력해주세요." required /></td>
											</tr>
											<tr>
												<td width="150">생년월일</td>
												<td>
												<input type="date" id="birthdate" name="birthdate"
													value="<fmt:formatDate value="${emp.birthdate}" pattern="yyyy-MM-dd" />" class="form-control"
													placeholder="생년월일을 입력해주세요." required /></td>
											</tr>
											<tr>
												<td width="150">성별</td>
												<td>
													<select id="gender" name="gender" class="form-control" required>
														<option value="">선택</option>
														<c:choose>
															<c:when test="${emp.gender eq 'M'}">
																<option value="M" selected>남성</option>
																<option value="F" >여성</option>
															</c:when>
															<c:otherwise>
																<option value="M">남성</option>
																<option value="F" selected>여성</option>
															</c:otherwise>
														</c:choose>
													</select>
												</td>
											</tr>
											<tr>
												<td width="150">퇴사일</td>
												<td>
												<input type="date" id="quitdate" name="quitdate"
													value="<fmt:formatDate value="${emp.quitdate}" pattern="yyyy-MM-dd" />" class="form-control"
													placeholder="퇴사일을 입력해주세요." /></td>
											</tr>
											<tr>
												<td width="150">퇴사사유</td>
												<td><input type="text" id="quitReason" name="quitReason"
													value="${emp.quitReason }" class="form-control"
													placeholder="퇴사사유를 입력해주세요." /></td>
											</tr>
											<tr>
												<td width="150">비밀번호</td>
												<td><input type="text" id="password name="password"
													value="${emp.password }" class="form-control"
													placeholder="비밀번호 입력해주세요." required /></td>
											</tr>
										</table>
									</div>
									<div style="text-align: center">
										<button type="submit"
											class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
											수정</button>
										<a href="employeelist" class="me-2">
											<button type="button"
												class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
												취소</button>
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
	<!-- 부서찾기 Modal START  -->
	<div class="modal fade" id="kvModal" tabindex="-1"
		aria-labelledby="kvModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="kvModalLabel">코드-값 선택</h5>
					<input type="text" id="searchInput" class="form-control"
						placeholder="코드 또는 값을 입력해주세요."
						style="margin-left: 10px; width: auto; flex-grow: 1" />
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">부서번호</th>
								<th scope="col">부서명</th>
								<th scope="col">사업장</th>
								<th scope="col">지역</th>
							</tr>
						</thead>
						<tbody id="modalTableBody">
							<!-- 여기에 Ajax로 만든 html 속성이 들어감  -->
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 부서찾기 Modal END  -->
	<script type="text/javascript">
	//모달 스크롤바
	function modalScroll() {
		$('.modal-body').addClass('overflow-y-auto');
		$('.modal-body').css('height', '60vh');
	};
	modalScroll();

		const finalChk = () => {
			return true;
		}
		 /* 부서찾기 Modal START */
	    function setValue(cod) {
	       $('#deptCod').val(cod);
	       $('#deptCodPrint').val(cod);
	       $('#kvModal').modal('hide');
	       $('.modal-backdrop').remove();
	    }

	    $(document).ready(function () {
	       $('#loadValues').on('click', function () {
	          $.ajax({
	             url: 'deptsearch',
	             method: 'GET',
	             dataType:"json",
	             success: function (data) {
	                let rows = '';
	                data.forEach(function (item) {
	                      rows +=
	                         '<tr onclick="setValue(\'' +
	                         item.cod + 
	                         '\')" ' +
	                         'class="searchValue" data-cod="' +
	                         item.cod +
	                         '" data-name="' +
	                         item.name +
	                         '" data-wrkname="' +
	                         item.wrkname +
	                         '" data-location="' +
	                         item.location +
	                         '" style= "' +
	                         'cursor: pointer' +
	                         '">' +
	                         '<td>' +
	                         item.cod +
	                         '</td>' +
	                         '<td>' +
	                         item.name +
	                         '</td>' +
	                         '<td>' +
	                         item.wrkname +
	                         '</td>' +
	                         '<td>' +
	                         item.location +
	                         '</td>' +
	                         '</tr>';
	                         
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
	             var name = $(this).data('name').toLowerCase()
	             var wrkname = $(this).data('wrkname').toLowerCase()
	             var location = $(this).data('location').toLowerCase()
	             $(this).toggle(cod.includes(searchInputVlaue) 
	            		 		|| name.includes(searchInputVlaue)
	            		 		|| wrkname.includes(searchInputVlaue)
	            		 		|| location.includes(searchInputVlaue));
	          });
	       });
	    });
	    /* 부서찾기 Modal END */
	</script>
</body>

</html>