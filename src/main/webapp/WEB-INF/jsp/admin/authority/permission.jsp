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
                <div class="col-sm-2">
                    <div id="permission_treeview" class=""></div>
                </div>
                <div class="col-sm-2">
                    <button onclick="checkAll()">全选</button>
                    <button onclick="collapseAll()">全部展开</button>
                    <button onclick="getChecked()">获取选中</button>
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
    $.get("/authority/permission/tree",function (result) {
        var treeData =  result.data;
        $my_treeview = $('#permission_treeview').treeview({
            data: treeData,
            hierarchicalCheck: true,//级联勾选
//            showCheckbox: true,
            state: {
                checked: true,
                // disabled: true,
                expanded: true,
                // selected: true
            },
            onNodeChecked: nodeChecked,
            onNodeUnchecked: nodeUnchecked,
            onNodeSelected:nodeSelect
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
    function nodeSelect(node) {
        var result = $my_treeview.treeview('getSelected');
        console.log(result)
    }

</script>
</html>



