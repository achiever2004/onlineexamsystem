<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: white;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.1); /* Transparent white background */
            backdrop-filter: blur(10px); /* Blur effect for glassmorphism */
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            width: 350px;
            text-align: center;
            color: white;
        }

        h2 {
            color: #FFFFFF;
            margin-bottom: 20px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.2);
            color: white;
        }

        input::placeholder {
            color: white;
        }

        .error {
            color: red;
            margin-bottom: 10px;
        }

        .button {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: none;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin: 10px 0;
        }

        .login-btn {
            background-color: #007BFF; /* Blue */
        }

        .login-btn:hover {
            background-color: #0056b3;
        }

        .register-btn {
            background-color: #28a745; /* Green */
        }

        .register-btn:hover {
            background-color: #218838;
        }

        .forgot-btn {
            background-color: #dc3545; /* Red */
        }

        .forgot-btn:hover {
            background-color: #c82333;
        }

    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form method="post" action="validate_user.jsp">
            <%
                String error = request.getParameter("error");
                if (error != null) {
            %>
                <p class="error">Invalid username or password</p>
            <%
                }
            %>
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button class="button login-btn" type="submit">Login</button>
            <!-- Additional buttons for testing -->
        </form>
    </div>
</body>
</html>
