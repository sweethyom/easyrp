<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>EasyRP Login</title>

      <!-- Font START (현우 추가)  -->
      <link rel="preconnect" href="https://fonts.googleapis.com" />
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
      <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet" />
      <!-- Font END (현우 추가)  -->

      <!-- API 추가 START (현우 추가) -->

      <!-- SweetAlert(JavaScript alert를 꾸며주는 API)  -->
      <link rel="stylesheet" href="resources/easyrp/assets/extensions/sweetalert2/sweetalert2.min.css" />

      <!-- API 추가 END (현우 추가)  -->

      <!-- 아이콘 추가 START (현우 추가) -->
      <script src="https://kit.fontawesome.com/14e995bc13.js" crossorigin="anonymous"></script>
      <!-- 아이콘 추가 END (현우 추가) -->

      <!-- CSS 추가 START (현우 추가)  -->
      <link rel="stylesheet" href="resources/easyrp/assets/compiled/css/hyunwoo-css.css" />
      <!-- CSS 추가 END (현우 추가)  -->

      <link rel="shortcut icon" href="resources/easyrp/assets/compiled/svg/favicon.svg" type="image/x-icon" />
      <link
         rel="shortcut icon"
         href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
         type="image/png"
      />
      <link rel="stylesheet" href="resources/easyrp/assets/compiled/css/app.css" />
      <link rel="stylesheet" href="resources/easyrp/assets/compiled/css/app-dark.css" />
      <link rel="stylesheet" href="resources/easyrp/assets/compiled/css/auth.css" />
   </head>

   <body>
      <script src="resources/easyrp/assets/static/js/initTheme.js"></script>
      <div id="auth">
         <div class="row h-100">
            <div class="col-lg-5 col-12">
               <div id="auth-left">
                  <div class="auth-logo" style="margin-bottom: 4rem !important">
                     <div class="logo" style="font-size: 4rem !important">
                        <a href="/easyrp">🪄EasyRP</a>
                     </div>
                  </div>
                  <h1 class="auth-title">로그인</h1>
                  <p class="auth-subtitle mb-5">EasyRP 사용 로그인 페이지 입니다.</p>

                  <form>
                     <div class="form-group position-relative has-icon-left mb-4">
                        <input
                           type="text"
                           class="form-control form-control-xl"
                           name="cod"
                           id="cod"
                           placeholder="사원번호"
                           required
                           autofocus
                        />
                        <div class="form-control-icon">
                           <i class="fa-regular fa-address-card"></i>
                        </div>
                     </div>
                     <div class="form-group position-relative has-icon-left mb-4">
                        <input
                           type="password"
                           class="form-control form-control-xl"
                           name="password"
                           id="password"
                           placeholder="비밀번호"
                           required
                        />
                        <div class="form-control-icon">
                           <i class="bi bi-shield-lock"></i>
                        </div>
                     </div>
                     <button type="button" id="loginButton" class="btn btn-primary btn-block btn-lg shadow-lg mt-5">
                        로그인
                     </button>
                  </form>
                  <div class="text-center mt-5 text-lg fs-4">
                     <p class="text-gray-600">비밀번호를 잃어 버리셨을 경우, 인사팀에 문의해주세요.</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-7 d-none d-lg-block">
               <div id="auth-right"></div>
            </div>
         </div>
      </div>
      <script src="resources/easyrp/assets/static/js/components/dark.js"></script>
      <script src="resources/easyrp/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>

      <script src="resources/easyrp/assets/compiled/js/app.js"></script>

      <!-- API 추가 START (현우 추가) -->

      <!-- SweetAlert2 추가 -->
      <script src="resources/easyrp/assets/extensions/sweetalert2/sweetalert2.min.js"></script>
      <script src="resources/easyrp/assets/static/js/pages/sweetalert2.js"></script>

      <!-- 제이쿼리 추가 -->
      <script src="resources/easyrp/assets/extensions/jquery/jquery.min.js"></script>

      <!-- API 추가 END (현우 추가) -->

      <!-- Need: Apexcharts -->
      <script src="resources/easyrp/assets/extensions/apexcharts/apexcharts.min.js"></script>
      <script src="resources/easyrp/assets/static/js/pages/dashboard.js"></script>

      <script type="text/javascript">
         // 2024년 4월 30일 오전 9시 51분 수정 박현우
         // 수정 내용 : Ajax는 Required가 안되므로, 직접 Validation 부분 추가
         // 로그인 기능 Ajax 구현
         function sendAjaxLoginRequest() {
            // input의 값들을 id.val로 받아와 변수에 담는 코드
            let empCode = $('#cod').val();
            let empPassword = $('#password').val();

            if (empCode === '') {
               alert('사원번호가 입력되지 않았습니다.');
               $('#cod').focus();
            } else if (empPassword === '') {
               alert('비밀번호가 입력되지 않았습니다.');
               $('#password').focus();
            } else {
               $.ajax({
                  url: 'loginresult',
                  method: 'POST',
                  data: {
                     cod: empCode,
                     password: empPassword,
                  },
                  success: function (response) {
                     if (response === 'success') {
                        window.location.href = '/easyrp';
                     } else {
                        alert('로그인에 실패하셨습니다. 계속 실패 시 인사팀에 문의해주세요.');
                     }
                  },
                  error: function (xhr, status, error) {
                     alert('로그인 중 오류가 발생했습니다. 다시 한번 시도 해주세요.');
                  },
               });
            }
         }

         // 버튼에 이벤트 추가 -> 위의 로그인기능 함수 수행
         // 2024년 4월 30일 오전 12시 13분 추가 박현우
         $('#loginButton').click(function () {
            sendAjaxLoginRequest();
         });
         
         // 추가: 엔터키 누르면 로그인 버튼 클릭
         $(document).keydown(function (e) {
             if (e.key === 'Enter') {
                 sendAjaxLoginRequest();
             }
         });
      </script>
   </body>
</html>
