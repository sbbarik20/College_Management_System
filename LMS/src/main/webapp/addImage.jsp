<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Image</title>
</head>
<body>

<h2>Upload an Image</h2>

<form action="/upload_image" method="post" enctype="multipart/form-data">
    <label>Select Image:</label>
    <input type="file" name="image" accept="image/*" required><br><br>
    
    <input type="submit" value="Upload">
</form>

</body>
</html>
