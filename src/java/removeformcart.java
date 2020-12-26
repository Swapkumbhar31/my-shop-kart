import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class removeformcart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        String pid = req.getParameter("postid");
        String username = session.getAttribute("username").toString();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/myshopkart?zeroDateTimeBehavior=convertToNull","root","");
            java.sql.Statement sql = con.createStatement();
            sql.executeUpdate("DELETE FROM `cart` WHERE `username`='"+username+"' AND `product_id`='"+pid+"'");
        } catch (Exception ex) {
            
        }
    }
}
