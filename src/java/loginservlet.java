import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class loginservlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String username,password;
        username = req.getParameter("username");
        password = req.getParameter("password");
        out.print(username);
        out.print(password);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/myshopkart?zeroDateTimeBehavior=convertToNull","root","");
            java.sql.Statement sql = con.createStatement();
            ResultSet rs = sql.executeQuery("SELECT * FROM `users` WHERE `username`='"+username+"' AND `password`='"+password+"'");
            if(rs.next()){
                HttpSession session = req.getSession(true);
                session.setAttribute("username", username);
                session.setMaxInactiveInterval(60*30);
                resp.sendRedirect("index.jsp");
            }else{
                resp.sendRedirect("login.jsp?err=1");
            }
        } catch (Exception ex) {
            
        }
    }
    
}