/**
 * author yuyufeng
 * require jquery
 * 2018年2月12日 14:42:07
 **/

//构造函数
function YUI(domContent) {
    this.domContent = domContent
    this.customConfig = {}
}

//全局变量
var YUI_config

YUI.prototype = {
    constructor: YUI,

    //初始化配置
    _initConfig: function () {
        YUI_config = this.customConfig
    },

    //初始化 DOM
    _initDom: function () {
        const domContent = this.domContent
        $domContent = $(domContent)
        $domTbody = $("<table id='yui-data-table' class='table table-striped'><thead id='yui-data-head'></thead><tbody id='yui-data-list'></tbody></table>")
        $domNavPage = $("<nav aria-label='Page navigation'><ul class='pagination' id='yui_navi-li'></ul></nav>")
        $domContent.append($domTbody)
        $domContent.append($domNavPage)
    },
    _initTable: function () {
        yui_dataPage(1)
    },

    //绑定事件
    _bindEvent: function () {

    },

    //创建
    create: function () {
        //初始化配置信息
        this._initConfig();

        //初始化DOM
        this._initDom();

        //加载table数据
        this._initTable()

    }

}


function yui_dataPage(pageNum) {
    $.get(YUI_config.server + "?pageNum=" + pageNum, function (res) {
        //body标题
        var headDataByList = [];
        //分页编码
        var liStr = "";
        if (res.hasPreviousPage) {
            liStr += "<li class='previous'><a href='javascript:yui_dataPage(" + res.prePage + ")' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
        } else {
            liStr += "<li class='disabled previous'><a  href='##' aria-label='Previous' aria-hidden='true' disabled='disabled' ><span>&laquo;</span></a></li>";
        }
        for (var i = 0; i < res.navigatepageNums.length; i++) {
            if (res.pageNum == res.navigatepageNums[i]) {
                liStr += ("<li class='active'><a href='javascript:yui_dataPage(" + res.navigatepageNums[i] + ")'>" + res.navigatepageNums[i] + "</a></li>")
            } else {
                liStr += ("<li><a href='javascript:yui_dataPage(" + res.navigatepageNums[i] + ")'>" + res.navigatepageNums[i] + "</a></li>")
            }
        }
        if (res.hasNextPage) {
            liStr += "<li class='next'><a href='javascript:yui_dataPage(" + res.nextPage + ")' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
        } else {
            liStr += "<li class='disabled next'><a href='##' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
        }
        $("#yui_navi-li").html(liStr);

        //数据body
        var list = res.list;
        var dataList = "";
        for (var i = 0; i < res.list.length; i++) {
            var dataListItem = "<tr><td><div class='checkbox'><label><input type='checkbox' onchange='yui_selectSingle(this)'></label></div></td>";
            var jsonItem = res.list[i];
            for (var key in jsonItem) {
                if (i == 0) {
                    //获取标题
                    headDataByList.push(key);
                }
                dataListItem += "<td>" + jsonItem[key] + "</td>"
            }
            dataListItem += "</tr>";
            dataList += dataListItem
        }
        $("#yui-data-list").html(dataList)

        //数据head
        var headData = YUI_config.head
        if (headData == null || headData.length <= 0) {
            headData = headDataByList
        }

        var checkBoxName = '单选'
        if ("single" != YUI_config.checkBox) {
            checkBoxName = "全选"
        }

        var dataHead = "<tr><th><a href='javascript:yui_selectAll()' id='btn-select-all'>"+checkBoxName+"</a></th>";
        for (var i = 0; i < headData.length; i++) {
            dataHead += "<th>" + headData[i] + "</th>"
        }
        dataHead += '</tr>';
        $("#yui-data-head").html(dataHead);
    })
}

//全选操作
var yui_inputBoxChecked = false;

function yui_selectAll() {
    if (YUI_config.checkBox == 'single') {
        return;
    }

    var checkedValue;
    if (yui_inputBoxChecked) {
        checkedValue = false
        yui_inputBoxChecked = false;
        $("#btn-select-all").text("全选")
    } else {
        $("#btn-select-all").text("取消")
        checkedValue = true
        yui_inputBoxChecked = true;
    }

    $("#yui-data-list").children().each(function () {
        var $this = $(this)
        $this.find("input").prop('checked', checkedValue);
    })
}

function yui_selectSingle(mythis) {
    if (YUI_config.checkBox != 'single') {
        return;
    }
    //单选的时候取消其它选中节点
    $this = $(mythis)
    $this.parent().parent().parent().parent().siblings().each(function () {
        var $trThis = $(this)
        $trThis.find("input").prop('checked', false);
    })
}


//获取选中的数据
function yui_listSelectIds() {
    var ids = new Array();
    $("#yui-data-list").children().each(function () {
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
    var ids = yui_listSelectIds();
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
