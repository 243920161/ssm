<%--
  Created by IntelliJ IDEA.
  User: 林
  Date: 2018/11/7/007
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form class="layui-form" id="data-form">
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <img id="img" src="${ctx}/images/no.png" width="100px"/>
                <input type="text" name="img" id="input-img" lay-verify="requiredFile"/>
            </div>
        </div>
        <hr/>
        <button type="button" class="layui-btn layui-btn-sm" id="upload">
            <i class="layui-icon">&#xe67c;</i>上传图片
        </button>
    </form>
<%@ include file="footer.jsp" %>

<script type="text/javascript">
    layupload.render({
        elem: '#upload',
        accept: 'images',
        acceptMime: 'image/*',
        field: 'uploadFile',
        url: '${ctx}/fileUpload',
        done: function(r) {
            console.log(r);
            if(r.code == 0) {
                layer.msg(r.msg);
                $('#img').attr('src', r.data);
                $('#input-img').val(r.data);
                $('#img').attr('width', '200px');
            } else {
                layer.alert(r.msg);
            }
        }
    });
</script>
</body>
</html>
