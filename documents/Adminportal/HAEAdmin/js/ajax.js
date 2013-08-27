/**
 * @author eapugo
 */
	$(function(){
		  //$("form.userform").submit(function() { // loginForm is submitted
    	//var userid = $('#user').attr('value'); // get username
    	//var password = $('#password').attr('value'); // get password
			$(".userform").submit(function() {
				alert("1232");
				var loginObj = {};
				jQuery.each(($(this).serializeArray()), function(i, field) {
				loginObj[field.name] = field.value;
			});
			
    	 	sendLoginData(loginObj);
    	 	
    	/* 	jQuery.ajax({
            type: "Post",
            url: "/Main/SearchForServers",
            data: { criteria: $('#searchCriteria').val() }, <---  Send the data with the post...
            success: function (data) {
                jQuery("#searchList").page = 1;
                jQuery("#searchList").trigger("reloadGrid");    <--- The callback what happens when the data comes back...
            },
            dataType: "json",
            async: false
            */
			 return false;
			  
			});
			
			function sendLoginData(loginObj) {
				alert(loginObj.user);
    	 		alert(loginObj.pass);
    	 		//url: "http://192.168.1.101:8080/hae/admintool/authenticateUser",
    	 		
    	 		//alert("Alert32121");
    	 		//jQuery.ajax({
    	 			$.ajax({
    	 			type: "POST",
    	 			
    	 			url: "http://192.168.1.101:8080/hae/admintool/authenticateUser",
    	 			contentType: "application/json; charset=utf-8",
    	 			dataType: "json",
    	 			data: {
 						"userid": loginObj.user,
 						"password": loginObj.pass,
 						},
    	 			error: function(XMLHttpRequest, textStatus, errorThrown) { 
          			$('div#loginResult').text("<lii Error response Text: " + XMLHttpRequest.responseText 
            		+ "Status:" + textStatus + "</li>");
          		$('div#loginResult').addClass("error");
          				},
          				success: function(data){
          		if (data.error) { // script returned error
            	$('div#loginResult').text("data.error: " + data.error);
            $('div#loginResult').addClass("error");
          } // if
          else { // login was successful
            $('form#loginForm').hide();
            $('div#loginResult').text("<li>data.success: " + data.success 
              + ", data.userid: " + data.user + "</li>");
            $('div#loginResult').addClass("success");
          } 
          //else
    	 			/*success: function (data) {
    	 				alert("Alert2");
    	 				
                		jQuery(".loginForm").page = 1;
                		jQuery(".loginForm").trigger("reloadGrid");   // <--- The callback what happens when the data comes back...
           			 },
            		dataType: "json",
            		async: false */
    	 		}
			});
			}
		});
	 	 