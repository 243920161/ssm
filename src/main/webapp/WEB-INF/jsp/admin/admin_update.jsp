<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../header.jsp" %>
<body>
<form class="layui-form" id="data-from">

    <input type="hidden" name="adminId" value="${admin.adminId}">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" required lay-verify="required" readonly="readonly"
                   placeholder="请输入用户名" class="layui-input" autocomplete="off" value="${admin.username}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">旧密码</label>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="required"
                   placeholder="请输入旧密码" class="layui-input" autocomplete="off">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-inline">
            <input type="password" name="new_password" required lay-verify="required"
                   placeholder="请输入新密码" class="layui-input" autocomplete="off">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">确认密码</label>
        <div class="layui-input-inline">
            <input type="password" name="confirm_password" required lay-verify="required"
                   placeholder="请确认新密码" class="layui-input" autocomplete="off">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-sm" lay-submit lay-filter="add" type="button">保存</button>
            <button type="reset" class="layui-btn layui-btn-sm layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<%@ include file="../footer.jsp" %>

<script>
    //监听提交
    layform.on('submit(add)', function () {
        $.ajax({
            url: '${ctx}/admin/update',
            type: 'post',
            dataType: 'json',
            data: $('#data-from').serialize(),
            success: function (res) {
                if (res.code === 200) {
                    layer.msg(res.msg, {
                        time: 1000
                    }, function () {
                        parent.table.reload();
                        parent.layer.closeAll();
                    });
                } else {
                    layer.alert(res.msg);
                }
            }
        })
    });
</script>
</body>
</html>
