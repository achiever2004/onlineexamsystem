<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Result</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h1 {
            color: #333;
            font-weight: normal;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.2em;
            color: #555;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            background-color: #007BFF;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Your Results</h1>
    <%
        // Initialize the score variable
        int score = 0;

        // Fetch the user's answers and compare with the correct answers stored in the database
        Connection conn = db.DBConnection.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM questions");
        
        // Iterate through each question
        while (rs.next()) {
            int questionId = rs.getInt("id");
            int correctAnswer = rs.getInt("correct_option");

            // Get the user's answer for the current question
            String userAnswer = request.getParameter("q" + questionId);

            // If the user answered the question, compare the answer with the correct one
            if (userAnswer != null && Integer.parseInt(userAnswer) == correctAnswer) {
                score++;
            }
        }
        conn.close();
    %>

    <p>Your Score: <%= score %> out of 4</p>

    <%
        if (score == 4) {
    %>
        <p>Excellent! You scored 100%!</p>
    <%
        } else if (score >= 3) {
    %>
        <p>Great job! You scored <%= score %> out of 4!</p>
    <%
        } else {
    %>
        <p>Good effort! You scored <%= score %> out of 4. Keep practicing!</p>
    <%
        }
    %>

    <a href="index.jsp">Go Home</a>
</body>
</html>
