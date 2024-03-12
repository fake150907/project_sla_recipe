<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Create Post</title>
</head>
<body>
	<h2>Create a New Post</h2>
	<form method="post" action="../home/postDoWrite" enctype="multipart/form-data">
		Title:
		<input type="text" name="title">
		<br>
		Content:
		<textarea name="content"></textarea>
		<br>
		Image:
		<input type="file" name="imageFile">
		<br>
		<input type="submit" value="Create">
	</form>
</body>
</html>