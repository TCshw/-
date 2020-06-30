<%--
  Created by IntelliJ IDEA.
  User: 小红
  Date: 2020/5/25
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/layui.css" media="all">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>

    <script src="${pageContext.request.contextPath}/static/layui.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui.all.js"></script>
</head>
<body>

<form class="layui-form" id="updateBookFrom">
    <div class="layui-form-item">
        <label class="layui-form-label">书本编码</label>
        <div class="layui-input-inline">
            <input type="text" name="bookid" id="bookid" required lay-verify="bookid" readonly=""  placeholder="不可编辑"  autocomplete="open"
                   class="layui-input">
        </div>

    </div>
    <div class="layui-form-item" >
        <label class="layui-form-label">书名</label>
        <div class="layui-input-inline">
            <input type="text" name="bookname" id="bookname" required lay-verify="bookname" readonly=""  placeholder="不可编辑" autocomplete="open"
                   class="layui-input">
        </div>

    </div>

    <div class="layui-form-item" >
        <label class="layui-form-label">书本作者</label>
        <div class="layui-input-inline">
            <input type="text" name="bookauthor"  id="bookauthor" required lay-verify="bookauthor" readonly="" placeholder="不可编辑"  autocomplete="open"
                   class="layui-input">
        </div>

    </div>

    <div class="layui-form-item" >
        <label class="layui-form-label">书本出版社</label>
        <div class="layui-input-inline">
            <input type="text" name="bookpublisher"  id="bookpublisher" required lay-verify="bookpublisher" readonly="" placeholder="不可编辑"  autocomplete="open"
                   class="layui-input">
        </div>

    </div>

    <div class="layui-form-item" >
        <label class="layui-form-label">书本价格</label>
        <div class="layui-input-inline">
            <input type="text" name="bookprice"  id="bookprice" required lay-verify="required" readonly="" placeholder="stuinbook.bookprice" autocomplete="open"
                   class="layui-input">
        </div>

    </div>
    <div class="layui-form-item" >
        <label class="layui-form-label">书本数量</label>
        <div class="layui-input-inline">
            <input type="text" name="bookquantity"  id="bookquantity" required lay-verify="stuinbook.bookquantity" readonly="" placeholder="stuinbook.bookquantity" autocomplete="open"
                   class="layui-input">
        </div>

    </div>
    <div class="layui-form-item" >
        <label class="layui-form-label">订购人</label>
        <div class="layui-input-inline">
            <input type="text" name="studentname"  id="stuinbook.studentname" required lay-verify="stuinbook.studentname" readonly="" placeholder="stuinbook.studentname" autocomplete="open"
                   class="layui-input">
        </div>

    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-inline">
            <input type="text" name="bookstate" id="bookstate" required lay-verify="required"  placeholder="请更改状态"  autocomplete="open"
                   class="layui-input">
        </div>

    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">缺书数量</label>
        <div class="layui-input-inline">
            <input type="text" name="lackbooks" id="lackbooks" required lay-verify="required"  placeholder="请更改缺书数量"  autocomplete="open"
                   class="layui-input">
        </div>

    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn updateBook" type="submit" lay-submit lay-filter="updateBook">立即提交</button>
        </div>
    </div>

</form>

<script>
    layui.use('form', function() {
        var form = layui.form;
        var layer = layui.layer;


        form.on('submit(updateBook)', function (data) {
            console.log('111111');
        });

        $(document).ready(function(){

            $(function () {
                //从父层获取值，json是父层的全局js变量。eval是将该string类型的json串变为标准的json串
                var parent_json = eval('('+parent.json+')');
                console.log(parent_json);
                var bookid = parent_json.bookid;
                var bookname = parent_json.bookname;
                var bookauthor = parent_json.bookauthor;
                var bookpublisher = parent_json.bookpublisher;
                var bookprice = parent_json.bookprice;
                var bookquantity = parent_json.bookquantity;
                var studentname = parent_json.studentname;
                var bookstate = parent_json.bookstate;
                var lackbooks = parent_json.lackbooks;


                $('#bookid').val(bookid);
                $('#bookname').val(bookname);
                $('#bookauthor').val(bookauthor);
                $('#bookpublisher').val(bookpublisher);
                $('#bookprice').val(bookprice);
                $('#bookquantity').val(bookquantity);
                $('#studentname').val(studentname);
                $('#bookstate').val(bookstate);
                $('#lackbooks').val(lackbooks);
            });





            $('.updateBook').click(function(){
                console.log('22222');
                var bookid = $('#bookid').val();
                var bookname = $('#bookname').val();
                var bookauthor = $('#bookauthor').val();
                var bookpublisher = $('#bookpublisher').val();
                var bookprice = $('#bookprice').val();
                var bookquantity = $('#bookquantity').val();
                var studentname= $('#studentname').val();
                var bookstate = $('#bookstate').val();
                var lackbooks = $('#lackbooks').val();
                $.ajax({
                    type:"post",//get delete update
                    url:"<%=basePath%>admin/UpdateBook",//数据接口
                    data:{ //数据
                        'bookid':bookid,
                        'bookname':bookname,
                        'bookauthor':bookauthor,
                        'bookpublisher':bookpublisher,
                        'bookprice':bookprice,
                        'bookquantity':bookquantity,
                        'studentname':studentname,
                        'bookstate':bookstate,
                        'lackbooks':lackbooks
                    },

                    success:function(data){
                        if (data.count > 0) {
                            layer.msg('修改成功');
                            parent.layer.close();//关闭当前弹窗
                            window.parent.location.reload();//父页面刷新
                        }
                    }
                });
                return false;


            });

        });

    });
</script>

</body>
</html>
