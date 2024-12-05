<%@ page import="java.sql.*" %>
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

        .create-question {
            text-align: center;
            margin-top: 20px;
        }

        .create-question button {
            background-color: #28a745; /* Green for Create Question */
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #222;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            border-radius: 10px;
            color: white;
        }

        .modal-content input, .modal-content select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .modal-content button {
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .post-button {
            background-color: #007BFF; /* Blue */
            color: white;
            border: none;
        }

        .post-button:hover {
            background-color: #0056b3;
        }

        .close-button {
            background-color: #dc3545; /* Red */
            color: white;
            border: none;
        }

        .close-button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <h1>Admin Panel</h1>

    <h3>Questions List</h3>

    <div class="create-question">
        <button onclick="openModal()">Create a New Question</button>
    </div>

    <!-- Modal for creating a new question -->
    <div id="createQuestionModal" class="modal">
        <div class="modal-content">
            <h3>Create a New Question</h3>
            <form id="questionForm">
                <input type="text" name="question_text" placeholder="Enter question text" required>
                <input type="text" name="option1" placeholder="Enter Option 1" required>
                <input type="text" name="option2" placeholder="Enter Option 2" required>
                <input type="text" name="option3" placeholder="Enter Option 3" required>
                <input type="text" name="option4" placeholder="Enter Option 4" required>
                <select name="correct_option" required>
                    <option value="" disabled selected>Select Correct Option</option>
                    <option value="1">Option 1</option>
                    <option value="2">Option 2</option>
                    <option value="3">Option 3</option>
                    <option value="4">Option 4</option>
                </select>
                <button type="button" class="post-button" onclick="postQuestion()">Post</button>
                <button type="button" class="close-button" onclick="closeModal()">Close</button>
            </form>
        </div>
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
        <tbody id="questionTableBody">
            <!-- Questions will be dynamically loaded here -->
            <%
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String dbURL = "jdbc:mysql://localhost:3306/online_exam";
                    String dbUsername = "root";
                    String dbPassword = "aimer";
                    conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                    String sql = "SELECT * FROM questions";
                    stmt = conn.prepareStatement(sql);
                    rs = stmt.executeQuery();

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String question = rs.getString("question_text");
            %>
                        <tr>
                            <td><%= id %></td>
                            <td><%= question %></td>
                            <td>
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

    <script>
        function openModal() {
            document.getElementById('createQuestionModal').style.display = 'block';
        }

        function closeModal() {
            document.getElementById('createQuestionModal').style.display = 'none';
        }

        function postQuestion() {
            const form = document.getElementById('questionForm');
            const formData = new FormData(form);

            fetch('create_question.jsp', {
                method: 'POST',
                body: formData
            }).then(response => response.text()).then(data => {
                alert('Question added successfully!');
                location.reload(); // Reload the page to reflect the new question
            }).catch(error => {
                alert('Error adding question: ' + error.message);
            });
        }
    </script>

    <div class="back-home">
        <button onclick="window.location.href='login.jsp'">Back to Home</button>
    </div>

</body>
</html>
