<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Title</title>
    <link rel="stylesheet" href="../resources/css/btn.css" />
  </head>
  <body>
    <jsp:include page="common/header.jsp" />
    <!-- index.jsp -->
    <div style="display: inline-block;">
        <h4>css 공통버튼 사용방법</h4>
        <hr>

        <pre>
  전부 클래스 선택자만들어 놓았습니다.
  색상과 기능으로 클래스이름 지었으니 참고하시고 보시면 좋을 것 같아요!
  위치는 각자 잡아주세요!!
        </pre>
        <br>
        <h5>1. 검색바</h5>
        <ul>
            <li>
                <p>(1)본사 검색바</p>

                <ul>
                    <li> div : .search-div-gray </li>
                    <li> input(type=text) : .search-input-gray</li>
                    <li>input(type=sumit) : .search-input-submit-gray </li>
                    <li>select :.selectbox-border </li>
                    <br>
                    <li>
                        예시
                        <select name="search" style="display: inline-block;" class="selectbox-border">
                            <option   value="검색어1"></option>
                            <option  value="검색어2"></option>
                        </select>
                        <div class="search-div-gray" style="display: inline-block;">
                            <input class="search-input-gray" type="text" />
                            <input class="search-input-submit-gray" type="submit" />
                        </div>
                    </li>
                </ul>
            </li>
            <hr>

            <li>
                <p>(2)erp 검색바</p>
                <ul>
                    <li> div : .search-div </li>
                    <li> input(type=text) : .search-input </li>
                    <li>input(type=sumit) : .search-input-submit </li>
                    <li>select :.selectbox </li>
                    <br>
                    <li>
                        예시
                        <select  style="display: inline-block;" name="search" class="selectbox">
                            <option value="검색어1"></option>
                            <option value="검색어2"></option>
                        </select>
                        <div class="search-div" style="display: inline-block;">
                            <input class="search-input" type="text" />
                            <input class="search-input-submit" type="submit" />
                        </div>
                    </li>
                </ul>
            </li>
            <hr>
        </ul>

        <h5>2. 버튼</h5>
        <ul>
            <li>
                <p>gray버튼들 </p>
                <ul>
                    <li>(근태관리-근태수정)
                         테두리없는 회색: .gray-btn
                    </li>
                    <li>(본사-발주 "저번달/최근")
                        테두리있는 회색: .gray-btn-border
                    </li>

                    <li>(erp 개인정보수정)
                        테두리없고 김 : .gray-long-btn
                    </li>

                    <li>
                        (발주-발주완료) 진한회색 정사각 : .deep-gray-btn
                    </li>
                    <br>
                    <li>예시
                        <button class="gray-btn ">수정</button>
                        <button class="gray-btn-border ">저번달</button>
                        <button class="gray-long-btn ">수정</button>
                        <button class="deep-gray-btn ">발주완료</button>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <div style="display: inline-block;">
        <ul>
            <p>white버튼들 </p>
            <li>(상품관리-이미지 찾기)
                테두리 있는 흰색 : .white-btn-border
            </li>
            <li>(발주- "저번달/최근")
                테두리 없는 흰색: .white-btn
            </li>
            <li>(발주- "저번달/최근")
                테두리 없는 흰색: .white-btn-round
            </li>
            <br>
            <li>예시
                <button class="white-btn-border">이미지찾기</button>
                <button class="white-btn">저번달
                </button>
                <button class="white-btn-round">POS 연동
                </button>
            </li>
        </ul>
        <br>
        <hr>
        <ul>
            <p>승인/거절(파랑/빨강/검정) 버튼</p>
            <li>(요기저기)승인 : .yes-btn</li>
            <li>(요기저기)거절 : .no-btn </li>
            <li>(모달창)삭제: .black-btn</li>
            <li>(입고)입고완료 .black-big-btn</li>
            <li>(모달창)수정 .red-btn</li>
            <br>
            <li>예시
                <button class="no-btn">거절</button>
                <button class="yes-btn">승인</button>
                <button class="black-btn">삭제</button>
                <button class="black-big-btn">입고완료</button>
                <button class="red-btn">수정</button>
            </li>
        </ul>
        <br>
        <hr>
        <ul>
            <p>날짜</p>
            <li>날짜 테두리 있음 : date-input-border  </li>
            <li>날짜 테두리 없음 :  date-inpu</li>
            <li>예시
                <input type="date" class="date-input-border"></input>
                <input type="date" class="date-input "></input>
            </li>
        </ul>
        <br>
        <hr>
        <ul>
            <p>댓글관련</p>
            <li>댓글버튼(댓글보이기) button : .comment-btn  </li>
            <li>댓글버튼(댓글보이기) img : .comment-btn > img </li>
            <li>댓글(작성하기) div : .comment-div</li>
            <li>댓글(작성하기) input : .comment-input</li>
            <li>댓글(작성하기) input[type=submit] : comment-input-submit </li>
            <br>
            <li>예시
                <br>
                <button class="comment-btn">댓글</button>
                <div clsaa="comment-div">
                    <input class="comment-input" type="text">
                    <input class="comment-input-submit" type="submit"></input>
                </div>
            </li>
        </ul>
    </div>
    <a href="/spot_order">지점 발주관리</a>
    <a href="/head_order1">이것이 진짜 본사 발주다 이걸 눌러야한다</a>
    <a href="/dashboard">대시보드</a>
    <a href="/spot_member">지점 맴버관리</a>
    <a href="/spotProduct">지점 상품목록</a>
    <a href="/spotOutput">지점 출고</a>
  </body>
</html>
