<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            text-align: center;
            margin-top: 50px;
        }

        h1 {
            color: #333;
        }

        .quiz-box {
            margin-top: 20px;
        }

        button {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, Student!</h1>
        <div class="quiz-box">
            <h2>Quiz 1</h2>
            <button onclick="window.location.href='quizpage.jsp'">Start Now</button>
        </div>
    </div>
</body>
</html>
