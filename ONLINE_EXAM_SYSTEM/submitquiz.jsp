<%@ page import="java.sql.*" %>
<%
    int score = 0;

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String dbURL = "jdbc:mysql://localhost:3306/online_exam";
        String dbUsername = "root";
        String dbPassword = "aimer";
        conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        // Fetch all questions and their correct options
        String sql = "SELECT id, correct_option FROM questions";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();

        while (rs.next()) {
            int questionId = rs.getInt("id");
            String correctOption = rs.getString("correct_option");

            // Retrieve student's answer from the request
            String studentAnswer = request.getParameter("question" + questionId);

            if (studentAnswer != null && studentAnswer.equals(correctOption)) {
                score++;
            }
        }

        out.println("<h1>Your Score: " + score + "</h1>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
