<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>XXX-管理系统</title>
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/xadmin.css">
</head>
<style>
    h1 {
        font-family: "华文新魏";
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        font-size: 80px;
        color: #009688;
    }
</style>
<body>

<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="${ctx}/index">XXX-管理系统</a>
    </div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">${sessionScope.admin.username}</a>
            <dl class="layui-nav-child">
                <dd>
                    <a href="${ctx}/logout">退出</a>
                </dd>
            </dl>
        </li>
    </ul>
</div>
<!-- 顶部结束 -->

<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">

            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b4;</i>
                    <cite>信息管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${ctx}/member">
                            <i class="iconfont">&#xe6a2;</i>
                            <cite>成员信息</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="${ctx}/department">
                            <i class="iconfont">&#xe6a2;</i>
                            <cite>部门信息</cite>
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b4;</i>
                    <cite>系统设置</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${ctx}/admin">
                            <i class="iconfont">&#xe6a2;</i>
                            <cite>帐号管理</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="${ctx}/about" onclick="about()">
                            <i class="iconfont">&#xe6a2;</i>
                            <cite>关于系统</cite>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- 左侧菜单结束 -->

<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab " lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>主页</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show" id="main">
                <h1>XXX管理系统</h1>
            </div>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>