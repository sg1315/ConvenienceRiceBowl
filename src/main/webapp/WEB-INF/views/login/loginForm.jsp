<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>loginForm</title>
    <style>
        * {
            font-family: MalgunGothic, '맑은 고딕','돋움', Dotum, AppleGothic, Sans-serif, Arial; font-size: 12px; line-height: 1;color: #333;
            font-weight: 600;
        }

        html {
            background-color: #477154;
        }
        
        .box {
            max-width: 100%;
            margin: auto;
        }

        .login {
            /*가로길이로 로그인입력창크기 수정가능(나머지는 건드리지마세요)*/
            width: 580px;
            height: min-content;
            display: grid;
            grid-template-columns: 50% 50%;
            margin: 18vh auto;
        }

        .login>* {
            width: 100%;
        }

        .login>div {
            width: 100%;
            display: flex;
            display: grid;
            flex-direction: column;
            grid-template-rows: 76% 24%;
        }
        .login>div>div>*{font-size:large;}
        .login>div>div>button,
        input {
            border: 1px solid white;
            border-radius: 10px;
        }

        #input {
            display: grid;
            grid-template-rows: 1fr 2fr 1fr 2fr;
            padding: 20% 5% 0 5%;
        }

        #input>* {
            margin: 0 0 5%;
        }

        #input>p {
            margin-left: 5%;
            align-self: self-end;
            color: white;
        }

        #button {
            display: grid;
            grid-template-columns: 48% 48%;
            gap: 4%;
            padding: 0 5% 10% 5%;
        }

        #button-2 {
            background-color: #FFC000;
            border: 1px solid #FFC000;
        }
    </style>
</head>

<body>
    <div class="box">
        <div class="login">
            <img src="../../../resources/common/로그인로고.png" alt="">
            <div>
                <div class="login-1" id="input">
                    <p>아이디</p>
                    <input type="text">
                    <p>비밀번호</p>
                    <input type="text">
                </div>
                <div class="login-1" id="button">
                    <button id="button-1">로그인</button>
                    <button id="button-2">회원가입</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        const screenWidth = window.screen.width;
        const screenHeight = window.screen.height;
        const box = document.querySelector('.box');
        box.style.width = screenWidth * 0.98 + 'px';
        box.style.height = screenHeight * 0.7 + 'px';
    </script>

</body>
</html>