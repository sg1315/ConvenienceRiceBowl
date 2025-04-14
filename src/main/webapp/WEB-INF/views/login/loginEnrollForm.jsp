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
            min-width: 50em;
            height: 32em;
            display: grid;
            grid-template-rows: 1.8fr 6fr 1fr;
            background-color: white;
            border-radius: 1em;
            margin: 0 auto;
            padding: 1em;
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
            border-radius: 0.3em 0.3em 0 0;
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
        #storeSelectBox > select,.enrollForm input,.enrollForm button{
            border: 2px solid #8A8A8A;
            border-radius: 0.5em;
        }
        /**/
        .enrollInput{
            width: 100%;
            height:100%;
            display: grid;
            grid-template-rows: repeat(6,15%);
            gap: 2%;
        }
        .enrollInput>div{
            width: 94%;
            height: 100%;
            display: grid;
            grid-template-columns: 12% 38% 1% 8% 33%;
            justify-self: center;
            align-self: center;
            gap: 1%;
        }
        .flexInput1{
            width: 100%;
            display: flex;
            gap: 0.8%;
        }
        .flexInput1 > input {
            width: 67%;
        }
        .flexInput1 > button {
            width: 32.2%;
        }
        #storeSelectBox > select{
            width: 100%;
            height: 100%;
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
            align-items: center;
            grid-template-columns: 100%;
        }
        #enrollButton{border-radius: 0 0 8px 8px;}
        #enrollButton button{
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
                        <select id="position" name="position" onchange="positionCheck()" required>
                            <option value="" selected disabled hidden>직급</option>
                            <option value="2">지점장</option>
                            <option value="4">알바</option>
                        </select>
                    </div>
                    <div class="flexInput1" id="storeInputBox">
                        <input type="text" id="storeName" name="storeName" oninput="resetStoreCheck()">
                        <button type="button" onclick="checkStoreName()">확인</button>
                    </div>
                    <div id="storeSelectBox" style="display: none;">
                        <select id="StoreNameList" name="storeNo"></select>
                    </div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
                <div>
                    <div><p>아이디</p></div>
                    <div class="flexInput1" id="idInput">
                        <input type="text" id="memberId" name="memberId" oninput="resetIdCheck()" required>
                        <button type="button" onclick="checkId()">중복확인</button>
                    </div>
                    <div></div>
                    <div><p>이름</p></div>
                    <div class="flexInput-2"><input type="text" name="memberName" required></div>
                </div>
                <div>
                    <div><p>비밀번호</p></div>
                    <div class="flexInput-2"><input type="password" id="memberPwd" name="memberPwd" pattern="\[A-Za-z0-9]{12}" oninput="resetPasswordCheck()" required placeholder="12자리 내로 입력하시오"></div>
                    <div></div>
                    <div><p>주민번호</p></div>
                    <div id="ssnInput">
                        <input type="text" name="residentNo" pattern="\d{13}" required placeholder="'-'없이 입력해주세요">
                    </div>
                </div>
                <div>
                    <div><p>비밀번호 확인</p></div>
                    <div class="flexInput-2"><input type="password" id="memberPwdCheck" oninput="passwordCheck()" required></div>
                    <div></div>
                    <div><p>핸드폰</p></div>
                    <div id="phoneInput">
                        <input type="text" name="phone" pattern="\d{10,11}" required placeholder="'-'없이 입력해주세요">
                    </div>
                </div>
                <div id="checkResult"></div>
            </div>
            <div class="enrollForm-1" id="enrollButton">
                <button type="submit" onclick="return checkBeforeSubmit()">회원가입</button>
                <button type="reset" onclick="closeEnrollModal()">취소</button>
            </div>
            <script>
                function closeEnrollModal() {
                    document.getElementById("modalBackground").style.display = "none";
                }

                let isUserIdOk = false;
                let isStoreNameOk = false;
                let isPasswordOk = false;
                function positionCheck() {
                    const position = document.getElementById("position").value;
                    const storeSelectBox = document.getElementById("storeSelectBox");
                    const storeInputBox = document.getElementById("storeInputBox");
                    if(position === "4"){
                        storeSelectBox.style.display = "block";
                        storeInputBox.style.display = "none";
                        isStoreNameOk = true;

                        selectStoreName();
                    } else {
                        storeSelectBox.style.display = "none";
                        storeInputBox.style.display = "flex";
                        isStoreNameOk = false;
                    }
                }
                function checkStoreName() {
                    const position = document.getElementById("position").value;
                    const storeName = document.getElementById("storeName").value;
                    const checkResult = document.getElementById("checkResult");
                    if(position === ""){
                        checkResult.style.color = "red";
                        checkResult.innerText = "직급을 선택해주세요.";
                    } else {
                        $.ajax({
                            url: "/api/store/name",
                            data: {
                                checkStore: storeName,
                                position: position
                            },
                            success: function (isCheck){
                                if (isCheck === "NNNNN") {
                                    checkResult.style.color = "red";
                                    checkResult.innerText = "이미 사용중인 지점명입니다.";
                                    isStoreNameOk = false;
                                } else if(isCheck === "NNNNY") {
                                    checkResult.style.color = "green";
                                    checkResult.innerText = "사용 가능한 지점명입니다.";
                                    isStoreNameOk = true;
                                } else if(isCheck === "NNNYN") {
                                    checkResult.style.color = "red";
                                    checkResult.innerText = "없거나 미승인 상태인 지점입니다.";
                                    isStoreNameOk = false;
                                } else {
                                    checkResult.style.color = "green";
                                    checkResult.innerText = "존재하는 지점입니다.";
                                    isStoreNameOk = true;
                                }
                            }, error: function (){
                                console.log("지점명 중복체크 ajax 실패");
                            }
                        })
                    }
                }
                function selectStoreName(){
                    const checkResult = document.getElementById("checkResult");
                    $.ajax({
                        url: "/api/member/selectStoreName",
                        type:'POST',
                        success: function (storeNameList){
                            if (storeNameList != null) {
                                const select = document.getElementById("StoreNameList");
                                select.innerHTML = ""; // 초기화

                                storeNameList.forEach(store => {
                                    const option = document.createElement("option");
                                    option.value = store.storeNo;
                                    option.text = store.storeName;
                                    select.appendChild(option);
                                });
                            } else {
                                checkResult.style.color = "red";
                                checkResult.innerText = "지점들을 불러오지 못하였습니다. 관리자에게 문의 주십시오.";
                                isStoreNameOk = true;
                            }
                        }, error: function (){
                            console.log("Select 지점명 ajax 실패");
                        }
                    })
                }
                function checkId() {
                    const memberId = document.getElementById("memberId").value;
                    const checkResult = document.getElementById("checkResult");
                    if(memberId.length < 3){
                        checkResult.style.color = "red";
                        checkResult.innerText = "3자이상 적어주세요.";
                        isUserIdOk = false;
                    }
                    $.ajax({
                        url: "/api/member/id",
                        data: {checkId: memberId},
                        success: function (isCheck){
                            if (isCheck === "NNNNN") {
                                checkResult.style.color = "red";
                                checkResult.innerText = "이미 사용중인 아이디입니다.";
                                isUserIdOk = false;
                            } else {
                                checkResult.style.color = "green";
                                checkResult.innerText = "사용 가능한 아이디입니다.";
                                isUserIdOk = true;
                            }
                        }, error: function (){
                            console.log("아이디 중복체크 ajax 실패");
                        }
                    })
                }
                let eventFlag;
                function passwordCheck(){
                    const password = document.getElementById("memberPwd").value;
                    const passwordCheck = document.getElementById("memberPwdCheck").value;
                    const checkResult = document.getElementById("checkResult");
                    isPasswordOk = false;
                    clearTimeout(eventFlag);
                    if(password !== ""){
                        if(password === passwordCheck){
                            isPasswordOk = true;
                            checkResult.style.color = "green";
                            checkResult.innerText = "비밀번호가 같습니다.";
                        } else {
                            eventFlag = setTimeout(function (){
                                checkResult.style.color = "red";
                                checkResult.innerText = "비밀번호가 같지 않습니다.";
                            },500)
                        }
                    } else{
                        checkResult.innerText = "";
                    }
                }
                function resetStoreCheck(){
                    isStoreNameOk = false;
                }
                function resetIdCheck(){
                    isUserIdOk = false;
                }
                function resetPasswordCheck(){
                    passwordCheck();
                }
                function checkBeforeSubmit() {
                    const checkResult = document.getElementById("checkResult");
                    if(!isStoreNameOk){
                        checkResult.style.color = "red";
                        checkResult.innerText = "지점을 확인해 주세요.";
                        return false;
                    } else if (!isUserIdOk){
                        checkResult.style.color = "red";
                        checkResult.innerText = "아이디 중복확인을 해주세요.";
                        return false;
                    } else if (!isPasswordOk){
                        checkResult.style.color = "red";
                        checkResult.innerText = "비밀번호 입력을 하지 않았거나 같지 않습니다.";
                        return false;
                    }
                    return true;
                }
            </script>
        </div>
</body>

</html>