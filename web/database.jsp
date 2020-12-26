<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : database
    Created on : 5 Sep, 2016, 9:22:44 PM
    Author     : Swapnil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/dmart"
     user="root"  password=""/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from employee;
</sql:query>
 
<table border="1" width="100%">
<tr>
   <th>Emp ID</th>
   <th>First Name</th>
   <th>Last Name</th>
   <th>Address</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.empid}"/></td>
   <td><c:out value="${row.empfname}"/></td>
   <td><c:out value="${row.emplname}"/></td>
   <td><c:out value="${row.empadd}"/></td>
</tr>
</c:forEach>
</table>
 