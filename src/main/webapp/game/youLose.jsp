
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/bootstrap.jsp" %>
<%@ include file="/common/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Game Over</title>

</head>
<body class="d-flex flex-column min-vh-100">
<div class="container text-center mt-5">
    <h1 class="text-danger">遊戲結束</h1>
    <p class="lead">你的次數已經用完，遊戲結束！</p>

    <!-- 重新開始遊戲按鈕 -->
    <a href="guess.jsp" class="btn btn-primary">重新開始遊戲</a>
    <button class="btn btn-secondary" onclick="window.location.href='<%=request.getContextPath()%>/index.jsp'">回首頁</button>
</div>

<%@ include file="/common/footer.jsp" %>
</body>
</html>