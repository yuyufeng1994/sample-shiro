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
<div class="modal fade" tabindex="-1" role="dialog" id="permission-modal">
    <input type="hidden" id="saving-role-id">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">授予权限</h4>
            </div>
            <div class="modal-body" style="height: 500px;overflow-y: scroll;">
                <div id="permission_treeview" class=""></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="doRolePermissionSave()">保存</button>
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
        head: ['角色ID', "角色名", "展示"],
        server: "/authority/role/list",
        checkBox:"single"
    }
    yui.create()


    var $my_treeview;

    function permissionItem() {
        var id = yui_listSelectId();
        console.log(id)
        //加载权限树
        $GET("/authority/role/tree/" + id, function (result) {
            var treeData = result.data;
            $my_treeview = $('#permission_treeview').treeview({
                data: treeData,
                hierarchicalCheck: true,//级联勾选
                showCheckbox: true,
                state: {
                    checked: true,
                    // disabled: true,
                    expanded: true,
                    // selected: true
                },
                levels: 3,
                onNodeChecked: nodeChecked,
                onNodeUnchecked: nodeUnchecked,
                onNodeSelected: nodeSelect,
                onNodeUnselected: nodeUnselect
            });
            $("#permission-modal").modal()
        })

    }


    function doRolePermissionSave() {
        var selectedId = yui_listSelectId();
        var checkedPermissions = $my_treeview.treeview('getChecked');
        var rolePermissions = []
        for(var i = 0;i < checkedPermissions.length;i++){
            rolePermissions.push({
                roleId:selectedId,
                permissionId:checkedPermissions[i].dataId
            })
        }
        $POST_JSON("/authority/role/permissions",rolePermissions,function (res) {
            $("#permission-modal").modal("toggle")
        })
    }


    //级联选中所有子节点
    function checkAllSon(node) {
        $my_treeview.treeview('checkNode', node.nodeId, {silent: true});
        if (node.nodes != null && node.nodes.length > 0) {
            for (var i in node.nodes) {
                checkAllSon(node.nodes[i]);
            }
        }
    }

    var nodeCheckedSilent = false;

    function nodeChecked(event, node) {
        if (nodeCheckedSilent) {
            return;
        }
        nodeCheckedSilent = true;
        checkAllParent(node);
        checkAllSon(node);
        nodeCheckedSilent = false;
    }

    var nodeUncheckedSilent = false;

    function nodeUnchecked(event, node) {
        if (nodeUncheckedSilent)
            return;
        nodeUncheckedSilent = true;
        uncheckAllParent(node);
        uncheckAllSon(node);
        nodeUncheckedSilent = false;
    }

    //选中全部父节点
    function checkAllParent(node) {
        $my_treeview.treeview('checkNode', node.nodeId, {silent: true});
        var parentNode = $my_treeview.treeview('getParent', node.nodeId);
        if (!("nodeId" in parentNode)) {
            return;
        } else {
            checkAllParent(parentNode);
        }
    }

    //取消全部父节点
    function uncheckAllParent(node) {
        $my_treeview.treeview('uncheckNode', node.nodeId, {silent: true});
        var siblings = $my_treeview.treeview('getSiblings', node.nodeId);
        var parentNode = $my_treeview.treeview('getParent', node.nodeId);
        if (!("nodeId" in parentNode)) {
            return;
        }
        var isAllUnchecked = true;  //是否全部没选中
        for (var i in siblings) {
            if (siblings[i].state.checked) {
                isAllUnchecked = false;
                break;
            }
        }
        if (isAllUnchecked) {
            uncheckAllParent(parentNode);
        }

    }

    //级联选中所有子节点
    function checkAllSon(node) {
        $my_treeview.treeview('checkNode', node.nodeId, {silent: true});
        if (node.nodes != null && node.nodes.length > 0) {
            for (var i in node.nodes) {
                checkAllSon(node.nodes[i]);
            }
        }
    }

    //级联取消所有子节点
    function uncheckAllSon(node) {
        $my_treeview.treeview('uncheckNode', node.nodeId, {silent: true});
        if (node.nodes != null && node.nodes.length > 0) {
            for (var i in node.nodes) {
                uncheckAllSon(node.nodes[i]);
            }
        }
    }

    //获取选中的节点
    function nodeSelect() {
        var permission = $my_treeview.treeview('getSelected')[0];

    }

    function nodeUnselect() {
    }
    

</script>
</html>



