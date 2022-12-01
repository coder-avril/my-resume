<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- prefix是前缀 引用JSTL标签库 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 动态获取context --%>
<% request.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>简历管理-获奖成就</title>
    <%@include file="common/header.jsp"%>
</head>

<body class="theme-blue">
    <%@include file="common/body.jsp"%>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>获奖成就</h2>
                        </div>
                        <div class="body table-responsive">
                            <div class="menus">
                                <div class="buttons">
                                    <button type="button" class="btn bg-blue waves-effect btn-sm"
                                            onclick="add()">
                                        <i class="material-icons">add</i>
                                        <span>添加</span>
                                    </button>
                                </div>
                            </div>

                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                <tr>
                                    <th>名称</th>
                                    <th>图片</th>
                                    <th>简介</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${awards}" var="award">
                                <tr>
                                    <td>${award.name}</td>
                                    <td><img src="${ctx}${award.image}" alt=""></td>
                                    <td>${award.intro}</td>
                                    <td>
                                        <button type="button" class="btn bg-blue waves-effect btn-xs"
                                                onclick="edit(${award.JSON})">
                                            <i class="material-icons">edit</i>
                                            <span>编辑</span>
                                        </button>
                                        <button type="button" class="btn bg-pink waves-effect btn-xs"
                                                onclick="remove(${award.JSON})">
                                            <i class="material-icons">delete</i>
                                            <span>删除</span>
                                        </button>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--  add-form-box  -->
    <div class="modal fade" id="add-form-box" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">添加获奖成就</h4>
                </div>
                <div class="modal-body">
                    <form id="save-form-data" class="form-validation" method="post" enctype="multipart/form-data">
                        <!-- form的reset方法好像无法对应type为hidden的控件 所以转换了下思维 以这种方式代替了 -->
                        <input type="text" style="display: none" name="id" />
                        <input type="text" style="display: none" name="image" />
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                <label>图片</label>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                                <div class="form-group">
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <div class="fileinput-new thumbnail">
                                            <img src="${ctx}/asset/admin/img/noimage.png" alt="">
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail"></div>
                                        <i class="material-icons clear fileinput-exists" data-dismiss="fileinput">close</i>
                                        <input type="file" id="imageFile" name="imageFile" accept="image/*">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                <label for="name">名称</label>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="text" id="name" name="name" maxlength="20" class="form-control"
                                               placeholder="名称"
                                               required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                <label for="intro">简介</label>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                                <div class="form-group">
                                    <div class="form-line">
                                        <textarea name="intro" maxlength="1000" id="intro" cols="30" rows="5" class="form-control no-resize" placeholder="简介"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-offset-2 col-md-offset-2 col-sm-offset-3 col-xs-offset-3">
                                <button class="btn btn-primary waves-effect m-l-15" type="button" onclick="save()">保存</button>
                                <button class="btn btn-info waves-effect m-l-15" data-dismiss="modal">关闭</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%@include file="common/footer.jsp"%>
    <script>
        // 动态设置active类
        $(".menu .list .award").addClass("active");

        addValidatorRules('.form-validation')

        // 将常用的弹框和表单给取出来
        const $addFormBox = $('#add-form-box');
        const $addForm = $('#add-form-box form');
        const $img = $addForm.find(".fileinput .thumbnail img");

        function add() {
            // 利用原生JS的表单DOM对象的reset方法 简单实现表单重置
            $addForm[0].reset();
            // 图片重置
            $img.attr("src", "${ctx}" + "/asset/admin/img/noimage.png");
            // 弹框
            $addFormBox.modal();
        }

        function edit(award) {
            // 编辑肯定也需要先清空，可以直接调用add方法先清空再弹框
            add();
            // 遍历传进来的对象，依次设值
            for (const key in award) {
                // 通过属性选择器 选择name=key的控件
                const $input = $addForm.find("[name='" + key +"']");
                // 图片需要展示 直接显示路径的字符串是没有意义的 所以可以跳过
                if ($input.attr("type") === "file") continue;
                $input.val(award[key]);
            }
            // 重新设置图片
            if (award.image) { // 只有图片路径有值的情况下才替换"
                $img.attr("src", "${ctx}" + award.image);
            }
        }

        function save() {
            // 获得url
            const requestUrl = "${ctx}/admin/award/save";
            const responseUrl = "${ctx}/admin/award";
            // 获得表单数据
            const formData = new FormData($('#save-form-data')[0]);
            // 通过ajax调用后台
            sendDataWithFile(requestUrl, formData, responseUrl);
        }

        function remove(award) {
            swal({
                title: "你确定？",
                text: '你确定要删除【' + award.name + '】？',
                icon: 'warning',
                dangerMode: true,
                buttons: {
                    cancel: '取消',
                    confirm: '确定'
                }
            }).then(willDelete => {
                if (!willDelete) return
                // 获得url
                const requestUrl = "${ctx}/admin/award/remove";
                const responseUrl = "${ctx}/admin/award";
                // 获得表单数据
                const formData = {"id": award.id, "image": award.image};
                // 通过ajax调用后台
                sendData(requestUrl, JSON.stringify(formData), responseUrl);
            })
        }
    </script>
</body>

</html>
