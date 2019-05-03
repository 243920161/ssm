<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../header.jsp" %>
<body>

<form class="layui-form">
    <div class="layui-input-inline" style="width: 250px;">
        <input type="text" name="username" id="username" placeholder="请输入用户名称" class="layui-input" autocomplete="off">
    </div>
    <div class="layui-input-inline" style="width: 60px;">
        <button class="layui-btn" lay-submit lay-filter="search" type="button"><i
                class="layui-icon">&#xe615;</i>搜索
        </button>
    </div>
</form>

<table id="data-table" lay-filter="filter"></table>

<script type="text/html" id="toolbar">
    <button lay-event="add" class="layui-btn layui-btn-sm">
        <i class="layui-icon">&#xe608;</i>添加
    </button>
    <button lay-event="delAll" class="layui-btn layui-btn-sm layui-btn-danger">
        <i class="layui-icon">&#xe640;</i>批量删除
    </button>
</script>

<script type="text/html" id="tool">
    <a lay-event="update" title="编辑" href="javascript:"><i class="layui-icon">&#xe642;</i></a>
    <a lay-event="del" title="删除" href="javascript:"> <i class="layui-icon">&#xe640;</i></a>
</script>

<%@ include file="../footer.jsp" %>
<script>

    url_list = '${ctx}/admin/list';
    url_add = '${ctx}/admin/add';
    url_update = '${ctx}/admin/update';
    url_del = '${ctx}/admin/del';
    url_delAll = '${ctx}/admin/delAll';

    // 数据表格
    table = laytable.render({
        elem: '#data-table',
        url: url_list,  //数据接口
        cols: [[ //表头
            {field: 'adminId', title: 'ID', type: 'checkbox'},
            {field: 'username', title: '用户名'},
            {fixed: 'right', toolbar: '#tool'}
        ]],
        toolbar: '#toolbar'
    });

    // 搜索按钮
    layform.on('submit(search)', function () {
        var username = $('#username').val();
        if (username) {
            table.reload({
                where: {
                    username: username
                }
            });
        } else {
            // table.reload();
            location.href = '${ctx}/admin';
        }
    });

    // 表头工具栏
    laytable.on('toolbar(filter)', function (obj) {
        switch (obj.event) {
            case 'add':
                x_admin_show('添加管理员', url_add);
                break;
            case 'delAll':
                var data = laytable.checkStatus(obj.config.id).data;
                if (data.length > 0) {
                    layer.confirm('确认删除选中数据?', function (index) {
                        var ids = new Array();
                        for (var i in data) {
                            ids.push(data[i].adminId);
                        }
                        $.ajax({
                            url: url_delAll,
                            contentType: "application/json; charset=UTF-8",
                            type: 'post',
                            dateType: 'json',
                            data: JSON.stringify(ids),
                            success: function (res) {
                                if (res.code === 200) {
                                    layer.msg(res.msg);
                                    table.reload();
                                } else {
                                    layer.alert(res.msg)
                                }
                            }
                        })
                    })
                }
                break;
        }
    });

    //行数据操作
    laytable.on('tool(filter)', function (obj) {
        switch (obj.event) {
            case 'update':
                x_admin_show('编辑管理员', url_update + '/' + obj.data.adminId);
                break;
            case 'del':
                layer.confirm('确认删除该行数据?', function () {
                    $.ajax({
                        url: url_del + '/' + obj.data.adminId,
                        type: 'get',
                        dateType: 'json',
                        success: function (res) {
                            if (res.code === 200) {
                                layer.msg(res.msg);
                                table.reload();
                            } else {
                                layer.alert(res.msg)
                            }
                        }
                    });
                });
                break;
        }
    });
</script>
</body>
</html>
