<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
      <title>지점 근태관리</title>
    <link rel="stylesheet" href="/resources/css/btn.css" />
    <style>
      .waper {
        width: 100%;
        padding: 50px;
        font-family: 'Open Sans', sans-serif;
      }
      .main_name{
            font-weight: bolder;
            font-size: 50px;
            margin: 0;
        }
        #top-manu{
            display: flex;
            justify-content: space-between;
        }
        #top-left{
            width: 70%;
        }
        #top-left1{
            background-color: white;
            display: flex;
            align-content: center;
            align-items: center;
            width: 100%;
            border-bottom-right-radius: 20px;
            padding-bottom: 10px;
        }

        #top-right1{
            width: 30%;
            display: flex;
            justify-content: right;
            align-items: center;
            padding-bottom: 10px;

        }
        #top-left p {
            padding-left: 15px;
        }
        #main{
            background-color: #D9D9D9;
            width: 100%;
            height: 90%;
            border-top-right-radius: 20px;
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
            padding: 50px 50px 100px;
        }
        #main-in{
            background-color: white;
            width: 100%;
            height: 100%;
            border-radius: 20px;
            padding: 50px;
        }


      #main-pageing {
        padding-top: 10px;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      #table1 {
        text-align: center;
        outline: none;
        width: 100%;
        table-layout: auto;
      }
      #main-pageing img {
        width: 70px;
        padding: 10px;
      }
      #main-pageing img:nth-of-type(2) {
        transform: rotate(180deg);
      }

      #main-pageing button {
        border: #b4b4b4 solid 3px;
        background: white;
        color: #b4b4b4;
        font-weight: bold;
        margin: 5px;
      }
      #main-pageing button:hover {
        border: #3c3c3c solid 3px;
        color: #3c3c3c;
        font-weight: bold;
      }
      #x_img{
            width: 10px;
            height: 10px;
    }
    #btn-close-modal{
            width: 20px;
            height: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

    .modal-content {
        max-height: 50vh;
        min-height: 40vh;
    }

    .modal-header, .modal-footer{
        background-color: #D9D9D9;

    }
    #footer{
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 2px;
    }

    .modal-body input{
        border:1px solid gray;
        border-radius : 8px;
        width:80%;
        height:8%;
        text-align:center;
        margin-bottom:16px;
    }


    #modal-body-div{
        padding-left:18%;
        padding-top:4%;
    }

    #header-title{
        margin-left:22%;
    }
    #header-title h1{
        font-weight:bold;
    }
    .modal-dialog {
        position: absolute;
        top:5%;
        left: 20%;
        transform: translateX(20%);
    }

    input[type='text'], .gowork-btn:active, .gowork-btn:focus,.gohome-btn:active, .gohome-btn:focus{
       outline: none;
      }
    #modal-div p input[readonly]{
        background-color: #f8f8f8;
        color: #777;
        border: 1px solid #ddd;
    }
    #footer-btn-edit{
        width: 60%;
    }
      .modal-info-line {
          display: flex;
          gap: 12px;
          align-items: center;
          margin-bottom: 20px;
          height: 50px;
          justify-content: space-between;
          width: 80%;
          padding: 20px;
          font-weight: bold;
          font-size: 16px;
      }
      #modal-div p>input[type='datetime-local']{
          height: 50px;
      }


    </style>
  </head>
  <body>
    <jsp:include page="../common/header.jsp" />
    <div class="waper">
        <div id="top-manu">
            <div id="top-left">
                <div id="top-left1">
                    <img src="../resources/menu_icons/근태관리 아이콘.png">
                    <p class="main_name">근태 관리</p>
                </div>
            </div>
            <div id="top-right1">
                <button class="gowork-btn" onclick="changebtn(this)" data-type="출근">출근</button>
                <button class="gohome-btn" onclick="changebtn(this)" style="display: none" data-type="퇴근"> 퇴근</button>
            </div>

        </div>
        <fmt:formatDate value="${attendance.workingTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
        <div id="main">
            <div id="main-in">
                <table class="table table-hover" id="table1">
                    <colgroup>
                        <col style="width: 10%" />
                        <col style="width: 10%" />
                        <col style="width: 10%" />
                        <col style="width: 16%" />
                        <col style="width: 10%" />
                        <col style="width: 20%" />
                        <col style="width: 4%" />
                        <col style="width: 20%" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th>직급</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>전화번호</th>
                        <th>재직</th>
                        <th>출근시간&nbsp;</th>
                        <th>~</th>
                        <th>&nbsp;퇴근시간</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="attendance" items="${attendanceList}">
                        <tr data-residentno="${attendance.member.residentNo}" data-member-id="${attendance.member.memberId}">
                            <td>
                                <c:choose>
                                    <c:when test="${attendance.member.position == '1'}">본사</c:when>
                                    <c:when test="${attendance.member.position == '2'}">지점장</c:when>
                                    <c:when test="${attendance.member.position == '3'}">매니저</c:when>
                                    <c:when test="${attendance.member.position == '4'}">알바</c:when>
                                    <c:otherwise>없음</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${attendance.member.memberId}</td>
                            <td>${attendance.member.memberName}</td>
                            <td>${attendance.member.phone}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${attendance.member.status == 'Y'}">재직</c:when>
                                    <c:when test="${attendance.member.status == 'N'}">퇴직</c:when>
                                    <c:otherwise>없음</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <fmt:formatDate value="${attendance.workingTime}" pattern="yyyy-MM-dd HH:mm" />
                                <input type="hidden" class="data-working-time" value="<fmt:formatDate value='${attendance.workingTime}' pattern='yyyy-MM-dd\'T\'HH:mm' />" />
                            </td>
                            </td>
                            <td>~</td>
                            <td>
                                <fmt:formatDate value="${attendance.workoutTime}" pattern="yyyy-MM-dd HH:mm" />
                                <input type="hidden" class="data-workout-time" value="<fmt:formatDate value='${attendance.workoutTime}' pattern='yyyy-MM-dd\'T\'HH:mm' />" />
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        <div id="main-pageing">
          <img src="/resources/common/공통_페이징바화살표.png" />
          <button type="button" class="btn btn-outline-secondary">1</button>
          <button type="button" class="btn btn-outline-secondary">2</button>
          <button type="button" class="btn btn-outline-secondary">3</button>
          <button type="button" class="btn btn-outline-secondary">4</button>
          <button type="button" class="btn btn-outline-secondary">5</button>
          <button type="button" class="btn btn-outline-secondary">6</button>
          <button type="button" class="btn btn-outline-secondary">7</button>
          <button type="button" class="btn btn-outline-secondary">8</button>
          <button type="button" class="btn btn-outline-secondary">9</button>
          <button type="button" class="btn btn-outline-secondary">10</button>
          <img src="/resources/common/공통_페이징바화살표.png" />
        </div>
      </div>

      <!--start point-->
      <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"
      ></script>

        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <div id="header-title">
                            <h1 class="modal-title fs-5">근태 정보 수정</h1>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close-modal">
                            <img src="<c:url value='/resources/common/공통_Icon.png'/>" id="x_img">
                        </button>
                    </div>
                    <div class="modal-body">
                        <!--모달 내용-->
                        <div id="modal-body-div">
                            <div id="modal-div">
                                <p class="modal-info-line">
                                    <span id="modal-rank"></span>&#47;
                                    <span id="modal-id"></span>&#47;
                                    <span id="modal-name"></span>
                                </p>
                                <input type="hidden" id="modal-member_id" />

                                <p>
                                    <strong>출근시간</strong><br />
                                    <input type="datetime-local" id="modal-working_time" class="search-input-gray"/>
                                </p>
                                <p>
                                    <strong>퇴근시간</strong><br />
                                    <input type="datetime-local" id="modal-workout_time" class="search-input-gray"/>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" id="footer">
                        <button type="button" class="gray-btn" id="footer-btn-edit">
                            수정
                        </button>
                    </div>
                </div>
            </div>
        </div>


    <script>
        document.addEventListener('DOMContentLoaded', function () {
          const rows = document.querySelectorAll('#table1 tbody tr');

          rows.forEach((row) => {
            row.classList.add('table-row');

            row.addEventListener('click', function () {
                const rank = this.children[0].innerText;
                const id = this.children[1].innerText;
                const name = this.children[2].innerText;
                const working_time = this.querySelector('.data-working-time').value;
                const workout_time = this.querySelector('.data-workout-time').value;

                document.getElementById('modal-rank').innerText = rank;
                document.getElementById('modal-id').innerText = id;
                document.getElementById('modal-name').innerText = name;

                document.getElementById('modal-working_time').value = working_time;
                document.getElementById('modal-workout_time').value = workout_time;

                document.getElementById('modal-member_id').value = this.dataset.memberId;

                const modal = new bootstrap.Modal(
                    document.getElementById('staticBackdrop')
                );
                modal.show();
            });
          });
        });

        function changebtn(this_btn) {
            const now = new Date();
            const kstOffset = 9 * 60 * 60 * 1000; // 9시간 오프셋
            const kstTime = new Date(now.getTime() + kstOffset);
            const updateTime = kstTime.toISOString().slice(0, 16); // yyyy-MM-ddTHH:mm

            const type = this_btn.dataset.type; // "출근" or "퇴근"
            const workingInput = document.getElementById("modal-working_time");
            const workoutInput = document.getElementById("modal-workout_time");
            const memberId = document.getElementById('modal-id').innerText.trim();

            let timeToSend = '';
            let url = '';

            if (type === '출근') {
                workingInput.value = updateTime;
                timeToSend = updateTime;
                url = '/spot_attendance/updateTime';

                this_btn.style.display = "none";
                document.querySelector(".gohome-btn").style.display = "inline-block";
            } else {
                workoutInput.value = updateTime;
                timeToSend = updateTime;
                url = '/spot_attendance/updateTime';

                this_btn.style.display = "none";
                document.querySelector(".gowork-btn").style.display = "inline-block";
            }

            const data = {
                memberId: document.getElementById("modal-member_id").value,
                time: timeToSend
            };
            console.log("보내는 데이터 확인:", data);

            fetch(url, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(data)
            })
                .then(response => {
                    if (!response.ok) throw new Error("서버 오류 발생");
                    return response.json();
                })
                .then(result => {
                    console.log("서버 응답:", result);
                    alert(type + " 시간이 저장되었습니다!");
                })
                .catch(err => {
                    console.error(err);
                    alert("시간 저장 중 오류가 발생했어요.");
                });
        }

        document.getElementById('footer-btn-edit').addEventListener('click', function () {
            const memberId = document.getElementById('modal-id').innerText.trim();
            const workingTime = document.getElementById('modal-working_time').value;
            const workoutTime = document.getElementById('modal-workout_time').value;

            if (!workingTime || !workoutTime) {
                alert('출근시간 또는 퇴근시간이 비어 있습니다.');
                return;
            }

            fetch('/spot_attendance/updateAttendance', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    memberId,
                    workingTime,
                    workoutTime
                })
            })
                .then(response => response.json())
                .then(data => {
                    if (data.result === 'success') {
                        alert('수정이 완료되었습니다.');
                        location.reload();
                    } else {
                        alert('수정 실패!');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('서버 오류 발생');
                });
        });



    </script>
    </div>
  </body>
</html>
