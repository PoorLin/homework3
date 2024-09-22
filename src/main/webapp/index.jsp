
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/bootstrap.jsp" %>
<%@ include file="/common/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>精誠娛樂城</title>

</head>
<body class="d-flex flex-column min-vh-100">
<div class="justify-content-center flex-column text-center mt-3">
    <h1>選擇遊樂場</h1>
</div>

<div class="container flex-grow-1 d-flex flex-column justify-content-center align-items-center">


    <div class="d-flex">
        <!-- Lottery 按鈕 -->
        <a href="<%=request.getContextPath() %>/lottery/main.jsp" class="btn btn-primary btn-lg mx-2">Lottery</a>
    </div>
    <div class="d-flex mt-3">
        <!-- Guess 按鈕 -->
        <a href="<%=request.getContextPath() %>/game/guess.jsp" class="btn btn-success btn-lg mx-2">Guess</a>
    </div>
</div>

<%@ include file="/common/footer.jsp" %>


</body>
</html>