<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 动态获取context --%>
<% request.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>简历管理-网站信息</title>
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
                            <h2>网站信息</h2>
                        </div>
                        <div class="body">
                            <form id="save-form-data" class="form-validation">
                                <input type="hidden" name="id" value="${website.id}">
                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                        <label for="footer">底部</label>
                                    </div>
                                    <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <textarea name="footer" maxlength="1000"
                                                          id="footer" cols="30" rows="5"
                                                          class="form-control no-resize"
                                                          placeholder="底部">${website.footer}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-offset-2 col-md-offset-2 col-sm-offset-3 col-xs-offset-3">
                                        <button class="btn btn-primary waves-effect m-l-15"
                                                onclick="save()" type="button">保存</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@include file="common/footer.jsp"%>
    <script>
        // 动态设置active类
        $(".menu .list .website").addClass("active");

        function save() {
            // 获得url
            const requestUrl = "${ctx}/admin/website/save";
            const responseUrl = "${ctx}/admin/website";
            // 获得表单数据
            const footer = $('#save-form-data #footer').val();
            const id = $('#save-form-data [name="id"]').val();
            const formData = {
                "id": id,
                "footer": footer
            };
            // 通过ajax调用后台
            sendData(requestUrl, JSON.stringify(formData), responseUrl);
        }
    </script>
</body>

</html>
