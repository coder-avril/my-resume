<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" class="crt crt-nav-on crt-nav-type1 crt-main-nav-on crt-sidebar-on crt-layers-2">
<head>
    <%@ include file="common/style.jsp" %>
    <title>${user.name}-教育经验</title>
</head>
<body class="">
    <div class="crt-wrapper">
        <%@ include file="common/smallNav.jsp" %>

        <div id="crt-container" class="crt-container">
            <%@ include file="common/bigNav.jsp" %>
            <div class="crt-container-sm">
                <div class="crt-paper-layers">
                    <div class="crt-paper clear-mrg">
                        <div class="crt-paper-cont paper-padd clear-mrg">
                            <div class="padd-box">
                                <h2 class="title-lg text-upper">联系我吧</h2>
                                <div class="padd-box-xs">
                                    <header class="contact-head">
                                        <h3 class="title text-upper">可以随时联系我！</h3>
                                    </header>
                                </div>
                                <div class="padd-box-sm">
                                    <form id="send-form-box" class="contact-form">
                                        <div class="form-group">
                                            <label class="form-label" for="name">您的姓名</label>
                                            <div class="form-item-wrap">
                                                <input id="name" name="name" maxlength="20" class="form-item" type="text" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label" for="email">您的邮箱</label>
                                            <div class="form-item-wrap">
                                                <input id="email" name="email" maxlength="50" class="form-item" type="email" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label" for="subject">您的主题</label>
                                            <div class="form-item-wrap">
                                                <input id="subject" name="subject" class="form-item" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group"><label class="form-label" for="comment">您的留言</label>
                                            <div class="form-item-wrap">
                                                <textarea id="comment" name="comment" class="form-item" required></textarea>
                                            </div>
                                        </div>
<%--                                        <div class="form-group">--%>
<%--                                            <label class="form-label" for="captcha">验证码</label>--%>
<%--                                            <div class="form-item-wrap">--%>
<%--                                                <input id="captcha" name="captcha" class="form-item" type="text" required>--%>
<%--                                                <img src="${ctx}/front/captcha" id="captchaImage" alt="">--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
                                        <div class="form-submit form-item-wrap">
                                            <input class="btn btn-primary btn-lg" type="submit" onclick="send()" value="发布您的留言">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- .crt-paper -->
                </div><!-- .crt-paper-layers -->
            </div><!-- .crt-container-sm -->
        </div>

        <%@ include file="common/foot.jsp" %>
    </div><!-- .crt-wrapper --><!-- Scripts -->
    <%@ include file="common/script.jsp" %>
    <script>
        $('#captchaImage').click(function () {
            $(this).hide().attr('src', '${ctx}/front/captcha?time=' + new Date().getTime()).fadeIn()
        })

        function send() {
            // 获得url
            const requestUrl = "${ctx}/admin/contact/send";
            const responseUrl = "${ctx}/front/contact";
            // 将常用的表单给取出来
            const name = $('#send-form-box [name="name"]').val();
            const email = $('#send-form-box [name="email"]').val();
            const subject = $('#send-form-box [name="subject"]').val();
            const comment = $('#send-form-box [name="comment"]').val();
            const formData = {
                "name": name,
                "email": email,
                "subject": subject,
                "comment": comment
            };
            // 通过ajax调用后台
            sendMsgData(requestUrl, JSON.stringify(formData), responseUrl);
        }

        function sendMsgData(requestUrl, param, responseUrl) {
            $.ajax({
                method: "post", // 请求方式
                url: requestUrl, // 请求路径
                data: param, // 请求参数
                dataType: "json", // 设置接受到的响应数据的格式
                contentType: "application/json;charset=UTF-8",
                success: function (result) { //响应成功后的回调函数
                    if (result.success) {
                        document.location.href = responseUrl;
                        swal({
                            title: "成功",
                            text: result.message,
                            icon: "success",
                            timer: 1500,
                            buttons: false
                        })
                    } else {
                        swal({
                            title: "错误",
                            text: result.message,
                            icon: "error",
                            dangerMode: true,
                            buttons: { confirm: "确定" }
                        })
                    }
                }
            });
        }
    </script>
</body>
</html>