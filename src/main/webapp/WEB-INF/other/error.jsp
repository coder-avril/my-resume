<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 动态获取context --%>
<% request.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>小码哥教育-Error</title>
    <%@include file="../admin/common/header.jsp"%>
</head>

<body class="five-zero-zero">
    <div class="five-zero-zero-container">
        <div class="error-title">喔豁，出错了</div>
        <div class="error-msg">${message}</div>
        <div class="button-place">
            <a href="#" class="btn btn-default btn-lg waves-effect">回到首页</a>
        </div>
    </div>
</body>

</html>