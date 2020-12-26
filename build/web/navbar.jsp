
<nav class="navbar navbar-inverse" style="border-radius: 0px;">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i> MyShopKart.Com</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">HOME</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Category
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="mobile.jsp">&nbsp;<i class="fa fa-mobile" aria-hidden="true"></i> &nbsp;&nbsp;Mobiles</a></li>
                        <li><a href="laptop.jsp"><i class="fa fa-laptop" aria-hidden="true"></i> &nbsp;Laptops</a></li>
                        <li><a href="Television.jsp"><i class="fa fa-television" aria-hidden="true"></i> Televisions</a></li> 
                    </ul>
                </li>
            </ul>
            <%
                if (request.getSession().getAttribute("username") == null) {
            %>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="signin.jsp"><i class="fa fa-user" aria-hidden="true"></i> Sign Up</a></li>
                <li><a href="login.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a></li>
            </ul>
            <% } else { %>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Cart</a></li>
                <li><a href="logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
            </ul>
            <% }%>
        </div>
    </div>
</nav>