<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
            <c:choose>
                <c:when test="${attendance.member.memberId == loginMember.memberId}">
                    <span id="working-time">
                        <fmt:formatDate value="${attendance.workingTime}" pattern="yyyy-MM-dd HH:mm" />
                    </span>
                </c:when>
                <c:otherwise>
                    <fmt:formatDate value="${attendance.workingTime}" pattern="yyyy-MM-dd HH:mm" />
                </c:otherwise>
            </c:choose>
            <input type="hidden" class="data-working-time" value="<fmt:formatDate value='${attendance.workingTime}' pattern='yyyy-MM-dd\'T\'HH:mm' />" />
        </td>
        <td>~</td>
        <td>
            <c:choose>
                <c:when test="${attendance.member.memberId == loginMember.memberId}">
                    <span id="workout-time">
                        <fmt:formatDate value="${attendance.workoutTime}" pattern="yyyy-MM-dd HH:mm" />
                    </span>
                </c:when>
                <c:otherwise>
                    <fmt:formatDate value="${attendance.workoutTime}" pattern="yyyy-MM-dd HH:mm" />
                </c:otherwise>
            </c:choose>
            <input type="hidden" class="data-workout-time" value="<fmt:formatDate value='${attendance.workoutTime}' pattern='yyyy-MM-dd\'T\'HH:mm' />" />
        </td>
    </tr>
</c:forEach>