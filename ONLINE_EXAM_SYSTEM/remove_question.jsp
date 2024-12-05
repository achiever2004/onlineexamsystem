<%@ page import="java.sql.*" %>
<%
    // Retrieve the ID of the question to be deleted from the request
    String id = request.getParameter("id");
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        String dbURL = "jdbc:mysql://localhost:3306/online_exam";
        String dbUsername = "root";
        String dbPassword = "aimer";
        conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        // SQL query to delete the question
        String sql = "DELETE FROM questions WHERE id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(id));

        // Execute the deletion
        int rowsAffected = stmt.executeUpdate();
        
        if (rowsAffected > 0) {
            // Record deleted successfully
            response.sendRedirect("admindashboard.jsp?status=success");
        } else {
            // Record not found or deletion failed
            response.sendRedirect("admindashboard.jsp?status=failed");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("admindashboard.jsp?status=error");
    } finally {
        // Close the resources
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
