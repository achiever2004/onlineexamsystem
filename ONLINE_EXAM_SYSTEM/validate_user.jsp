<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    String url = "jdbc:mysql://localhost:3306/online_exam";
    String dbUser = "root";
    String dbPassword = "aimer";

    boolean isValid = false;
    String role = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);

        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);

        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            isValid = true;
            role = rs.getString("role"); // Assuming you store the role of the user
        }

        conn.close();
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }

    if (isValid) {
        session.setAttribute("username", username); // Store username in session
        session.setAttribute("role", role); // Store role in session

        // Check the role and redirect accordingly
        if ("admin".equalsIgnoreCase(role)) {
            response.sendRedirect("admindashboard.jsp");
        } else {
            response.sendRedirect("studentdashboard.jsp"); // Assuming you have a student dashboard
        }
    } else {
        response.sendRedirect("login.jsp?error=true");
    }
%>
