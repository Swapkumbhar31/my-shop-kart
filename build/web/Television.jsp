<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<sql:setDataSource var="data" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/myshopkart"
                   user="root" password=""/>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <sql:query var="result" dataSource="${data}">
            SELECT * FROM `products` WHERE `product_category`='Television' Order by `rating` Desc
        </sql:query>
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <c:forEach var="row" items="${result.rows}">
                        <div class="box" style="padding: 20px">
                            <div class="row">
                                <div class="col-md-5">
                                    <a href="view.jsp?p_id=${row.productid}"><img src="images/<c:out value="${row.product_category}"/>/<c:out value="${row.productid}"/>.jpg" width="100%" ></a>
                                </div>
                                <div class="col-md-7">
                                    <h3><c:out value="${row.product_name}"/></h3>
                                    <table class="table table-bordered">
                                        <tr>
                                            <td>Product Price</td>
                                            <td>Rs. <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${row.price}"/></td>
                                        </tr>
                                        <tr>
                                            <td>Product Rating</td>
                                            <td><c:forEach begin="1" end="${row.rating}">
                                                    <span class="yellow glyphicon glyphicon-star"  aria-hidden='true'></span> 
                                                </c:forEach></td>
                                        </tr>
                                        <tr>
                                            <td>Product Discount</td>
                                            <td><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${row.discount}"/>%</td>
                                        </tr>
                                        <tr>
                                            <td>Total</td>
                                            <td>Rs. <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${(100-row.discount)*row.price/100}"/></td>
                                        </tr>
                                        <tr>
                                            <td>In Stock</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${row.quantity <= 0}">
                                                        <c:out value="Stock Remaining : Out Of Stock"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        Stock Remaining : <c:out value="${row.quantity}"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="purchase.jsp?p_id=<c:out value="${row.productid}"/>" class="btn btn-primary">Buy Now</a>
                                            </td>
                                            <td>
                                                 <c:choose>
                                                    <c:when test="${sessionScope.username != null}">
                                                        <sql:query  dataSource="${data}" var="info">
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
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                                <hr>
                    </c:forEach>
                </div>
                <div class="col-md-3">

                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
