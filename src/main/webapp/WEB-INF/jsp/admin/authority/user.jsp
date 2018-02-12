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
    <script src="/static/js/yui.js"></script>
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
                        <button type="button" onclick="roleItem()" class="btn btn-default"><i
                                class="glyphicon glyphicon-user"></i> 角色
                        </button>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="btn-group" role="group" aria-label="...">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
                            </span>
                        </div><!-- /input-group -->
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


<div class="modal fade" tabindex="-1" role="dialog" id="role-modal">
    <input type="hidden" id="saving-user-id">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">授予角色</h4>
            </div>
            <div class="modal-body" style="height: 500px;overflow-y: scroll;">
                <ul class="list-group" id="role-list">
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="doUserRoleSave()">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- /#wrapper -->
<%@include file="/WEB-INF/jsp/include/bodyfoot.jsp" %>

</body>
<script>
    var yui = new YUI('#my-yui')
    yui.customConfig = {
        head:['用户ID',"用户名","用户密码"],
        server:"/authority/user/list",
        checkBox:"single"
    }
    yui.create()

</script>
</html>



