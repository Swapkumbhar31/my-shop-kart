<%@page import="java.util.Date"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:choose>
    <c:when test="${sessionScope.username == null}">
        <c:redirect url="login.jsp"/>
    </c:when>
</c:choose>
<%! String pid;%>
<%
    pid = request.getParameter("pid");
%>
<c:set var="pid"><%=pid%></c:set>
<c:set var="type"><%=type%></c:set>
<sql:setDataSource var="conn" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/myshopkart"
                   user="root" password=""/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getMethod().equalsIgnoreCase("post")) {%>
<%! public String getID() {
        String id = "";
        int num = 1;
        for (int x = 1; x <= 8; x++) {
            do {
                num = (int) Math.round(Math.random() * 1000 % 59);
            } while (!(num > 47 && num < 58));
            id = id + (char) num;
        }
        return id;
    }%>
<c:set var="tid"><%=getID()%></c:set>
<%! String type, add;%>
<%
    type = request.getParameter("type").trim();
    add = request.getParameter("address").trim();
%>
<c:set var="pid"><%=pid%></c:set>
<c:set var="type"><%=type%></c:set>
<c:choose>
    <c:when test="${type == 'single'}">
        <sql:update var="data" dataSource="${conn}">
            UPDATE `products` SET `quantity`=`quantity`-1  WHERE `productid`=?
            <sql:param value="${pid}"/>
        </sql:update>
    </c:when>
    <c:when test="${type == 'crt'}">
        <sql:query var="result" dataSource="${conn}">
            SELECT p.`productid`,c.`cart_quantity` FROM `products` p,`cart` c WHERE p.`productid`=c.`product_id` AND c.`username`=? AND p.`quantity`>=c.`cart_quantity`
            <sql:param value="${username}"/>
        </sql:query>
        <c:forEach var="row" items="${result.rows}">
            <sql:update  dataSource="${conn}">
                UPDATE products SET quantity=quantity-? WHERE `productid`=?
                <sql:param value="${row.cart_quantity}"/>
                <sql:param value="${row.productid}"/>
            </sql:update>
        </c:forEach>

        <c:forEach var="row" items="${result.rows}">
            <sql:update dataSource="${conn}">
                DELETE FROM `cart` WHERE `product_id`=?
                <sql:param value="${row.productid}"/>
            </sql:update>
        </c:forEach>
    </c:when>
</c:choose>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="add"><%=add%></c:set>
<c:set var="date"><fmt:formatDate pattern="yyyy-MM-dd" 
                                  value="${now}" /></c:set>
<sql:update var="data" dataSource="${conn}">
    INSERT INTO `transcations`(`t_id`, `username`, `address`, `amount`, `date`)
    VALUES (?,?,?,?,?)
    <sql:param value="${tid}"/>
    <sql:param value="${sessionScope.username}"/>
    <sql:param value="${add}"/>
    <sql:param value="${sessionScope.discounttotal}"/>
    <sql:param value="${date}"/>
</sql:update>
<c:remove var="discounttotal" scope="session"/>
<c:set var="url">thanku.jsp?tid=<c:out value="${tid}"/></c:set>
<c:redirect url="${url}"/>
<%}%>

<sql:query var="result" dataSource="${conn}">
    SELECT * FROM `products` WHERE `productid`=?
    <sql:param value="${pid}"/>
</sql:query>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">
            <form action="confirm_buy.jsp?pid=<c:out value="${pid}"/>&type=single" method="POST">
                <div class="row">
                    <div class="col-sm-6">
                        <h1><i class="fa fa-edit"></i> Details</h1>
                        <label for="address">Address</label>
                        <textarea placeholder="Address" class="form-control" id="address" rows="5" name="address"></textarea>
                        <br>
                        <input type="submit" value="Buy" class="btn btn-primary"/>
                        <br><br>
                        Payment Type : <b>Cash on delivery</b>
                    </div>
                    <div class="col-sm-6">
                        <c:forEach var="row" items="${result.rows}">
                            <div class="box" style="padding: 20px">
                                <img src="images/<c:out value="${row.product_category}"/>/<c:out value="${row.productid}"/>.jpg" alt="<c:out value="${row.product_name}"/>" height="200px" >
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
                                        <c:set var="discounttotal" scope="session" value="${(100-row.discount)*row.price/100}"/>
                                        <td>Rs. <c:out value="${(100-row.discount)*row.price/100}"/></td>
                                    </tr>
                                </table>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </form>
            <hr>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
