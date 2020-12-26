<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%! String x;%>
<%
    x = request.getParameter("temp");
    %>
    <c:set var="x"><%=x%></c:set>
<c:choose>
    <c:when test="${x == 'crt'}">
        <c:out value="x"/>
    </c:when>
</c:choose>
