<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- prefix是前缀 引用JSTL标签库 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 动态获取context --%>
<% request.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>简历管理-个人信息</title>
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
                            <h2>个人信息</h2>
                        </div>
                        <div class="body">
                            <form action="${ctx}/admin/user/save" class="form-validation" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <input type="hidden" name="id" value="${user.id}">
                                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                        <label>头像</label>
                                    </div>
                                    <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                                        <div class="form-group">
                                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                                <input type="text" style="display: none" name="photo" value="${user.photo}" />
                                                <div class="fileinput-new thumbnail">
                                                    <c:choose>
                                                        <c:when test="${empty user.photo}">
                                                            <img src="${ctx}/asset/admin/img/noimage.png" alt="">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="${ctx}${user.photo}" alt="">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail"></div>
                                                <i class="material-icons clear fileinput-exists" data-dismiss="fileinput">close</i>
                                                <input type="file" name="photoFile" accept="image/*">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                        <label for="email">邮箱</label>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-9 col-xs-9">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="email" id="email" name="email" maxlength="50" class="form-control"
                                                       placeholder="邮箱" value="${user.email}"
                                                       disabled>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                        <label for="name">姓名</label>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-9 col-xs-9">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" id="name" name="name" maxlength="20" class="form-control"
                                                       placeholder="姓名" value="${user.name}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                        <label for="job">工作</label>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-9 col-xs-9">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" id="job" name="job" maxlength="20" class="form-control"
                                                       placeholder="工作" value="${user.job}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                        <label for="phone">电话</label>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-9 col-xs-9">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" id="phone" name="phone" maxlength="20" class="form-control"
                                                       placeholder="电话" value="${user.phone}">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                        <label for="trait">个人特质</label>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-9 col-xs-9">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input id="trait" name="trait" maxlength="100" type="text" class="form-control" data-role="tagsinput"
                                                       placeholder="多个个人特质之间用英文逗号或回车隔开"
                                                       value="${user.trait}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                        <label for="interests">兴趣爱好</label>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-9 col-xs-9">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input id="interests" name="interests" maxlength="100" type="text" class="form-control" data-role="tagsinput"
                                                       placeholder="多个兴趣爱好之间用英文逗号或回车隔开"
                                                       value="${user.interests}">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                        <label for="birthday">生日</label>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-9 col-xs-9">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="date" id="birthday" name="birthday"
                                                       value="<fmt:formatDate value='${user.birthday}' pattern='yyyy-MM-dd'></fmt:formatDate>"
                                                       class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                        <label for="address">住址</label>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-9 col-xs-9">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" id="address" name="address" maxlength="100" class="form-control"
                                                       placeholder="住址" value="${user.address}">
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
                                                <textarea name="intro" maxlength="1000" id="intro" cols="30" rows="5" class="form-control no-resize"
                                                          placeholder="简介">${user.intro}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-offset-2 col-md-offset-2 col-sm-offset-3 col-xs-offset-3">
                                        <button class="btn btn-primary waves-effect m-l-15" type="submit">保存</button>
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
        $(".menu .list .user").addClass("active");

        addValidatorRules('.form-validation');
    </script>
</body>

</html>
