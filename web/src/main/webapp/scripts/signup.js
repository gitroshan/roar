<script type="text/javascript">

function validateSignUpForm(form) {
	
	showProgressOverlay('register-box-body', '<fmt:message key="loading.sign.up"/>');
	    
	if($("#signUpError") != null){
    	$("#signUpError").hide();
    }
	
	var valid = validateSignup(form);

	hideProgressOverlay('register-box-body');
    return valid;
}

</script>