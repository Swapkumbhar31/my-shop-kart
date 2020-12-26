<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getSession().getAttribute("username") == null){
        response.sendRedirect("login.jsp");
    }
    if(request.getMethod().equalsIgnoreCase("post")){%>
    <%! public String getID() {
        String id = "";
        int num = 1;
        for (int x = 1; x <= 16; x++) {
            do {
                num = (int) Math.round(Math.random()*1000%124);   
            } while (!((num > 64 && num < 91) || (num > 47 && num < 58) || (num > 96 && num < 123)));      
            id = id + (char)num;
        }
        return id;
    }%>
    <%! String pname,company,price,discount,category,quantity,entry_date,rating; %>
    <%
        pname = request.getParameter("pname");
        company = request.getParameter("company");
        price = request.getParameter("price");
        discount = request.getParameter("discount");
        category = request.getParameter("category");
        quantity = request.getParameter("quantity");
        entry_date = request.getParameter("entry_date");
        rating = request.getParameter("rating");
    %>
    <sql:setDataSource var="entry" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/myshopkart"
                       user="root" password=""/>
    <sql:update dataSource="${entry}" var="result">
        INSERT INTO `products`(`productid`, `product_name`, `company`, 
        `price`, `discount`, `product_category`, `quantity`, `entry_date`,`rating`)
        VALUES
        (?,?,?,?,?,?,?,?,?)
        <sql:param value="<%=getID()%>"/>
        <sql:param value="<%=pname%>"/>
        <sql:param value="<%=company%>"/>
        <sql:param value="<%=price%>"/>
        <sql:param value="<%=discount%>"/>
        <sql:param value="<%=category%>"/>
        <sql:param value="<%=quantity%>"/>
        <sql:param value="<%=entry_date%>"/>
        <sql:param value="<%=rating%>"/>
    </sql:update>
        <%! String msg = "Added Successfully"; %>
<% }
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">
            <form class="form-signin col-sm-4 col-sm-offset-4 well" method="post" action="productentry.jsp">
                <p class="bg-danger"><%if(msg == null){out.print(msg);}else{}%></p>
                <h2 class="form-signin-heading">Product Entry</h2>
                <label for="pname" class="sr-only">Product Name</label>
                <input type="text" class="form-control" name="pname" placeholder="Product Name" required>
                <br>
                <label for="company" class="sr-only">Company</label>
                <input type="text" class="form-control" name="company" placeholder="Company" required>
                <br>
                <label for="price" class="sr-only">Price</label>
                <input type="number" class="form-control" name="price" placeholder="Price" required>
                <br>
                <label for="discount" class="sr-only">Discount</label>
                <input type="number" class="form-control" name="discount" placeholder="Discount" required>
                <br>
                <label for="category" class="sr-only">Product Category</label>
                <input type="text" class="form-control" name="category" placeholder="Product Category" required>
                <br>
                <label for="quantity" class="sr-only">Product Quantity</label>
                <input type="number" class="form-control" name="quantity" placeholder="Product Quantity" required>
                <br>
                <label for="entry_date" class="sr-only">Entry Date</label>
                <input type="date" class="form-control" name="entry_date" placeholder="Product Entry Date" required>
                <br>
                <label for="rating" class="sr-only">Rating</label>
                <input type="number" class="form-control" name="rating" placeholder="Rating out of 5" required>
                <br>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Enter</button>
            </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
