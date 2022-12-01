<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- prefix是前缀 引用JSTL标签库 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 动态获取context --%>
<% request.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>简历管理-专业技能</title>
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
                            <h2>专业技能</h2>
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
                                    <th>级别</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%-- 循环遍历从后台拿到的skills --%>
                                <c:forEach items="${skills}" var="skill">
                                    <tr>
                                        <td>${skill.name}</td>
                                        <td>${skill.levelName}</td>
                                        <td>
                                            <button type="button" class="btn bg-blue waves-effect btn-xs"
                                                    onclick="edit(${skill.JSON})">
                                                <i class="material-icons">edit</i>
                                                <span>编辑</span>
                                            </button>
                                            <button type="button" class="btn bg-pink waves-effect btn-xs"
                                                    onclick="remove(${skill.JSON})">
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
                    <h4 class="modal-title">添加专业技能</h4>
                </div>
                <div class="modal-body">
                    <form id="save-form-data" class="form-validation">
                        <!-- form的reset方法好像无法对应type为hidden的控件 所以转换了下思维 以这种方式代替了 -->
                        <input type="text" style="display: none" name="id" />
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
                                <label for="level">级别</label>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                                <div class="form-group">
                                    <select id="level" name="level">
                                        <option value="0">了解</option>
                                        <option value="1">熟悉</option>
                                        <option value="2">掌握</option>
                                        <option value="3">精通</option>
                                    </select>
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
        $(".menu .list .skill").addClass("active");

        addValidatorRules('.form-validation');

        // 将常用的弹框和表单给取出来
        const $addFormBox = $('#add-form-box');
        const $addForm = $('#add-form-box form');

        function add() {
            // 利用原生JS的表单DOM对象的reset方法 简单实现表单重置
            $addForm[0].reset();
            // 弹框
            $addFormBox.modal();
        }

        function edit(skill) {
            // 编辑肯定也需要先清空，可以直接调用add方法先清空再弹框
            add();
            // 遍历传进来的对象，依次设值
            for (const key in skill) {
                // 通过属性选择器 选择name=key的空间
                $addForm.find("[name='" + key +"']").val(skill[key]);
            }
        }

        function save() {
            // 获得url
            const requestUrl = "${ctx}/admin/skill/save";
            const responseUrl = "${ctx}/admin/skill";
            // 获得表单数据
            const id = $('#save-form-data [name="id"]').val();
            const name = $('#save-form-data [name="name"]').val();
            const level = $('#save-form-data [name="level"]').val();
            const formData = {
                "id": id,
                "name": name,
                "level": level
            };
            // 通过ajax调用后台
            sendData(requestUrl, JSON.stringify(formData), responseUrl);
        }

        function remove(skill) {
            swal({
                title: "你确定？",
                text: '你确定要删除【' + skill.name + '】？',
                icon: 'warning',
                dangerMode: true,
                buttons: {
                    cancel: '取消',
                    confirm: '确定'
                }
            }).then(willDelete => {
                if (!willDelete) return
                // 获得url
                const requestUrl = "${ctx}/admin/skill/remove";
                const responseUrl = "${ctx}/admin/skill";
                // 获得表单数据
                const formData = {"id": skill.id};
                // 通过ajax调用后台
                sendData(requestUrl, JSON.stringify(formData), responseUrl);
            })
        }
    </script>
</body>

</html>
