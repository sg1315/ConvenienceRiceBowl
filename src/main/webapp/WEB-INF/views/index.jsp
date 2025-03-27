<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Title</title>
    <link rel="stylesheet" href="../resources/css/btn.css" />
  </head>
  <body>
    <jsp:include page="common/header.jsp" />
    index.jsp

    <div class="btn" style="background-color: #d9d9d9">
      <button id="yes-btn">승인</button>
      <button id="gray-btn-border">저번달</button>
     
      <button id="comment-btn"><img src="./resources/common/위화살표.png" alt="">출근</button>
      <button id="red-btn">댓글</button>

      <div class="gray-search">
        <input id="search-input-gray" type="text" />
        <input id="search-input-submit-gray" type="submit" />
      </div>
      <div class="comment-div">
        <input id="comment-input" type="text"  />
        <input id="comment-input-submit" type="submit" />

        <input id="date-input"  type="date" required aria-required="true" />
      </div>
    </div>

    <a href="/head_order">본사 발주관리</a>
    <a href="/head_order1">이것이 진짜 본사 발주다 이걸 눌러야한다</a>
  </body>
</html>
