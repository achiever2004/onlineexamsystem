<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz</title>
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
            text-align: center;
        }

        form {
            background-color: #fff;
            padding: 20px 30px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        p {
            margin-bottom: 15px;
            font-size: 1em;
            color: #555;
        }

        input[type="radio"] {
            margin-right: 8px;
        }

        button {
            display: block;
            width: 100%;
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Take the Quiz</h1>
    <form action="result.jsp" method="post">
        <%
            // Database connection
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Load the JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish connection (update DB URL, user, and password)
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam", "root", "aimer");

                // Fetch questions
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM questions");

                // Dynamically render questions
                int questionNumber = 1;
                while (rs.next()) {
        %>
        <p>
            <%= questionNumber++ %>. <%= rs.getString("question") %><br>
            <input type="radio" name="q<%= rs.getInt("id") %>" value="1"> <%= rs.getString("option1") %><br>
            <input type="radio" name="q<%= rs.getInt("id") %>" value="2"> <%= rs.getString("option2") %><br>
            <input type="radio" name="q<%= rs.getInt("id") %>" value="3"> <%= rs.getString("option3") %><br>
            <input type="radio" name="q<%= rs.getInt("id") %>" value="4"> <%= rs.getString("option4") %><br>
        </p>
        <%
                }
            } catch (Exception e) {
                out.println("<p>Error loading questions: " + e.getMessage() + "</p>");
            } finally {
                // Close resources
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
