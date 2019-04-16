$.ajaxSetup({
    //设置ajax请求结束后的执行动作
    complete: function (XMLHttpRequest, textStatus) {
        // 通过XMLHttpRequest取得响应头，sessionstatus
        try {
            var REDIRECT = XMLHttpRequest.getResponseHeader("REDIRECT");
            if (REDIRECT == "REDIRECT") {
                var win = window;
                while (win != win.top) {
                    win = win.top;
                }
                win.location.href = XMLHttpRequest.getResponseHeader("CONTENTPATH");
            }
            var AUTHENTICATION = XMLHttpRequest.getResponseHeader("AUTHENTICATION");
            if (AUTHENTICATION == 'false') {
                closeLoading();
                layer.alert("您无权对当前数据操作");
            }
        } catch (e) {

        }

    },
    timeout: 100000,
    error: function (event, jqXHR, ajaxSettings, thrownError) {
        closeLoading();
        var status = event.status;
        if (status != 3333) {
            var statusText = event.statusText;
            if (statusText == 'timeout') {
                alertErrorInfo('request '+statusText);
            } else {
                alertErrorInfo(event.responseText);
            }
        }
    }
});

function alertErrorInfo(error) {
    layer.open({
        type: 1,
        title: '错误信息',
        shadeClose: false,
        shade: [0.7],
        maxmin: true, //开启最大化最小化按钮
        area: ['1000px', '655px'],
        content: "<div>" + error + "</div>"
    })
}

var currentLoading = null;

function loading() {
    currentLoading = layer.load(0, {shade: [0.5, "#fff"]});
}

function closeLoading() {
    layer.closeAll();
}

function closeCurrentLoading() {
    layer.close(currentLoading);
}

function fmtDate(date) {
    if (!date) {
        return "";
    }
    var date = new Date(date);
    var y = 1900 + date.getYear();
    var m = "0" + (date.getMonth() + 1);
    var d = "0" + date.getDate();
    return y + "-" + m.substring(m.length - 2, m.length) + "-" + d.substring(d.length - 2, d.length);
}

function fmtDate2(date) {
    if (!date) {
        return "";
    }
    var date = new Date(date);
    var y = 1900 + date.getYear();
    var m = "0" + (date.getMonth() + 1);
    var d = "0" + date.getDate();
    var h = "0" + date.getHours();
    var mm = "0" + date.getMinutes();
    var s = "0" + date.getSeconds();
    return y + "-" + m.substring(m.length - 2, m.length) + "-" + d.substring(d.length - 2, d.length) + " " + h.substring(h.length - 2, h.length) + ":" + mm.substring(mm.length - 2, mm.length) + ":" + s.substring(s.length - 2, s.length);
}


function numJy(obj) {
    obj.value = obj.value.replace(/[^\d]/g, '');
}


