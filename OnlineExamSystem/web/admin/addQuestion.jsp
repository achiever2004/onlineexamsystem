<%@ page import="db.DBConnection" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Question</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            width: 50%;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        p {
            margin: 10px 0;
        }

        input[type="text"] {
            width: calc(100% - 20px);
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }

        a {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: #007BFF;
            font-size: 14px;
        }

        a:hover {
            text-decoration: underline;
        }

        .success-message {
            text-align: center;
            margin-top: 20px;
            color: green;
        }
    </style>
</head>
<body>
    <h1>Add a New Question</h1>
    <form method="post">
        <p>
            Question: <input type="text" name="question">
        </p>
        <p>
            Option 1: <input type="text" name="option1"><br>
            Option 2: <input type="text" name="option2"><br>
            Option 3: <input type="text" name="option3"><br>
            Option 4: <input type="text" name="option4"><br>
        </p>
        <p>
            Correct Option: <input type="text" name="correct_option">
        </p>
        <button type="submit">Add Question</button>
    </form>
    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            Connection conn = db.DBConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(
                "INSERT INTO questions (question, option1, option2, option3, option4, correct_option) VALUES (?, ?, ?, ?, ?, ?)");
            pstmt.setString(1, request.getParameter("question"));
            pstmt.setString(2, request.getParameter("option1"));
            pstmt.setString(3, request.getParameter("option2"));
            pstmt.setString(4, request.getParameter("option3"));
            pstmt.setString(5, request.getParameter("option4"));
            pstmt.setInt(6, Integer.parseInt(request.getParameter("correct_option")));
            pstmt.executeUpdate();
            conn.close();
    %>
    <div class="success-message">Question added successfully!</div>
    <%
        }
    %>
    <a href="manage.jsp">Back to Admin Panel</a>
</body>
</html>
