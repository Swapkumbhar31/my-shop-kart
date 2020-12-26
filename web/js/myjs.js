$(document).ready(function () {
    $("button[id=addtocart]").click(function(){
        var id = $(this).data('id');
        var btn = $(this);
        var values = {
            postid:id
        };
        $.ajax({
            url: "addtocart",
            type: "POST",
            datatype: "json",
            data: values,
            success: function (data) {
                if(data==="login"){
                    window.location.replace("login.jsp");return;
                }
                if(data==="nostock"){
                    alert("Product out of stock");return;
                }
                btn.html("Add more to <span class='glyphicon glyphicon-shopping-cart' aria-hidden='true'></span>");
                
            },
            error: function (e) {
                alert("Somthing goes wrong"+e);
            }
        });
    });
    $("button[id=removeformcart]").click(function(){
        var id = $(this).data('id');
        var btn = $(this);
        var values = {
            postid:id
        };
        $.ajax({
            url: "removeformcart",
            type: "POST",
            datatype: "json",
            data: values,
            success: function (data) {
                window.location.replace("cart.jsp");
            },
            error: function (e) {
                alert("Somthing goes wrong"+e);
            }
        });
    });
});