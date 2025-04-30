<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="studentmenu.jsp"/>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        color: #333;
    }

    form {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        width: 50%;
        margin: 40px auto;
    }

    h2 {
        text-align: center;
        color: #111c55;
    }

    label {
        font-weight: bold;
        color: #111c55;
        font-size: 16px;
    }

    .question-container {
        margin-bottom: 20px;
    }

    input[type="radio"] {
        margin-right: 10px;
    }

    .radio-group {
        margin-bottom: 15px;
    }

    input[type="submit"] {
        background-color: #111c55;
        color: white;
        border: none;
        padding: 12px 20px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 5px;
        width: 100%;
    }

    input[type="submit"]:hover {
        background-color: #0e1741;
    }

    .question-container br {
        margin-bottom: 10px;
    }
</style>

<form action="/saveStudentAnswer" method="post">
    <h2>Answer the Questions</h2>

    <c:forEach var="question" items="${all_question}">
        <div class="question-container">
            <label for="q${question.sl_no}">Q${question.sl_no}: ${question.question}</label>
            <div class="radio-group">
                <input type="radio" name="q${question.sl_no}" value="1" id="q${question.sl_no}_1">
                <label for="q${question.sl_no}_1">${question.option1}</label>
            </div>
            <div class="radio-group">
                <input type="radio" name="q${question.sl_no}" value="2" id="q${question.sl_no}_2">
                <label for="q${question.sl_no}_2">${question.option2}</label>
            </div>
            <div class="radio-group">
                <input type="radio" name="q${question.sl_no}" value="3" id="q${question.sl_no}_3">
                <label for="q${question.sl_no}_3">${question.option3}</label>
            </div>
            <div class="radio-group">
                <input type="radio" name="q${question.sl_no}" value="4" id="q${question.sl_no}_4">
                <label for="q${question.sl_no}_4">${question.option4}</label>
            </div>
        </div>
    </c:forEach>

    <input type="submit" value="Submit Answer">
</form>
