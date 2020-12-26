<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getSession().getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%! String username;%>
<%
    username = request.getSession().getAttribute("username").toString();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            SELECT * FROM `products` p,`cart` c WHERE p.`productid`=c.`product_id` AND c.`username`=?
            <sql:param value="${username}"/>
        </sql:query>
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <c:forEach var="row" items="${result.rows}">
                        <div class="box" style="padding: 20px">
                            <div class="row">
                                <div class="col-md-4">
                                    <a href="view.jsp?p_id=${row.productid}"><img src="images/<c:out value="${row.product_category}"/>/<c:out value="${row.productid}"/>.jpg" width="100%" ></a>
                                </div>
                                <div class="col-md-8">
                                    <h3><c:out value="${row.product_name}"/></h3>
                                    <table class="table table-bordered">
                                        <tr>
                                            <td>Product Price</td>
                                            <td>Rs. <c:out value="${row.price}"/></td>
                                        </tr>
                                        <tr>
                                            <td>Product Rating</td>
                                            <td><c:forEach begin="1" end="${row.rating}">
                                                    <span class="yellow glyphicon glyphicon-star"  aria-hidden='true'></span> 
                                                </c:forEach></td>
                                        </tr>
                                        <tr>
                                            <td>Product Discount</td>
                                            <td><c:out value="${row.discount}"/> %</td>
                                        </tr>
                                        <tr>
                                            <td>Total</td>
                                            <td>Rs. <c:out value="${(100-row.discount)*row.price/100}"/></td>
                                        </tr>
                                        <tr>
                                            <td>Quantity Ordered :</td>
                                            <td><c:out value="${row.cart_quantity}"/></td>
                                        </tr>
                                        <tr>
                                            <td>In Stock</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${row.quantity < 0}">
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
                                                <button class="btn btn-default" id="removeformcart" data-id="<c:out value="${row.productid}"/>">Remove form <span class='glyphicon glyphicon-shopping-cart' aria-hidden='true'></span></button>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="well col-md-3">
                    <sql:query var="result" dataSource="${data}">
                        SELECT * FROM `products` p,`cart` c WHERE p.`productid`=c.`product_id` AND c.`username`=? AND p.`quantity`>=c.`cart_quantity`
                        <sql:param value="${username}"/>
                    </sql:query>
                    <c:set var="total" value="${0}"/>
                    <c:set var="tprice" value="${0}"/>
                    <c:set var="dtotal" value="${0}"/>
                    <c:forEach var="row" items="${result.rows}">
                        <c:set var="total" value="${total + row.cart_quantity}"/>
                        <c:set var="tprice" value="${tprice+row.price*row.cart_quantity}"/>
                        <c:set var="dtotal" value="${dtotal +(100-row.discount)*row.price*row.cart_quantity/100}"/>
                    </c:forEach>
                    <c:set var="discounttotal" scope="session" value="${dtotal}"/>
                    <h2>Check Out</h2>
                    <form action="confirm_buy.jsp?pid=1&type=crt" method="POST">
                        <table class="table table-bordered">
                            <tr>
                                <td>Total item</td>
                                <td class="text-right"><c:out value="${total}"/></td>
                            </tr>
                            <tr>
                                <td>Total price</td>
                                <td class="text-right">Rs. <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${tprice}"/></td>
                            </tr>
                            <tr>
                                <td>Total Discount</td>
                                <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="2" value="${(tprice-dtotal)/tprice*100}"/>%</td>
                            </tr>
                            <tr>
                                <td>Discount price</td>
                                <td class="text-right">Rs. <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${dtotal}"/></td>
                            </tr>
                            <c:if test="${total!=0}">
                                <tr>
                                    <td colspan="2">
                                        <label for="address">Address</label>
                                        <textarea placeholder="Address" class="form-control" id="address" rows="5" name="address" required="required"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="text-center">
                                        <input type="submit" value="Check out now &RightArrow;" class="btn btn-primary">
                                    </td>
                                </tr>
                            </c:if>
                        </table>
                    </form>

                </div>
            </div>
            <hr>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>

