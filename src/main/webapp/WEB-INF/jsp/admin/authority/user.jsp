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
        <div id="operation-result">
            <div class="alert alert-success alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <strong>操作成功!</strong> Better check yourself, you're not looking too good.
            </div>
        </div>


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
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th><a href="javascript:selectAll()" id="btn-select-all">单选</a></th>
                            <th>ID</th>
                            <th>用户名</th>
                            <th>密码</th>
                            <%--<th>操作</th>--%>
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
    //修改用户角色
    function doUserRoleSave() {
        var savingUserId = $("#saving-user-id").val();
        var savingUserRoles = [];
        $("#role-list").find("input").each(function () {
            var $this = $(this)
            if ($this.is(":checked")) {
                //塞入ID
                savingUserRoles.push($(this).val())
            }
        })
        $.post("/authority/user/role-edit/" + savingUserId, {roleIds: savingUserRoles}, function (res) {
            $("#role-modal").modal("toggle")
        })


    }

    //加载分页数据
    var dataPageUrl = "/authority/user/list"

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
                str += "<tr><td><div class='checkbox'><label><input type='checkbox' onchange='selectSingle(this)'></label></div></td><td>" + list[i].userId + "</td><td>" + list[i].userName + "</td><td>******</td></tr>"
            }
            $("#data-list").html(str)
        })
    }

    //全选操作
    var inputBoxChecked = false;

    function selectAll() {
        return;
        var checkedValue;
        if (inputBoxChecked) {
            checkedValue = false
            inputBoxChecked = false;
            $("#btn-select-all").text("全选")
        } else {
            $("#btn-select-all").text("取消")
            checkedValue = true
            inputBoxChecked = true;
        }

        $("#data-list").children().each(function () {
            var $this = $(this)
            $this.find("input").prop('checked', checkedValue);
        })
    }

    function selectSingle(mythis) {
        //单选的时候取消其它选中节点
        $this = $(mythis)
        $this.parent().parent().parent().parent().siblings().each(function () {
            var $trThis = $(this)
            $trThis.find("input").prop('checked', false);
        })
    }


    //获取选中的数据
    function listSelectIds() {
        var ids = new Array();
        $("#data-list").children().each(function () {
            var $this = $(this)
            if ($this.find("input").is(":checked")) {
                //塞入ID
                ids.push($this.find("td:eq(1)").text())
            }
        })
        if (ids.length == 0) {
            alert("请选择一项")
            throw '请选择一项'
        }
        return ids;
    }

    function addItem() {
        console.log("增加")
    }

    function deleteItem() {
        var ids = listSelectIds();
        console.log(ids)
    }

    function editItem() {
        var ids = listSelectIds();
        console.log(ids)
    }

    function roleItem() {
        var ids = listSelectIds();
        if (ids.length != 1) {
            alert("此操作只能选择一项")
            throw "此操作只能选择一项"
        }
        //正在修改的userId
        $("#saving-user-id").val(ids[0])
        //角色信息
        $.get("/authority/role/list/" + ids[0], function (res) {
            var str = "";
            for (var i = 0; i < res.length; i++) {
                if (res[i].roleStatus) {
                    str += "<li class='list-group-item'><div class='checkbox'><label><input type='checkbox' checked ' value='" + res[i].roleId + "'>" + res[i].roleName + "</label></div></li>";
                } else {
                    str += "<li class='list-group-item'><div class='checkbox'><label><input type='checkbox'  value='" + res[i].roleId + "' >" + res[i].roleName + "</label></div></li>";
                }

            }
            $("#role-list").html(str)
        })
        $("#role-modal").modal()
    }


    //加载第一页
    dataPage(1);


</script>
</html>



