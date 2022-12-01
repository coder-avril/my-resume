<script src="${ctx}/asset/plugin/jquery/jquery.min.js"></script>
<script src="${ctx}/asset/plugin/bootstrap/bootstrap.min.js"></script>
<script src="${ctx}/asset/plugin/bootstrap-fileinput/bootstrap-fileinput.js"></script>
<script src="${ctx}/asset/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="${ctx}/asset/plugin/node-waves/waves.js"></script>
<script src="${ctx}/asset/plugin/jquery-validation/jquery.validate.js"></script>
<script src="${ctx}/asset/plugin/jquery-validation/messages_zh.js"></script>
<script src="${ctx}/asset/plugin/sweetalert/sweetalert.min.js"></script>

<!-- Custom Js -->
<script src="${ctx}/asset/admin/js/default.js"></script>
<script src="${ctx}/asset/admin/js/main.js"></script>

<script>
function sendData(requestUrl, param, responseUrl) {
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

function sendDataWithFile(requestUrl, param, responseUrl) {
    $.ajax({
        method: "POST", // 请求方式
        url: requestUrl, // 请求路径
        data: param, // 请求参数
        dataType: "json", // 设置接受到的响应数据的格式
        processData: false,
        contentType: false,
        success: function (result) { //响应成功后的回调函数
            if (result.success) {
                document.location.href = responseUrl;
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