import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import static java.awt.image.ImageObserver.HEIGHT;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

public class addtocart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        if(session.getAttribute("username") == null){
            out.print("login");
            return;
        }
        String pid = req.getParameter("postid");
        String username = session.getAttribute("username").toString();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/myshopkart?zeroDateTimeBehavior=convertToNull","root","");
            java.sql.Statement sql = con.createStatement();
            int remstock =0;
            ResultSet rs = sql.executeQuery("SELECT `quantity` FROM `products` WHERE `productid`='"+pid+"'");
            if(rs.next()){
                remstock = Integer.parseInt(rs.getString("quantity"));
                out.print(remstock);
            }
            rs = sql.executeQuery("SELECT `cart_quantity` FROM `cart` WHERE `username`='"+username+"' AND `product_id`='"+pid+"'");
            if(rs.next()){
                if(remstock > Integer.parseInt(rs.getString("cart_quantity"))){
                    sql.executeUpdate("UPDATE `cart` SET `cart_quantity`=`cart_quantity`+1 WHERE `username`='"+username+"' AND `product_id`='"+pid+"'");
                }else{
                    out.print("nostock");return;
                }
            }else{
                sql.executeUpdate("INSERT INTO `cart`(`username`, `product_id`, `cart_quantity`) VALUES ('"+username+"','"+pid+"','1')");
            }
        } catch (Exception ex) {
            
        }
    }
}
