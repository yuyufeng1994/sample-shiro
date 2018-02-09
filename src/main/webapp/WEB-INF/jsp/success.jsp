<%--
  Created by IntelliJ IDEA.
  User: yuyufeng
  Date: 2018/2/8
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>${message}</title>
    <%@include file="/WEB-INF/jsp/include/head.jsp" %>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <h1>${message}</h1>
        </div>
    </div>
    <%@include file="/WEB-INF/jsp/include/bodyfoot.jsp" %>
</body>
</html>
