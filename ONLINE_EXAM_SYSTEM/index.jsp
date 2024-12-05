<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Our Online Exam System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212; /* Dark background */
            margin: 0;
            padding: 0;
            color: white; /* Text color */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .glass-container {
            background: rgba(255, 255, 255, 0.1); /* Transparent background */
            backdrop-filter: blur(15px); /* Glassmorphism blur */
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            padding: 30px;
            width: 60%;
            text-align: center;
        }

        h1 {
            color: #FFFFFF;
            margin-top: 20px;
        }

        p {
            font-size: 18px;
            margin: 10px 0;
        }

        a {
            color: #fff;
            background-color: #007BFF; /* Blue */
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
        }

        a:hover {
            background-color: #0056b3; /* Darker blue */
        }

        form {
            margin: 20px auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1); /* Transparent background */
            backdrop-filter: blur(10px); /* Glassmorphism blur */
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            color: white;
        }

        label {
            display: block;
            font-size: 16px;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            background-color: rgba(255, 255, 255, 0.2); /* Slight transparent input */
            color: white;
        }

        input[type="submit"] {
            background-color: #28a745; /* Green */
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #218838; /* Darker green */
        }

        .container {
            width: 100%;
            text-align: center;
        }

        .link-container {
            margin: 20px 0;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="glass-container">
        <div class="container">
            <h1>Welcome to Our Online Exam System</h1>

            <div class="link-container">
                <p><a href="login.jsp">Login to Your Account</a></p>
            </div>
        </div>
    </div>
</body>
</html>
