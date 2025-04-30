Include the faculty menu
<jsp:include page="facultymenu.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Upload Video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #e3f2fd, #ffffff);
            font-family: 'Segoe UI', sans-serif;
        }
        .upload-card {
            max-width: 700px;
            margin: 60px auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.1);
            padding: 40px;
            animation: fadeIn 1s ease;
        }
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(20px);}
            to {opacity: 1; transform: translateY(0);}
        }
        .form-label {
            font-weight: 600;
            color: #111c55;
        }
        .btn-upload {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            background-color: #111c55;
            border: none;
            color: white;
        }
        .btn-upload:hover {
            background-color: #0a1247;
        }
        .preview-video {
            margin-top: 20px;
            display: none;
        }
        h2 {
            color: #111c55;
        }
        .alert-danger {
            background-color: #ffcccc;
            border-color: #ff6666;
        }
        .btn-outline-primary {
            border-color: #111c55;
            color: #111c55;
        }
        .btn-outline-primary:hover {
            background-color: #111c55;
            color: white;
        }
        .success-message {
            text-align: center;
            border: 1px solid #111c55;
            background-color: aquamarine;
        }
        .success-message h3 {
            color: green;
        }
        .success-message {
    text-align: center;
    border: 1px solid #28a745;  /* Green border */
    background: linear-gradient(to right, #d4edda, #c3e6cb); /* Light green gradient */
    color: #155724;  /* Dark green text */
    padding: 15px;
    border-radius: 8px;  /* Rounded corners */
    font-weight: bold;
}

    </style>
</head>
<body>

  <c:if test="${not empty error}">
        <div class="alert alert-danger">
            <strong>Error!</strong> ${error}
        </div>
    </c:if>

<div class="upload-card">
    <h2 class="mb-4 text-center">📹 Upload a New Video</h2>

    <!-- Back to Dashboard Button -->
    <a href="/facultydashboard" class="btn btn-outline-primary mb-4">
        🔙 Back to Dashboard
    </a>

    <form action="/upload_video" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="title" class="form-label">🎯 Video Title</label>
            <input type="text" class="form-control" name="title" placeholder="Enter video title" required>
        </div>

        <div class="mb-3">
            <label for="file" class="form-label">📁 Choose MP4 File</label>
            <input class="form-control" type="file" name="file" accept="video/*" onchange="previewVideo(event)">
        </div>

        <div class="preview-video text-center">
            <label class="form-label">🎬 Video Preview</label>
            <video id="videoPreview" width="100%" height="320" controls></video>
        </div>

        <button type="submit" class="btn btn-upload mt-4">🚀 Upload Video</button>
        <div class="success-message"><h3>${success}</h3></div>
    </form>
</div>

<script>
    function previewVideo(event) {
        const previewSection = document.querySelector('.preview-video');
        const video = document.getElementById('videoPreview');
        const file = event.target.files[0];
        if (file && file.type === "video/mp4") {
            video.src = URL.createObjectURL(file);
            previewSection.style.display = "block";
        } else {
            previewSection.style.display = "none";
        }
    }
</script>

</body>
</html>
