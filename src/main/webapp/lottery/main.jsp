
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/bootstrap.jsp" %>
<%@ include file="/common/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>lottery</title>
</head>
<body class="d-flex flex-column min-vh-100">
<div class="justify-content-center flex-column text-center mt-3">
    <h1>樂透</h1>
</div>

<div class="container flex-grow-1 d-flex flex-column justify-content-center align-items-center">
    <form action="<%=request.getContextPath()%>/lottery/lotteryController.do">
        <input type="hidden" class="form-control" id="action" name="action" value="generate">
    <!-- 輸入要出的樂透組數 -->
    <div class="mb-3">
        <label for="lotteryCount" class="form-label">輸入要出的樂透組數</label>
        <input type="number" class="form-control" id="lotteryCount" name="lotteryCount" min="1" placeholder="例如: 5">
    </div>
        <!-- 顯示的錯誤訊息 -->
        <div class="text-danger">
            <%
                java.util.Map<String, String> errorMsg = (java.util.Map<String, String>) request.getAttribute("errorMsg");
                if (errorMsg != null && errorMsg.get("lotteryCount") != null) {
                    out.print(errorMsg.get("lotteryCount"));
                }
            %>
        </div>

    <!-- 輸入排除的數字 -->
    <div class="mb-3">
        <label for="excludedNumbers" class="form-label">輸入排除的數字(用空白隔開) </label>
        <input type="text" class="form-control" id="excludedNumbers" name="excludedNumbers" placeholder="例如: 3 5 7">
    </div>


        <!-- 顯示錯誤訊息 -->
        <div class="text-danger">
            <%
                if (errorMsg != null && errorMsg.get("excludedNumbers") != null) {
                    out.print(errorMsg.get("excludedNumbers"));
                }
            %>
        </div>

    <!-- 送出按鈕 -->
        <button id="sub" type="submit" class="btn btn-primary">送出</button>
        <button id="return" class="btn btn-secondary" onclick="window.location.href='<%=request.getContextPath()%>/index.jsp'; return false;">回首頁</button>

    </form>

</div>

<%@ include file="/common/footer.jsp" %>


</body>
</html>