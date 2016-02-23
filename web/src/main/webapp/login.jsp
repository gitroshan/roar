<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="login.title"/></title>
    <meta name="menu" content="Login"/>
</head>
<body id="login" class="hold-transition login-page">

<div class="login-box">
      <div class="login-logo">
        <a href="../../index2.html"><b>Admin</b>LTE</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>

	<form id="loginForm" action="<c:url value='/j_security_check'/>" method="post" onsubmit="saveUsername(this);return validateForm(this)" autocomplete="off">
          <c:if test="${param.error != null}">
			    <div class="callout callout-danger">
			        <fmt:message key="errors.password.mismatch"/>
			    </div>
		  </c:if>
          <div class="form-group has-feedback">
            <input type="text" class="form-control" placeholder="<fmt:message key="label.username"/>" name="j_username" id="j_username" required tabindex="1">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" placeholder="<fmt:message key="label.password"/>" name="j_password" id="j_password" required tabindex="2">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
          <c:if test="${appConfig['rememberMeEnabled']}">
            <div class="col-xs-8">
              <div class="checkbox icheck">
                <label for="rememberMe">
                  <input type="checkbox" name="_spring_security_remember_me" id="rememberMe" tabindex="3"> <fmt:message key="login.rememberMe"/>
                </label>
              </div>
            </div><!-- /.col -->
           </c:if>
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat" name="login" tabindex="4"><fmt:message key='button.login'/></button>
            </div><!-- /.col -->
          </div>
        </form>
        
        <div class="social-auth-links text-center">
          <p>- OR -</p>
          <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using Facebook</a>
          <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using Google+</a>
        </div><!-- /.social-auth-links -->
		<br/>
        <p>
		    <fmt:message key="login.signup">
		        <fmt:param><c:url value="/signup"/></fmt:param>
		    </fmt:message>
		</p>
		<p><fmt:message key="login.passwordHint"/></p>

		<p><fmt:message key="updatePassword.requestRecoveryTokenLink"/></p>
        
        <c:set var="scripts" scope="request">
<%@ include file="/scripts/login.js"%>
<%@ include file="/scripts/components.js"%>
</c:set>

      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->

</body>