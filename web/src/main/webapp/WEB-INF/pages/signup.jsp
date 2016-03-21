<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="signup.title"/></title>
</head>

<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a href="<c:url value="/home"/>"><b><fmt:message key="webapp.name"/></b></a>
      	</div>
      	<div id="register-box-body" class="register-box-body">
      		<div id="signupFormFocus" tabindex="-1" ></div>
      		<p class="login-box-msg"><fmt:message key="signup.message"/></p>
      		<form:form commandName="user" method="post" action="signup" id="signupForm" autocomplete="off" onsubmit="return validateSignUpForm(this)">
      		
      		<c:if test="${param.error != null}">
			    <div id="signupError" class="callout callout-danger">
			    	<h4><i class="icon fa fa-ban"></i> <fmt:message key="page.warning"/></h4>
			        <p>${param.error}</p>
			    </div>
		  	</c:if>
      		<div id="signupFormErrorJs" class="callout callout-danger" style="display: none;" ></div>
    
          <div id="username-form-group" class="form-group has-feedback">
          	<form:input cssClass="form-control" path="username" id="username" autofocus="true" placeholder="Username"/>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div id="password-form-group" class="form-group has-feedback">
          	<form:password cssClass="form-control" path="password" id="password" placeholder="Password"/>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div id="confirmPassword-form-group" class="form-group has-feedback">
          	<form:password cssClass="form-control" path="confirmPassword" id="confirmPassword" placeholder="Confirm Password"/>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div id="passwordHint-form-group" class="form-group has-feedback">
          	<form:input cssClass="form-control" path="passwordHint" id="passwordHint" placeholder="Password Hint"/>
            <span class="glyphicon glyphicon-eye-open form-control-feedback"></span>
          </div>
          <div id="firstName-form-group" class="form-group has-feedback">
          	<form:input cssClass="form-control" path="firstName" id="firstName" maxlength="50" placeholder="First Name"/>
            <span class="glyphicon glyphicon-heart form-control-feedback"></span>
          </div>
          <div id="lastName-form-group" class="form-group has-feedback">
          	<form:input cssClass="form-control" path="lastName" id="lastName" maxlength="50" placeholder="Last Name"/>
            <span class="glyphicon glyphicon-star form-control-feedback"></span>
          </div>
          <div id="email-form-group" class="form-group has-feedback">
          	<form:input cssClass="form-control" path="email" id="email" placeholder="Email"/>
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div id="phoneNumber-form-group" class="form-group has-feedback">
            <form:input cssClass="form-control" path="phoneNumber" id="phoneNumber" placeholder="Phone Number"/>
            <span class="glyphicon glyphicon-phone form-control-feedback"></span>
          </div>
          <div id="website-form-group" class="form-group has-feedback">
            <form:input cssClass="form-control" path="website" id="website" placeholder="Web Site"/>
            <span class="glyphicon glyphicon-home form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">
              <div id="iAgree-form-group" class="checkbox icheck">
                <label for="iAgree">
                  <input type="checkbox" id="iAgree" name="iAgree"> <fmt:message key="signup.i.agree"/><a href="#"><fmt:message key="signup.terms"/></a>
                </label>
              </div>
            </div><!-- /.col -->
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat"><fmt:message key="signup.start.message"/></button>
            </div><!-- /.col -->
          </div>
        </form:form>
         <div class="social-auth-links text-center">
          <p>- OR -</p>
          <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i><fmt:message key='login.facebook'/></a>
          <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i><fmt:message key='login.google'/></a>
        </div>
        
      	<a href="<c:url value="/login"/>" class="text-center"><fmt:message key='signup.already.have.membership'/></a>
      </div><!-- /.form-box -->
    </div><!-- /.register-box -->
</body>



<c:set var="scripts" scope="request">
<v:javascript formName="signup" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value="/scripts/validator.jsp"/>"></script>
<%@ include file="/scripts/signup.js"%>
</c:set>

