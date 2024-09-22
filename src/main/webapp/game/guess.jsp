<%@ page import="com.systex.homework3.model.GuessGame" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/bootstrap.jsp" %>
<%@ include file="/common/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>guess</title>
</head>
<body class="d-flex flex-column min-vh-100">
<div class="justify-content-center flex-column text-center mt-3">
    <h1>猜數字</h1>
</div>

<div class="container flex-grow-1 d-flex flex-column justify-content-center align-items-center">
    <form action="<%=request.getContextPath()%>/game/gameController.do" method="post">
        <input type="hidden" class="form-control" id="action" name="action" value="guess">
        <!-- 顯示當前遊戲狀態 -->
        <div class="form-group">
            <h3>遊戲狀態:</h3>
            <%
                // 從 session 中獲取 guessGame 對象
                GuessGame guessGame = (GuessGame)session.getAttribute("guessGame");

                // 判斷 guessGame 是否存在
                if (guessGame != null) {
                    // 假設 guessGame 是一個包含遊戲狀態的對象
                    int remainingTries = guessGame.getRemains();  // 獲取剩餘嘗試次數

                    // 顯示剩餘次數
                    out.print("剩餘嘗試次數: " + remainingTries + " 次<br>");

                    // 如果剩餘次數不等於 3，顯示 "猜錯數字" 的 h2
                    if (remainingTries != 3) {
            %>
            <h2 class="text-danger">您猜錯了</h2>
            <%
                    }
                } else {
                    // 如果 guessGame 為 null，顯示初始的剩餘次數為 3 次
                    out.print("剩餘嘗試次數: 3 次<br>");
                }
            %>

        </div>
        <!-- 猜數字區塊 -->
        <div class="mb-3">
            <div class="form-group">
                <h2>數字範圍 (1~10):</h2>
            </div>

            <!-- 輸入猜的數字 -->
            <div class="form-group">
                <label for="guessNumber">輸入你猜的數字:</label>
                <input type="number" class="form-control" id="guessNumber" name="guessNumber" min="1" max="10" required>
            </div>
        </div>

        <!-- 送出按鈕 -->
        <button type="submit" class="btn btn-primary">送出</button>
        <button class="btn btn-secondary" onclick="window.location.href='<%=request.getContextPath()%>/index.jsp'">回首頁</button>
    </form>

</div>

<%@ include file="/common/footer.jsp" %>
</body>
</html>