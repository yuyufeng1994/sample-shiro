<%--
  Created by IntelliJ IDEA.
  User: yuyufeng
  Date: 2018/2/8
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/WEB-INF/jsp/include/head.jsp" %>
</head>
<body>

<div id="wrapper">

    <!-- Navigation -->
    <%@include file="/WEB-INF/jsp/include/nav.jsp" %>

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">用户管理</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <table class="table table-striped" >
                        <thead><tr><th>ID</th><th>用户名</th><th>密码</th><th>操作</th></tr></thead>
                        <tbody id="data-list"></tbody>
                    </table>
                </div>
                <!-- /.col-lg-12 -->
                <div class="col-lg-12">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- /.row -->

        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>

<!-- /#wrapper -->
<%@include file="/WEB-INF/jsp/include/bodyfoot.jsp" %>

</body>
<script>
    $.get("/authority/user/list?pageNum=1", function (res) {
        var list = res.list;
        var str = "";
        for (var i = 0; i < list.length; i++) {
            str+="<tr><td>"+list[i].userId+"</td><td>"+list[i].userName+"</td><td>"+list[i].userPassword+"</td><td></td></tr>"
        }
        $("#data-list").html(str)
    })
</script>
</html>



