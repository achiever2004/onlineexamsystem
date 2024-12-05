<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #121212; /* Dark theme background */
            color: white; /* Text color */
        }

        h1, h3 {
            text-align: center;
            color: #FFFFFF;
            margin-top: 20px;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.1); /* Transparent background */
            backdrop-filter: blur(10px); /* Glassmorphism effect */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        th, td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #333;
        }

        tr:hover {
            background-color: #555;
        }

        form {
            margin: 0;
        }

        input[type="submit"], button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 8px 16px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover, button:hover {
            background-color: #0056b3;
        }

        .back-home {
            text-align: center;
            margin-top: 30px;
        }

        .back-home button {
            font-size: 16px;
            padding: 10px 20px;
        }

        .create-question {
            text-align: center;
            margin-top: 20px;
        }

        .create-question button {
            background-color: #28a745; /* Green for Create Question */
            padding: 10px 20px;
            border-radius: 5px;
        }

        .remove-button {
            background-color: #dc3545; /* Red for Remove */
            padding: 5px 10px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
        }

        .remove-button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <h1>Admin Panel</h1>

    <h3>Questions List</h3>

    <div class="create-question">
        <button onclick="window.location.href='create_question.jsp'">Create a New Question</button>
    </div>

    <!-- Table displaying the questions -->
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Question</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Establish database connection
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                
                try {
                    // Set up the connection to the database (adjust with your actual database connection details)
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String dbURL = "jdbc:mysql://localhost:3306/online_exam";
                    String dbUsername = "root";
                    String dbPassword = "aimer";
                    conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                    // Query to fetch all questions
                    String sql = "SELECT * FROM questions";
                    stmt = conn.prepareStatement(sql);
                    rs = stmt.executeQuery();

                    // Iterate through the result set and display questions in the table
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String question = rs.getString("question_text");
            %>
                        <tr>
                            <td><%= id %></td>
                            <td><%= question %></td>
                            <td>
                                <!-- Remove button to delete the question -->
                                <form action="remove_question.jsp" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="<%= id %>">
                                    <button type="submit" class="remove-button">Remove</button>
                                </form>
                            </td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                } finally {
                    // Close the resources
                    try {
                        if (rs != null) rs.close(); 
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>

    <div class="back-home">
        <button onclick="window.location.href='login.jsp'">Back to Home</button>
    </div>

</body>
</html>

