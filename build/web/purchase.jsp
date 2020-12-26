<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! String pid;%>
<%
    pid = request.getParameter("p_id");
    if(pid == null){
        out.print("Invalid Product ID");
        return;
    }
    %>
    <sql:setDataSource var="conn" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/myshopkart"
                   user="root" password=""/>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <sql:query var="result" dataSource="${conn}">
            SELECT * FROM `products` WHERE `productid`='<%=pid%>'
        </sql:query>
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <c:forEach var="row" items="${result.rows}">
                        <div class="box" style="padding: 20px">
                            <div class="row">
                                <div class="col-md-5"> 
                                    <img src="images/<c:out value="${row.product_category}"/>/<c:out value="${row.productid}"/>.jpg" alt="<c:out value="${row.product_name}"/>" width="100%" >
                                </div>
                                <div class="col-md-7">
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
                                        <c:if test="${row.quantity > 0}">
                                        <tr>
                                            <td colspan="2">
                                                <a class="btn btn-primary center-block" href="confirm_buy.jsp?pid=<c:out value="${row.productid}"/>">Confirm Buy</a>
                                            </td>
                                        </tr>
                                        </c:if>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="col-md-3">

                </div>
            </div>
            <hr>
        </div>    
        <%@include file="footer.jsp" %>
    </body>
</html>
