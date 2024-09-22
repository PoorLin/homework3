
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/bootstrap.jsp" %>
<%@ include file="/common/navbar.jsp" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>猜成功</title>

</head>
<body class="d-flex flex-column min-vh-100">
<div class="container text-center mt-5">
    <!-- 成功訊息 -->
    <h1 class="text-success">恭喜你，猜對了！</h1>
    <p class="lead">你成功猜中了正確的數字！</p>

    <!-- 再玩一次按鈕 -->
    <a href="guess.jsp" class="btn btn-primary">再玩一次</a>
    <button class="btn btn-secondary" onclick="window.location.href='<%=request.getContextPath()%>/index.jsp'">回首頁</button>
</div>
<%  session.invalidate();%>
<%@ include file="/common/footer.jsp" %>
</body>
</html>