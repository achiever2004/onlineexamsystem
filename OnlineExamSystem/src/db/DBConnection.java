package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() throws SQLException {
        try {
            String url = "jdbc:mysql://localhost:3306/onlineexam";
            String username = "root";
            String password = "aimer";

            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("MySQL Driver not found");
        }
    }

    // Main method for testing the connection
    public static void main(String[] args) {
        try {
            // Attempt to get a connection to the database
            Connection conn = getConnection();
            System.out.println("Database connection successful!");

            // Close the connection after testing
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
