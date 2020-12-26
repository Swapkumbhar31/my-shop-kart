<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sql:setDataSource var="conn" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/myshopkart"
                   user="root" password=""/>
<%! String tid;%>
    <%
        tid = request.getParameter("tid").trim();
        %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">
            <h1><i class="fa fa-shopping-cart" aria-hidden="true"></i> Thank You</h1>
            <h3>Your transaction id is <u><%=tid%></u></h3>
            <hr>
            <sql:query dataSource="${conn}" var="result">
                SELECT * FROM `products` WHERE `quantity`!=0 ORDER BY `rating` DESC LIMIT 0,3
            </sql:query>
            <div class="box">
                <h3>Shop more items <small><a href="index.jsp"> see more</a></small></h3>
                <div class="row">
                    <c:forEach var="row" items="${result.rows}">
                        <div class="col-md-4">
                            <div class="text-center">
                                <a href="view.jsp?p_id=${row.productid}"><img  src="images/<c:out value="${row.product_category}"/>/<c:out value="${row.productid}"/>.jpg" alt="<c:out value="${row.product_name}"/>" width="100%"></a>
                                <div class="caption">
                                    <h4><c:out value="${row.product_name}"/></h4>
                                    <p>Rating : <c:forEach begin="1" end="${row.rating}">
                                            <span class="yellow glyphicon glyphicon-star"  aria-hidden='true'></span> 
                                        </c:forEach>
                                        <br>
                                        Rs. <s><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${row.price}"/></s><br>
                                        Rs. <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${(100-row.discount)*row.price/100}"/>(<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${row.discount}"/>%)</p>

                                    <p>
                                        <a href="purchase.jsp?p_id=<c:out value="${row.productid}"/>" class="btn btn-primary">Buy Now</a>
                                        <c:choose>
                                            <c:when test="${sessionScope.username != null}">
                                                <sql:query  dataSource="${conn}" var="info">
                                                    SELECT `cart_quantity` FROM `cart` WHERE `username`=? AND `product_id`=?
                                                    <sql:param value="${sessionScope.username}"/>
                                                    <sql:param value="${row.productid}"/>
                                                </sql:query>
                                                <c:set var="count" value="${0}"/>
                                                <c:forEach var="row1" items="${info.rows}">
                                                    <c:set var="count" value="${count+1}"/>
                                                </c:forEach>
                                                <c:choose>
                                                    <c:when test="${count != 0}">
                                                        <button class="btn btn-default" id="addtocart" data-id="<c:out value="${row.productid}"/>">Add more to <span class='glyphicon glyphicon-shopping-cart' aria-hidden='true'></span></button>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <button class="btn btn-default" id="addtocart" data-id="<c:out value="${row.productid}"/>">Add to <span class='glyphicon glyphicon-shopping-cart' aria-hidden='true'></span></button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                                <c:otherwise>
                                                <button class="btn btn-default" id="addtocart" data-id="<c:out value="${row.productid}"/>">Add to <span class='glyphicon glyphicon-shopping-cart' aria-hidden='true'></span></button>
                                                </c:otherwise>
                                            </c:choose>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
                <hr>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
