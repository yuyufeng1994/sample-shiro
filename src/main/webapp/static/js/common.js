function $POST_JSON(url, postData, successCallback, errorCallback) {
    NProgress.remove();
    var type = type || "POST";
    $.ajax({
        url:url,
        data:JSON.stringify(postData),
        dataType:'json',
        xhrFields: {
            withCredentials: true
        },
        type:type,
        contentType:"application/json",
        beforeSend:function () {
            NProgress.start();
        },
        success:function (res) {
            if(res.success){
                if(successCallback){
                    successCallback(res);
                }
            }else{
                if(errorCallback){
                    errorCallback(res);
                }
            }
        },
        fail:function () {
            if(errorCallback){
                errorCallback();
            }
        },
        complete:function () {
            NProgress.done();
        }
    })
}

function $AJAX(url, postData, successCallback, errorCallback,type){
    NProgress.remove();
    var type = type || "POST";
    $.ajax({
        url:url,
        data:JSON.stringify(postData),
        dataType:'json',
        xhrFields: {
            withCredentials: true
        },
        type:type,
        contentType:"application/json",
        beforeSend:function () {
            NProgress.start();
        },
        success:function (res) {
            if(res.success){
                if(successCallback){
                    successCallback(res);
                }
            }else{
                if(errorCallback){
                    errorCallback(res);
                }
            }
        },
        fail:function () {
            if(errorCallback){
                errorCallback();
            }
        },
        complete:function () {
            NProgress.done();
        }
    })
}

function $POST(url,postData, successCallback, errorCallback) {
    NProgress.remove();
    var type = type || "POST";
    $.ajax({
        url:url,
        data:postData,
        xhrFields: {
            withCredentials: true
        },
        type:type,
        beforeSend:function () {
            NProgress.start();
        },
        success:function (res) {
            if(res.success){
                if(successCallback){
                    successCallback(res);
                }
            }else{
                if(errorCallback){
                    errorCallback(res);
                }
            }
        },
        fail:function () {
            if(errorCallback){
                errorCallback();
            }
        },
        complete:function () {
            NProgress.done();
        }
    })
}

function $GET(url, successCallback, errorCallback) {
    NProgress.remove();
    var type = type || "GET";
    $.ajax({
        url:url,
        xhrFields: {
            withCredentials: true
        },
        type:type,
        beforeSend:function () {
            NProgress.start();
        },
        success:function (res) {
            if(res.success){
                if(successCallback){
                    successCallback(res);
                }
            }else{
                if(errorCallback){
                    errorCallback(res);
                }
            }
        },
        fail:function () {
            if(errorCallback){
                errorCallback();
            }
        },
        complete:function () {
            NProgress.done();
        }
    })
}

