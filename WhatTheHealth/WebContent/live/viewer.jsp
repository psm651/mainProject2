<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Viewer</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="description" content="WebRTC Video Broadcast.">
	<meta name="author" content="Brian Mau">
	<link href="main.css" rel="stylesheet">
</head>
<body>
<script src="https://192.168.0.39:443/socket.io/socket.io.js"></script>
  <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
<video playsinline autoplay muted></video>

<script src="index.js"></script>
<script src="watch.js"></script>

	<jsp:include page="/socket/chatting.jsp" />

</body>
</html>