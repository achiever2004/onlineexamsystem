<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .question {
            margin-bottom: 20px;
        }

        .options {
            margin-left: 20px;
        }

        .options label {
            display: block;
            margin-bottom: 5px;
        }

        button {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Quiz 1</h1>
    <form action="submitquiz.jsp" method="post">
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                String dbURL = "jdbc:mysql://localhost:3306/online_exam";
                String dbUsername = "root";
                String dbPassword = "aimer";
                conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                // Query to fetch all questions
                String sql = "SELECT * FROM questions";
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();

                // Display each question
                int questionNumber = 1;
                while (rs.next()) {
                    String questionText = rs.getString("question_text");
                    String optionA = rs.getString("option_a");
                    String optionB = rs.getString("option_b");
                    String optionC = rs.getString("option_c");
                    String optionD = rs.getString("option_d");

        %>
                    <div class="question">
                        <h3>Q<%= questionNumber %>: <%= questionText %></h3>
                        <div class="options">
                            <label>
                                <input type="radio" name="question<%= questionNumber %>" value="A" required> <%= optionA %>
                            </label>
                            <label>
                                <input type="radio" name="question<%= questionNumber %>" value="B" required> <%= optionB %>
                            </label>
                            <label>
                                <input type="radio" name="question<%= questionNumber %>" value="C" required> <%= optionC %>
                            </label>
                            <label>
                                <input type="radio" name="question<%= questionNumber %>" value="D" required> <%= optionD %>
                            </label>
                        </div>
                    </div>
        <%
                    questionNumber++;
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
        <button type="submit">Submit Quiz</button>
    </form>
</body>
</html>
