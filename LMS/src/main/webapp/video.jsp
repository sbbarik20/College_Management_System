<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <jsp:include page="studentmenu.jsp" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #f3f9ff, #ffffff);
            font-family: 'Segoe UI', sans-serif;
        }
        .video-container {
            margin: 50px auto;
            max-width: 1000px;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        .video-card {
            margin-bottom: 40px;
            border-bottom: 1px solid #f1f1f1;
            padding-bottom: 20px;
        }
        .video-card:last-child {
            border-bottom: none;
        }
        .video-meta label {
            font-weight: bold;
            color: #333;
        }
        .video-meta p {
            font-size: 16px;
            color: #555;
        }
        .video-title {
            font-size: 20px;
            font-weight: bold;
            color: #111c55;
        }
        .video-description {
            color: #777;
            margin-top: 10px;
            font-size: 14px;
        }
        .btn-like-comment {
            background-color: #111c55;
            color: white;
            border: none;
            padding: 8px 15px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 10px;
        }
        .btn-like-comment:hover {
            background-color: #0e1741;
        }
        .text-primary {
            color: #111c55 !important;
        }
    </style>
</head>

<body>
    <div class="container video-container">
        <h2 class="text-center text-primary mb-4">🎓 Video Lectures</h2>

        <c:forEach var="video" items="${video_data}">
            <div class="row video-card align-items-center">
                <div class="col-md-5 text-center">
                    <video width="100%" height="240" controls muted>
                        <source src="videos/${video.video_name}" type="video/mp4">
                        Your browser does not support the video tag.
                    </video>
                </div>
                <div class="col-md-7 video-meta mt-3 mt-md-0">
                    <p class="video-title">${video.title}</p>
                    <p class="video-description">${video.description}</p>
                    <p>👨‍🏫 <label>Uploaded By:</label> ${video.teacher_id}</p>
                    <p>👍 <label>Likes:</label> ${video.likes}</p>
                    <p>💬 <label>Comments:</label> ${video.comments}</p>
                    <button class="btn-like-comment">Like & Comment</button>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
