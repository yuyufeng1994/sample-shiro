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
                    <h1 class="page-header">角色管理</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>名称</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="data-list"></tbody>
                    </table>
                </div>
                <!-- /.col-lg-12 -->
                <div class="col-lg-12">
                    <nav aria-label="Page navigation">
                        <ul class="pagination" id="navi-li">

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
    var dataPageUrl = "/authority/role/list"
    function dataPage(pageNum) {
        $.get(dataPageUrl + "?pageNum=" + pageNum, function (res) {
            //分页编码
            var liStr = "";
            if (res.hasPreviousPage) {
                liStr += "<li class='previous'><a href='javascript:dataPage(" + res.prePage + ")' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
            } else {
                liStr += "<li class='disabled previous'><a  href='##' aria-label='Previous' aria-hidden='true' disabled='disabled' ><span>&laquo;</span></a></li>";
            }
            for (var i = 0; i < res.navigatepageNums.length; i++) {
                if (res.pageNum == res.navigatepageNums[i]) {
                    liStr += ("<li class='active'><a href='javascript:dataPage(" + res.navigatepageNums[i] + ")'>" + res.navigatepageNums[i] + "</a></li>")
                } else {
                    liStr += ("<li><a href='javascript:dataPage(" + res.navigatepageNums[i] + ")'>" + res.navigatepageNums[i] + "</a></li>")
                }
            }
            if (res.hasNextPage) {
                liStr += "<li class='next'><a href='javascript:dataPage(" + res.nextPage + ")' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
            } else {
                liStr += "<li class='disabled next'><a href='##' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
            }
            $("#navi-li").html(liStr);

            //数据
            var list = res.list;
            var str = "";
            for (var i = 0; i < list.length; i++) {
                str += "<tr><td>" + list[i].roleId + "</td><td>" + list[i].roleName + "</td><td></td></tr>"
            }
            $("#data-list").html(str)
        })
    }


    //加载第一页
    dataPage(1);
</script>
</html>



