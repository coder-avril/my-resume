<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- prefix是前缀 引用JSTL标签库 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 动态获取context --%>
<% request.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>简历管理-留言信息</title>
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
                            <h2>留言信息</h2>
                        </div>
                        <form action="${ctx}/admin/contact" method="get" id="list-form">
                            <input type="hidden" name="pageNo" value="${searchInfo.pageNo}">
                            <div class="body table-responsive">
                                <div class="menus">
                                    <div class="search-box input-group">
                                        <div class="form-line input">
                                            <input type="date" name="beginDay" value="<fmt:formatDate value="${searchInfo.beginDay}" pattern="yyyy-MM-dd"/>" class="form-control" placeholder="开始日期">
                                        </div>
                                        <div class="form-line input">
                                            <input type="date" name="endDay" value="<fmt:formatDate value="${searchInfo.endDay}" pattern="yyyy-MM-dd"/>" class="form-control" placeholder="结束日期">
                                        </div>
                                        <span class="input-group-addon">
                                            <i class="material-icons">search</i>
                                        </span>
                                        <div class="form-line keyword">
                                            <input type="text" value="${searchInfo.keyword}" class="form-control" placeholder="主题、内容等">
                                        </div>
                                        <button type="submit" class="btn bg-blue waves-effect btn-sm">搜索</button>
                                    </div>
                                </div>

                                <table class="table table-bordered table-hover table-striped">
                                    <thead>
                                    <tr>
                                        <th>名称</th>
                                        <th>邮箱</th>
                                        <th>日期</th>
                                        <th>主题</th>
                                        <th>内容</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${contacts}" var="contact">
                                    <tr>
                                        <td>${contact.name}</td>
                                        <td>${contact.email}</td>
                                        <td><fmt:formatDate value="${contact.createdTime}" pattern="yyyy-MM-dd"/></td>
                                        <td>${contact.subject}</td>
                                        <td>详细内容请点击查看</td>
                                        <td>
                                            <button type="button" class="btn bg-blue waves-effect btn-xs"
                                                    onclick="view(${contact.JSON})">
                                                <i class="material-icons">edit</i>
                                                <span>查看</span>
                                            </button>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                                <div class="page-box">
                                    <div class="page-size">
                                        共${totalCount}条${totalPages}页，每页
                                        <select name="pageSize">
                                            <option value="10">10</option>
                                            <option value="20">20</option>
                                            <option value="50">50</option>
                                        </select>
                                        条
                                    </div>
                                    <nav>
                                        <ul class="pagination">
                                            <!-- 上一页 -->
                                            <c:choose>
                                                <c:when test="${searchInfo.pageNo == 1}">
                                                    <li class="disabled">
                                                        <a>
                                                            <i class="material-icons">chevron_left</i>
                                                        </a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <a onclick="go(${searchInfo.pageNo - 1})">
                                                            <i class="material-icons">chevron_left</i>
                                                        </a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>

                                            <c:forEach begin="1" end="${totalPages}" var="idx">
                                                <c:choose>
                                                    <c:when test="${idx == searchInfo.pageNo}">
                                                        <li class="active"><a>${idx}</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li><a onclick="go(${idx})" class="waves-effect">${idx}</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <!-- 下一页 -->
                                            <c:choose>
                                                <c:when test="${searchInfo.pageNo == totalPages}">
                                                    <li class="disabled">
                                                        <a class="waves-effect">
                                                            <i class="material-icons">chevron_right</i>
                                                        </a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <a onclick="go(${searchInfo.pageNo + 1})" class="waves-effect">
                                                            <i class="material-icons">chevron_right</i>
                                                        </a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--  add-form-box  -->
    <div class="modal fade" id="view-form-box" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">查看留言</h4>
                </div>
                <div class="modal-body">
                    <form method="post">
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                <label for="name">名称</label>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="text" id="name" name="name" maxlength="20" class="form-control"
                                               placeholder="名称"
                                               disabled>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                <label for="email">邮箱</label>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="email" id="email" name="email" maxlength="50" class="form-control"
                                               placeholder="邮箱"
                                               disabled>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                <label for="createdTime">时间</label>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="text" id="createdTime" name="createdTime" class="form-control"
                                               placeholder="时间"
                                               disabled>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                <label for="subject">主题</label>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="text" id="subject" name="subject" class="form-control"
                                               placeholder="主题" maxlength="20"
                                               disabled>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 form-control-label">
                                <label for="comment">内容</label>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9">
                                <div class="form-group">
                                    <div class="form-line">
                                        <textarea name="comment" id="comment"
                                                  maxlength="1000"
                                                  cols="30" rows="5" class="form-control no-resize"
                                                  placeholder="内容" disabled></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-offset-2 col-md-offset-2 col-sm-offset-3 col-xs-offset-3">
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
        $(".menu .list .contact").addClass("active");

        const $viewForm = $('#view-form-box form');
        // 定义的常量
        const $form = $("#list-form");
        const $pageSize = $form.find("[name='pageSize']");
        const $pageNo = $form.find("[name='pageNo']");
        // 监听每页大小的改变
        $pageSize.change(function () {
            $form.submit();
        });

        // 设置每页大小
        $pageSize.val(${searchInfo.pageSize})

        // 分页
        function go(pageNo) {
            // 让第一页和最后一页点击没效果
            if (pageNo < 1 || pageNo > ${totalPages}) return;
            // 点击后发送请求
            $pageNo.val(pageNo);
            $form.submit();
        }

        function view(contact) {
            // 利用原生JS的表单DOM对象的reset方法 简单实现表单重置
            $viewForm[0].reset();
            $('#view-form-box').modal()
            // 遍历传进来的对象，依次设值
            for (const key in contact) {
                // 通过属性选择器 选择name=key的空间
                if (key.endsWith("Day")) {
                    $viewForm.find("[name='" + key +"']").val(contact[key].substring(0, 10));
                } else {
                    $viewForm.find("[name='" + key +"']").val(contact[key]);
                }
            }
        }
    </script>
</body>

</html>
