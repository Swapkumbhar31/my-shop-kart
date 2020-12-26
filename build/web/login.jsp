<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">
            <form class="form-signin col-sm-4 col-sm-offset-4 well" method="post" action="loginservlet">
                <span id="errormsg" class="text-danger">
                    <%
                        String err = request.getParameter("err");
                        if(err != null){
                            out.print("Username or password is wrong");
                        }
                        %>
                </span>
                <h2 class="form-signin-heading">Login in</h2>
                <label for="inputEmail" class="sr-only">Email address</label>
                <input type="email" name="username" class="form-control" placeholder="Email address" required autofocus>
                <br>
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" name="password" class="form-control" placeholder="Password" required>
                <br>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
<!-- /container -->