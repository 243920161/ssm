<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>XXX-管理系统登录</title>
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/xadmin.css">
</head>

<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">XXX-管理系统登录</div>
    <div id="darkbannerwrap"></div>
    <form method="post" class="layui-form" id="data-from">
        <input name="username" placeholder="用户名" type="text" lay-verify="required" class="layui-input" autocomplete="off">
        <hr class="hr15">
        <input name="password" lay-verify="required" placeholder="密码" type="password" class="layui-input" autocomplete="off">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="button">
        <hr class="hr20">
    </form>
</div>

<%@ include file="footer.jsp" %>
<script>
//监听提交
layform.on('submit(login)', function () {
    $.ajax({
        url: '${ctx}/login',
        type: 'post',
        dataType: 'json',
        data: $('#data-from').serialize(),
        success: function (res) {
            if (res.code === 200){
                window.location.href = '${ctx}/index';
            }else{
                layer.msg(res.msg);
            }
        }
    })
});
</script>


</body>
</html>