<script type="text/javascript">

function validateSignUpForm(form) {
	
	showProgressOverlay('register-box-body', '<fmt:message key="loading.sign.up"/>');
	    
	if($("#" + form.id + "Error") != null){
    	$("#" + form.id + "Error").hide();
    }
	if($("#" + form.id + "ErrorJs") != null){
    	$("#" + form.id + "ErrorJs").hide();
    }
	
	var valid = validateSignup(form);

	hideProgressOverlay('register-box-body');
    return valid;
}

</script>