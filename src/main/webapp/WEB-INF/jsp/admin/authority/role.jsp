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
            <div class="row">
                <div class="col-lg-8">
                    <div class="btn-group" role="group" aria-label="...">
                        <button type="button" onclick="addItem()" class="btn btn-default"><i
                                class="glyphicon glyphicon-plus"></i> 增加
                        </button>
                        <button type="button" onclick="deleteItem()" class="btn btn-default"><i
                                class="glyphicon glyphicon-minus"></i> 删除
                        </button>
                        <button type="button" onclick="editItem()" class="btn btn-default"><i
                                class="glyphicon glyphicon-pencil"></i> 修改
                        </button>
                        <button type="button" onclick="permissionItem()" class="btn btn-default"><i
                                class="glyphicon glyphicon-user"></i> 权限
                        </button>
                    </div>
                </div>
            </div>

            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div id='my-yui'></div>
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
    var yui = new YUI('#my-yui')
    yui.customConfig = {
        head:['角色ID',"角色名","展示"],
        server:"/authority/role/list"
//        checkBox:"single"
    }
    yui.create()
    
    function permissionItem() {
        var id = yui_listSelectId();
        console.log(id)
    }
</script>
</html>



