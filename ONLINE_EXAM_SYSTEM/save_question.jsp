<%@ page import="java.sql.*" %>
<%
    String question = request.getParameter("question");
    String optionA = request.getParameter("option_a");
    String optionB = request.getParameter("option_b");
    String optionC = request.getParameter("option_c");
    String optionD = request.getParameter("option_d");
    String correctOption = request.getParameter("correct_option");

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String dbURL = "jdbc:mysql://localhost:3306/online_exam";
        String dbUsername = "root";
        String dbPassword = "aimer";
        conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        String sql = "INSERT INTO questions (question_text, option_a, option_b, option_c, option_d, correct_option) VALUES (?, ?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, question);
        stmt.setString(2, optionA);
        stmt.setString(3, optionB);
        stmt.setString(4, optionC);
        stmt.setString(5, optionD);
        stmt.setString(6, correctOption);

        int rowsInserted = stmt.executeUpdate();
        if (rowsInserted > 0) {
            out.println("<script>alert('Question added successfully!'); window.location.href='admindashboard.jsp';</script>");
        }
    } catch (Exception e) {
        out.println("<script>alert('Error: " + e.getMessage() + "'); window.location.href='create_question.jsp';</script>");
    } finally {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
