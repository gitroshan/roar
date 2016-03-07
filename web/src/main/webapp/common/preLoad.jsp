<%@ include file="/common/taglibs.jsp" %>
<div class="hidden">

 <c:set var="scripts" scope="request">
	<script type="text/javascript">
		<!--//--><![CDATA[//><!--
			var images = new Array()
			function preload() {
				for (i = 0; i < preload.arguments.length; i++) {
					images[i] = new Image()
					images[i].src = preload.arguments[i]
				}
			}
			preload(
				"<c:url value="/images/loader.gif"/>"
			)
		//--><!]]>
	</script>
	</c:set>
	
</div>