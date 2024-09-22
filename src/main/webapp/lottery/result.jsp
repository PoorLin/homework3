<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/bootstrap.jsp" %>
<%@ include file="/common/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>lottery</title>

    <style>
        .lottery-numbers {
            font-size: 1.5rem;
            line-height: 1.5;
            margin: 10px 0;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">
<div class="justify-content-center flex-column text-center mt-3">
    <h1>lottery</h1>
</div>

<div class="container flex-grow-1 d-flex flex-column justify-content-center align-items-center">

    <!-- 出的樂透組數 -->
    <div class="mb-3">
        <h2>樂透組數</h2>
        <div class="d-flex justify-content-center">
        <span class="badge bg-secondary align-items-center">
            <%= request.getParameter("lotteryCount") != null ? request.getParameter("lotteryCount") : "尚未輸入" %>
        </span>
        </div>
    </div>
    <!-- 排除的數字 -->
    <div class="mb-3">
        <h2>排除的數字</h2>
        <div class="d-flex justify-content-center">
        <span class="badge bg-secondary align-items-center">
            <%= request.getParameter("excludedNumbers") != null ? request.getParameter("excludedNumbers") : "尚未輸入" %>
        </span>
        </div>
    </div>

    <!-- 樂透數字 -->
    <div class="mb-3">
        <h2>生成的樂透號碼</h2>

        <div class="lottery-numbers">
            <ul class="list-group">
                <%
                    ArrayList<Integer>[] res = (ArrayList<Integer>[]) request.getAttribute("res");
                    if (res != null) {
                        for (ArrayList<Integer> group : res) {
                            if (group != null) {
                %>
                <li class='list-group-item'>
                    <%= group.toString().replaceAll("[\\[\\]]", "") %>
                </li>
                <%
                        }
                    }
                } else {
                %>
                <li class='list-group-item'>尚未生成樂透號碼</li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
    <button class="btn btn-secondary" onclick="window.location.href='<%=request.getContextPath()%>/index.jsp'">回首頁</button>
</div>

<%@ include file="/common/footer.jsp" %>

</body>
</html>
