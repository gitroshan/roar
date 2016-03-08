<script type="text/javascript">

$(function () {
  $('input').iCheck({
    checkboxClass: 'icheckbox_square-blue',
    radioClass: 'iradio_square-blue',
    increaseArea: '20%' // optional
  });
});

function showProgressOverlay(divId, message){
	
	var processingMessage = message;
	if(processingMessage == null || processingMessage == ''){
		processingMessage = '<fmt:message key="loading.default"/>';
	}

	 $('#' + divId).block(
			 { 
				 message: '<img class="loader-image" src="<c:url value="/images/loader.gif"/>"/>&nbsp;' + message, 
				 css: {	
					 	width:'50%', 
					 	left:'25%', 
					 	padding: 5, 
					 	color: '#666'
					}
			 });
}

function hideProgressOverlay(divId){
	$('#' + divId).unblock();
}

</script>