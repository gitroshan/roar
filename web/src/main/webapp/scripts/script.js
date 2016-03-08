


// This function is a generic function to create form elements
function createFormElement(element, type, name, id, value, parent) {
    var e = document.createElement(element);
    e.setAttribute("name", name);
    e.setAttribute("type", type);
    e.setAttribute("id", id);
    e.setAttribute("value", value);
    parent.appendChild(e);
}

function confirmDelete(obj) {
    var msg = "Are you sure you want to delete this " + obj + "?";
    ans = confirm(msg);
    return ans;
}

// 18n version of confirmDelete. Message must be already built.
function confirmMessage(obj) {
    var msg = "" + obj;
    ans = confirm(msg);
    return ans;
}


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
