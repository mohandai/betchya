$("#login_button").click(function() {
        var login_username = document.getElementById("loginUsername");
	    var login_password = document.getElementById("loginPassword");
	    console.log(login_username.value);
	    console.log(login_password.value);
	    var login_data = {"username":login_username.value,"password":login_password.value};
	    var found_email = 'false';
	    var password_match = 'false';
	    $.ajax({
	        url:"/login/", //提交到那里
	        type:"POST", //提交类型
	        data:JSON.stringify(login_data), //提交的数据
	        success:function(data){ //success不会直接运行，当服务器有数据传输过来才会触发执行。
	　　　　	console.log('responsed data:');
	        console.log(data);
	        found_email = data['username_found'];
	        password_match = data['password_matched'];
	        if (password_match == 'true') {
	        	window.location.href='/';
	        	//alert("logged in");
	        }
	        else {
	        	alert("logged failed");
	        }
	        
	    	}
	    })	


    })

$("#register_button").click(function() {
        var register_username = document.getElementById("registerUsername");
	    var register_password = document.getElementById("registerPassword");
	    var register_password2 = document.getElementById("registerPassword2");
	    var register_firstname = document.getElementById("registerFirstname");
	    var register_lastname = document.getElementById("registerLastname");
	    var register_email = document.getElementById("registerEmail");
	    var register_phone = document.getElementById("registerPhone");
	    var register_bio = document.getElementById("registerBio");
	    var register_cardno = document.getElementById("registerCardno");
	    var register_cardname = document.getElementById("registerCardname");
	    var register_cardexpiry = document.getElementById("registerCardexpiry");
	    var register_cardccv = document.getElementById("registerCardccv");

	    
	    var register_data = {
	   	"username":register_username.value,
	    "password":register_password.value,
	    "password2":register_password2.value,
	    "firstname":register_firstname.value,
	    "lastname":register_lastname.value,
	    "email":register_email.value,
	    "phone":register_phone.value,
	    "bio":register_bio.value,
	    "cardno":register_cardno.value,
	    "cardname":register_cardname.value,
	    "cardexpiry":register_cardexpiry.value,
	    "cardccv":register_cardccv.value,
	};
		console.log(register_data);
	    //console.log(login_password.value);
	    //var found_email = 'false';
	    //var password_match = 'false';
	    $.ajax({
	        url:"/register/", //提交到那里
	        type:"POST", //提交类型
	        data:JSON.stringify(register_data), //提交的数据
	        success:function(data){ //success不会直接运行，当服务器有数据传输过来才会触发执行。
	　　　　	console.log('responsed data:');
	        console.log(data);
	        result = data['register_result'];
	        err_message = data['error_message'];
	        if (result == 'true') {
	        	window.location.href='/login/';
	        	//alert("logged in");
	        }
	        else {
	        	alert(err_message);
	        }
	        
	    	}
	    })	


    })