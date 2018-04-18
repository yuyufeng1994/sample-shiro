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
    <title>登录</title>
    <%@include file="/WEB-INF/jsp/include/head.jsp" %>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">请登录</h3>
                </div>
                <div class="panel-body">
                    <form role="form" action="/do-login" method="post" id="form-login">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="用户名" name="username" type="text" autofocus value="yyf1">
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="密码" name="password" type="password"
                                       value="12345">
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input name="remember" type="checkbox" value="true">记住我
                                </label>
                            </div>
                            <button type="button" class="btn btn-lg btn-success btn-block" onclick="doLogin()">登录</button>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/jsp/include/bodyfoot.jsp" %>
</body>
<script>
    function doLogin() {
        $("#form-login").submit();
    }
</script>
</html>
