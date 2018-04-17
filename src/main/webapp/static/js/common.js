function $POST(url, postData, successCallback, errorCallback) {
    $AJAX(url, postData, successCallback, errorCallback,"POST");
}

function $GET(url, postData, successCallback, errorCallback) {
    $AJAX(url, postData, successCallback, errorCallback,"GET")
}

function $AJAX(url, postData, successCallback, errorCallback,type){
    NProgress.remove();
    $.ajax({
        url:url,
        data:JSON.stringify(postData),
        dataType:'json',
        xhrFields: {
            withCredentials: true
        },
        type:type,
        contentType:'application/json',
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