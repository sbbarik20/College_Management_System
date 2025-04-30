<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="facultymenu.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Save Question</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 40px;
        }
        .form-label {
            font-weight: 600;
            color: #111c55; /* Dark blue text for labels */
        }
        .form-control {
            border-radius: 8px;
            border: 1px solid #111c55; /* Dark blue border for inputs */
        }
        .btn-save {
            width: 100%;
            padding: 12px;
            background-color: #111c55; /* Dark blue background for button */
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 8px;
        }
        .btn-save:hover {
            background-color: #0e1748; /* Slightly darker blue for hover effect */
        }
        .success-message {
            text-align: center;
            padding: 15px;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
            border-radius: 8px;
            margin-top: 20px;
        }
        .error-message {
            text-align: center;
            padding: 15px;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
            border-radius: 8px;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="form-container">
            <h2 class="text-center text-primary mb-4">Add a New Question</h2>

            <form action="/save_question" method="post">
                <!-- Question Type -->
                <div class="mb-3">
                    <label for="type" class="form-label">Select Question Type:</label>
                    <select name="type" class="form-control" required>
                        <option value="java">Java</option>
                        <option value="python">Python</option>
                    </select>
                </div>

                <!-- Question and Answer Rows (Two Inputs per Row) -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="question" class="form-label">Question:</label>
                        <input type="text" name="question" class="form-control" placeholder="Enter the question" required>
                    </div>
                    <div class="col-md-6">
                        <label for="answer" class="form-label">Correct Answer:</label>
                        <input type="text" name="answer" class="form-control" placeholder="Enter correct answer" required>
                    </div>
                </div>

                <!-- Options Rows (Two Inputs per Row) -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="option1" class="form-label">Option 1:</label>
                        <input type="text" name="option1" class="form-control" placeholder="Enter option 1" required>
                    </div>
                    <div class="col-md-6">
                        <label for="option2" class="form-label">Option 2:</label>
                        <input type="text" name="option2" class="form-control" placeholder="Enter option 2" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="option3" class="form-label">Option 3:</label>
                        <input type="text" name="option3" class="form-control" placeholder="Enter option 3" required>
                    </div>
                    <div class="col-md-6">
                        <label for="option4" class="form-label">Option 4:</label>
                        <input type="text" name="option4" class="form-control" placeholder="Enter option 4" required>
                    </div>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-save">Save Question</button>
            </form>

            <!-- Success or Error Message -->
            <c:if test="${not empty msg}">
                <div class="success-message">
                    <h5>${msg}</h5>
                </div>
            </c:if>
        </div>
    </div>

</body>
</html>
