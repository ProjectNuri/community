/**
 * 
 */

var ajax = {
	error:function (xhr, ajaxOptions, thrownError) {
    	if(xhr.status == 901) {
    		alert("로그인이 필요합니다.");
    		location.href = "/login";
    	} else {
    		alert('error trying to post to ' + u + '.\r' + xhr.status + "/" + thrownError);
    	}
    },
	submit:function(formName, cb) {
		$form = $("form[name='"+formName+"']");
		var data = $form.serialize();
		var headers = {};
		data['_method'] = $form.attr("method");
		headers['_method'] = $form.attr("method");
		$.ajax({
		    type:'POST',
		    url:$form.attr("action"),
		    cache:false,
		    data:data,
		    success:cb,
		    error:ajax.error
		});
	},
	get:function(u, data, cb) {
		$.ajax({
		    type:'GET',
		    url:u,
		    cache:false,
		    dataType:'json',
		    data:data,
		    contentType:'application/json; charset=utf-8',
		    success:cb,
		    error:ajax.error
		});
	},
	post:function (url, data, cb) {
        $.ajax({
            type:'POST',
            url:url,
            cache:false,
            data:data,
            success:cb,
            error:ajax.error
        });
    },
	put:function (url, data, cb) {
        var k = '_method',
            v = 'PUT';
        data[k] = v;
        var headers = {};
        headers[k] = v;
        $.ajax({
            type:'POST',
            url:url,
            cache:false,
            data:data,
            headers:headers,
            success:cb,
            error:ajax.error
        });
    }
}