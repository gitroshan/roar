<script type="text/javascript">

    if ($.cookie("username") != null && $.cookie("username") != "") {
        $("#j_username").val($.cookie("username"));
        $("#j_password").focus();
    } else {
        $("#j_username").focus();
    }
    
    function saveUsername(theForm) {
        $.cookie("username",theForm.j_username.value, { expires: 30, path: "<c:url value="/"/>"});
    }
    
    function validateForm(form) {
    	
    	showProgressOverlay('loginBoxBody', '<fmt:message key="loading.sign.in"/>');
    	saveUsername(form);
        
    	if($("#" + form.id + "Error") != null){
    		$("#" + form.id + "Error").hide();
        }
    	
    	var valid = validateRequired(form);
    	
    	if (!valid) {
    		if($("#" + form.id + "ErrorJs") != null) {
    			$("#" + form.id + "ErrorJs").show();
    			hideProgressOverlay('loginBoxBody');
    	    }
         }
    	
         return valid;
    }

    function passwordHint() {
        if ($("#j_username").val().length == 0) {
            alert("<fmt:message key="errors.required"><fmt:param><fmt:message key="label.username"/></fmt:param></fmt:message>");
            $("#j_username").focus();
        } else {
            location.href="<c:url value="/passwordHint"/>?username=" + $("#j_username").val();
        }
    }
    
    function requestRecoveryToken() {
        if ($("#j_username").val().length == 0) {
            alert("<fmt:message key="errors.required"><fmt:param><fmt:message key="label.username"/></fmt:param></fmt:message>");
            $("#j_username").focus();
        } else {
            location.href="<c:url value="/requestRecoveryToken"/>?username=" + $("#j_username").val();
        }
    }    
    
    function required () { 
        this.aa = new Array("j_username", "<fmt:message key="errors.required"><fmt:param><fmt:message key="label.username"/></fmt:param></fmt:message>", new Function ("varName", " return this[varName];"));
        this.ab = new Array("j_password", "<fmt:message key="errors.required"><fmt:param><fmt:message key="label.password"/></fmt:param></fmt:message>", new Function ("varName", " return this[varName];"));
    } 
    
 // This function is used by the login screen to validate user/pass
 // are entered.
 function validateRequired(form) {
     var bValid = true;
     var focusField = null;
     var i = 0;
     var fields = new Array();
     oRequired = new required();
     var errorMessage = "";

     for (x in oRequired) {
         if ((form[oRequired[x][0]].type == 'text' || 
        		 form[oRequired[x][0]].type == 'textarea' || 
        		 form[oRequired[x][0]].type == 'select-one' || 
        		 form[oRequired[x][0]].type == 'radio' || 
        		 form[oRequired[x][0]].type == 'password')) {
        	 
        	 var divId = oRequired[x][0] + '-form-group';
			 if ($("#" + divId).hasClass('has-error')) {
				 $("#" + divId).removeClass('has-error')
			 }
				
        	 if (form[oRequired[x][0]].value == '') {
				
				if (i == 0) {
					focusField = form[oRequired[x][0]];
				}
				fields[i++] = oRequired[x][1];
				$("#" + divId).addClass('has-error');
			
				if(errorMessage != "") {
					errorMessage += "<br/>";
				}
				errorMessage += "<i class=\"fa fa-times-circle-o\"></i>&nbsp;" + oRequired[x][1];
				
				bValid = false;
			}
            
         }
     }

     if (fields.length > 0) {
        focusField.focus();
        $("#" + form.id + "ErrorJs").html(errorMessage);
     }

     return bValid;
 }
 
</script>
