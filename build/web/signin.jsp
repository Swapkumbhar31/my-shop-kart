<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! String username,fname,lname,password,contact,cpassword,error;%>
<%
    boolean isPost = "POST".equals(request.getMethod());
    if(isPost){
    username = request.getParameter("inputusername");
    fname = request.getParameter("inputfirstname");
    lname = request.getParameter("inputlastname");
    password = request.getParameter("inputPassword");
    cpassword = request.getParameter("inputcPassword");
    contact = request.getParameter("inputcontact");
    if(password.equals(cpassword)){
        if(contact.length() == 10){
            %>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/myshopkart"
     user="root"  password=""/>
<sql:update dataSource="${snapshot}" var="result">
    INSERT INTO `users`(`fname`, `username`, `password`, `lname`, `contact`)
    VALUES 
    ('<%=fname%>','<%=username%>','<%=password%>','<%=lname%>','<%=contact%>');
</sql:update>
<%
    session.setAttribute("username", username);
                session.setMaxInactiveInterval(60*30);
                %>
                <c:redirect url="index.jsp"/>
<%
        }else{
            error = "Invalid contact Number";
        }
    }else{
        error = "Password Not match";
    }
 } %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">
            <form class="form-signin col-sm-4 col-sm-offset-4 well" method="post" id="loginform" action="signin.jsp">
                <span id="errormsg" class="text-danger"><%if(error==null){out.print("");}else{out.print(error);}%></span>
                <h2 class="form-signin-heading">Sign in</h2>
                <label for="inputusername" class="sr-only">Email address</label>
                <input type="email" name="inputusername" class="form-control" placeholder="Email address" required autofocus>
                <br>
                <label for="inputfirstname" class="sr-only">First name</label>
                <input type="text" name="inputfirstname" class="form-control" placeholder="First name" required>
                <br>
                <label for="inputlastname" class="sr-only">Last Name</label>
                <input type="text" name="inputlastname" class="form-control" placeholder="Last Name" required>
                <br>
                <label for="inputcontact" class="sr-only">Contact</label>
                <input type="number" name="inputcontact" class="form-control" placeholder="Contact Number" required>
                <br>
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" name="inputPassword" class="form-control" placeholder="Password" required>
                <br>
                <label for="inputcPassword" class="sr-only">Confirm Password</label>
                <input type="password" name="inputcPassword" class="form-control" placeholder="Confirm Password" required>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>