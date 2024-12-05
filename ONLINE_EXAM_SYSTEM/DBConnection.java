import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() {
        Connection con = null;
        try {
            // Load the JDBC driver (for example, MySQL)
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Replace with your actual database URL, username, and password
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/online_exam", 
                "your_username", 
                "aimer"
            );
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
}
