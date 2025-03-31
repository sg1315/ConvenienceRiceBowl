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
            grid-template-columns: auto min-content auto ;
        }
        #phoneInput{
            display: grid;
            grid-template-columns: 1fr min-content 1fr min-content 1fr;
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
    <form action="#">
        <div class="enrollForm">
            <div class="enrollForm-1" id="enrollTitle">회원가입</div>
            <div class="enrollInput">
                <div></div>
                <div>
                    <div class="flexInput-2">
                        <select required>
                            <option value="" selected disabled hidden>직급</option>
                            <option value="지점장">지점장</option>
                            <option value="알바">알바</option>
                        </select>
                    </div>
                    <div class="flexInput-1">
                        <input type="text">
                        <button>확인</button>
                    </div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
                <div>
                    <div><p>아이디</p></div>
                    <div class="flexInput-1">
                        <input type="text">
                        <button>중복확인</button>
                    </div>
                    <div></div>
                    <div><p>이름</p></div>
                    <div class="flexInput-2"><input type="text"></div>
                </div>
                <div>
                    <div><p>비밀번호</p></div>
                    <div class="flexInput-2"><input type="password"></div>
                    <div></div>
                    <div><p>주민번호</p></div>
                    <div  id="ssnInput">
                        <input type="text"><p>-</p><input type="text">
                    </div>
                </div>
                <div>
                    <div><p>비밀번호 확인</p></div>
                    <div class="flexInput-2"><input type="password"></div>
                    <div></div>
                    <div><p>핸드폰</p></div>
                    <div id="phoneInput">
                        <input type="text"><p>-</p><input type="text"><p>-</p><input type="text">
                    </div>
                </div>
                <div></div>
            </div>
            <div class="enrollForm-1" id="enrollButton">
                <button>회원가입</button>
                <button type="reset" onclick="closeEnrollModal()">취소</button>
            </div>
            <script>
                function closeEnrollModal() {
                    document.getElementById("modalBackground").style.display = "none";
                }
            </script>
        </div>
    </form>
</body>

</html>