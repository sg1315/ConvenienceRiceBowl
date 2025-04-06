<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>enrollForm</title>
    <style>
        .enrollForm {
            min-width: 700px;
            display: grid;
            grid-template-rows: 2fr auto 1fr;
            background-color: white;
            border-radius: 10px;
            margin: 0 auto;
            padding: 10px;
        }
        .enrollForm input{
            min-width: 0;
        }
        /**/
        .enrollForm-1{
            display: flex;
            justify-content: center;
            background-color: #D9D9D9;
        }
        #enrollTitle{
            align-items: center ;
            font-size: 20pt;
            border-radius: 8px 8px 0 0;
        }
        .enrollForm p{
            width: max-content;
            height: 100%;
            margin: 0;
            padding: 0;
            font-optical-sizing: auto;
            align-content: center;
        }
        .enrollForm input{
            font-optical-sizing: auto;
        }
        .enrollForm input,.enrollForm button{
            border: 2px solid #8A8A8A;
            border-radius: 8px;
        }
        /**/
        .enrollInput{
            width: 100%;
            display: grid;
            grid-template-rows: 26px 1fr 1fr 1fr 1fr 26px;
            gap: 10px;
        }
        .enrollInput>div{
            min-height: 30px;
            max-height: 40px;
            display: grid;
            grid-template-columns: 12% 1fr 4% 8% 1fr;
            gap: 10px;
            margin: 0 20px;
        }
        .flexInput-1{
            display: grid;
            grid-template-columns: 70% auto;
            gap: 4px;
        }
        .flexInput-2{
            display: grid;    
        }
        #ssnInput{
            display: grid;
        }
        #phoneInput{
            display: grid;
        }
        #checkResult{
            display: grid;
            justify-items: center;
            grid-template-columns: 100%;
        }
        #enrollButton{border-radius: 0 0 8px 8px;}
        #enrollButton > button{
            color: white;
            background-color: #8A8A8A;
            border: none;
            font-size: 14pt;
            margin: 8px;
            padding: 10px;
        }
        /**/
        .flexInput-2 > select {
            border: 2px solid #8A8A8A;
            border-radius: 8px;
            font-optical-sizing: auto;
        }
        .flexInput-2 > select:invalid {color: rgb(207, 207, 207);}
        .flexInput-2 option{color: #000;}
        /**/
    </style>
</head>

<body>
        <div class="enrollForm">
            <div class="enrollForm-1" id="enrollTitle">회원가입</div>
            <div class="enrollInput">
                <div></div>
                <div>
                    <div class="flexInput-2">
                        <select name="position" required>
                            <option value="" selected disabled hidden>직급</option>
                            <option value="2">지점장</option>
                            <option value="4">알바</option>
                        </select>
                    </div>
                    <div class="flexInput-1">
                        <input type="text" id="storeName" name="storeName" required>
                        <button type="button" onclick="checkStoreName()">확인</button>
                    </div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
                <div>
                    <div><p>아이디</p></div>
                    <div class="flexInput-1">
                        <input type="text" name="memberId" required>
                        <button>중복확인</button>
                    </div>
                    <div></div>
                    <div><p>이름</p></div>
                    <div class="flexInput-2"><input type="text" name="memberName" required></div>
                </div>
                <div>
                    <div><p>비밀번호</p></div>
                    <div class="flexInput-2"><input type="password" name="memberPwd" required></div>
                    <div></div>
                    <div><p>주민번호</p></div>
                    <div id="ssnInput">
                        <input type="text" name="residentNo" required>
                    </div>
                </div>
                <div>
                    <div><p>비밀번호 확인</p></div>
                    <div class="flexInput-2"><input type="password" required></div>
                    <div></div>
                    <div><p>핸드폰</p></div>
                    <div id="phoneInput">
                        <input type="text" name="phone">
                    </div>
                </div>
                <div id="checkResult"></div>
            </div>
            <div class="enrollForm-1" id="enrollButton">
                <button type="submit">회원가입</button>
                <button type="reset" onclick="closeEnrollModal()">취소</button>
            </div>
            <script>
                function closeEnrollModal() {
                    document.getElementById("modalBackground").style.display = "none";
                }
                function checkStoreName() {
                    const storeName = document.getElementById("storeName").value;
                    console.log("응답 결과: "+ storeName);
                    $.ajax({
                        url: "/api/store/name",
                        data: {checkStore: storeName},
                        success: function (res){
                            console.log("응답 결과: "+ res);
                            drawCheckText(res);
                        }, error: function (){
                            console.log("아이디 중복체크 ajax 실패");
                        }
                    })
                }

                function drawCheckText(isCheck) {
                    const submitBtn = document.querySelector("#enrollButton button[type='submit']");
                    const checkResult = document.getElementById("checkResult");
                    if (isCheck === "NNNNN") {
                        checkResult.style.color = "red";
                        checkResult.innerText = "이미 사용중인 지점명입니다.";
                        submitBtn.disabled = true;
                    } else {
                        checkResult.style.color = "green";
                        checkResult.innerText = "사용 가능한 지점명입니다.";
                        submitBtn.disabled = false;
                    }
                }

            </script>
        </div>
</body>

</html>