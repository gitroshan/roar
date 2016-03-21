<script type="text/javascript">

var images = new Array();
function preload() {
	for (i = 0; i < preload.arguments.length; i++) {
		images[i] = new Image();
		images[i].src = preload.arguments[i];
	}
}
preload(
	"<c:url value="/images/loader.gif"/>"
)

$(function () {
  $('input').iCheck({
    checkboxClass: 'icheckbox_square-blue',
    radioClass: 'iradio_square-blue',
    increaseArea: '20%' // optional
  });
});

function showProgressOverlay(divId, message){
	preload();
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
					 	color: '#666',
					 	top: '27%'
					},
				centerY : false
			 });
}

function showDefaultProgressOverlay() {
	 preload();
	 $.blockUI(
			 { 
				 message: '<img class="loader-image" src="<c:url value="/images/loader.gif"/>"/>&nbsp;' + '<fmt:message key="loading.default"/>', 
				 css: {	
					 	width:'16%', 
					 	left:'42%', 
					 	padding: 5, 
					 	color: '#666',
					 	top: '45%'
					}
			 });
}

function hideProgressOverlay(divId){
	$('#' + divId).unblock();
}

</script>