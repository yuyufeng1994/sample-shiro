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
                    <h1 class="page-header">权限管理</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <div class="row">
                <div class="col-sm-4">
                    <div id="permission_treeview" class=""></div>
                </div>
                <div class="col-sm-6">
                    <h3 align="center">当前选中节点信息</h3>
                    <hr/>
                    <form class="form-horizontal">
                        <input type="hidden" id="nodeId">
                        <div class="form-group">
                            <label for="parentId" class="col-sm-2 control-label">父节点ID</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="parentId" placeholder="" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="permissionId" class="col-sm-2 control-label">权限ID</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="permissionId" placeholder="" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="permissionName" class="col-sm-2 control-label">权限key</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="permissionName" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="permissionNotes" class="col-sm-2 control-label">权限描述</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="permissionNotes" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-2">
                                <button type="button" class="btn btn-primary" onclick="editNode()">保存修改</button>
                            </div>

                            <div class="col-sm-2">
                                <button type="button" class="btn btn-info" onclick="addNode()">增加节点</button>
                            </div>

                            <div class="col-sm-2">
                                <button type="button" class="btn btn-danger" onclick="removeNode()">删除节点</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>

<!-- /#wrapper -->
<%@include file="/WEB-INF/jsp/include/bodyfoot.jsp" %>

</body>
<script>

    //加载权限树
    var $my_treeview;
    $GET("/authority/permission/tree", function (result) {
        var treeData = result.data;
        $my_treeview = $('#permission_treeview').treeview({
            data: treeData,
            hierarchicalCheck: true,//级联勾选
//            showCheckbox: true,
            state: {
//                checked: true,
                // disabled: true,
                expanded: true,
                // selected: true
            },
            levels: 3,
            onNodeSelected: nodeSelect,
            onNodeUnselected: nodeUnselect
        });
    })

    function checkAll() {
        $my_treeview.treeview('checkAll', {silent: $('#chk-check-silent').is(':checked')});
    }

    function collapseAll() {
        $my_treeview.treeview('collapseAll', {silent: true});
    }

    function getChecked() {
        var result = $my_treeview.treeview('getChecked');
        console.log(result)
    }



    //获取选中的节点
    function nodeSelect() {
        var permission = $my_treeview.treeview('getSelected')[0];
        $("#nodeId").val(permission.nodeId);
        $("#parentId").val(permission.dataParent);
        $("#permissionId").val(permission.dataId);
        $("#permissionNotes").val(permission.text)
        $("#permissionName").val(permission.name);
    }

    function nodeUnselect() {
        $("#nodeId").val("")
        $("#parentId").val("");
        $("#permissionId").val("");
        $("#permissionNotes").val("")
        $("#permissionName").val("");
    }

    //删除选中节点
    function removeNode() {
        if (!yui_comfirm("确定要删除吗？")) return;
        var selectedNodes = $my_treeview.treeview('getSelected');
        if (selectedNodes.length == 0) {
            alert("请先选中节点")
            throw "请先选中节点"
        }

        if (selectedNodes[0].parentId != null) {
            $GET("/authority/permission/delete/"+selectedNodes[0].dataId,function () {
                $my_treeview.treeview("deleteNode", selectedNodes[0].nodeId);
            })
        }

    }


    /**
     * 增加节点
     */
    function addNode() {
        //得到选择的节点
        var nodeDatas = $my_treeview.treeview('getSelected');
        if (nodeDatas.length == 0) {
            alert("请先选中节点")
            throw "请先选中节点"
        }
        var nodeData = nodeDatas[0]
        var dataAdd = {
            dataParent: nodeData.dataId,
            text: 'undefine',
            name: 'undefine',
            state: {
                selected: true
            }
        };
        $POST_JSON("/authority/permission/add", {
            parentId: dataAdd.dataParent,
            permissionName: dataAdd.text,
            permissionNotes: dataAdd.name

        }, function (res) {
            console.log(res)
            dataAdd.dataId = res.data.permissionId
            //获取数据，添加到树中
            $my_treeview.treeview("addNode", [nodeData.nodeId, {node: dataAdd}]);
            nodeData.state.expanded = true;
            nodeData.state.selected = false;
            $my_treeview.treeview("editNode", [nodeData.nodeId, {node: nodeData}]);
            nodeSelect()
        })
    }

    function editNode() {
        var nodeDatas = $my_treeview.treeview('getSelected');
        if (nodeDatas.length == 0) {
            alert("请先选中节点")
            throw "请先选中节点"
        }
        var nodeData = nodeDatas[0]
        var dataEdit = nodeData;
        dataEdit.text = $("#permissionNotes").val()
        dataEdit.name = $("#permissionName").val();
        $POST_JSON("/authority/permission/update", {
            permissionId: $("#permissionId").val(),
            permissionName: $("#permissionName").val(),
            permissionNotes: $("#permissionNotes").val()
        }, function () {
            $my_treeview.treeview("editNode", [nodeData.nodeId, {node: dataEdit}]);
        })
    }
</script>
</html>



