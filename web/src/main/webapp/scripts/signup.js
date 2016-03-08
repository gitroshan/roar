<script type="text/javascript">

function validateSignUpForm(form) {
	
	// showProgressOverlay('register-box-body', '<fmt:message key="loading.sign.in"/>');
	    
	if($("#signUpError") != null){
    	$("#signUpError").hide();
    }
	var valid = validateSignup(form, $("#signUpErrorJs"));
	//var valid = (errorMessage == null || errorMessage == '');
	
//	if (!valid) {
//		if($("#signUpErrorJs") != null) {
//			$("#signUpErrorJs").show();
//			hideProgressOverlay('register-box-body');
//	    }
//     }
	// hideProgressOverlay('register-box-body');
     return valid;
}

</script>