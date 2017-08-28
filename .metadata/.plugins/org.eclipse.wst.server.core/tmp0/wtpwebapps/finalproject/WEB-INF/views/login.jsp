<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags"%>  

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Project Management</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link type="text/css" rel="stylesheet" media="screen,projection" href="<c:url value='/static/css/materialize.css' />"/>
  <link type="text/css" rel="stylesheet" media="screen,projection" href="<c:url value='/static/css/custom-css.css' />"/>

  <!--  Scripts-->
  <script src="<c:url value="/static/js/jquery-2.1.1.min.js" />"></script>
  <script src="<c:url value="/static/js/materialize.js" />"></script>
  
  <!-- Website Logo -->
  <link rel="icon" href="<c:url value="/static/images/default/logo.png"/>">

</head>
<body>

  <!-- Background image -->
	<div class="MDC-login-background"></div>

  <!-- Login Box -->
  <div class="MDC-center-container">
    <div class="MDC-login-box MDC-login-box-style">

      <!-- Logo -->
      <div class="col s12 MDC-margin-bottom40">
        <div class="MDC-center-image">
          <div class="MDC-login-logo-small"></div>
        </div>
      </div>

      <!-- Form -->
      <c:url var="loginUrl" value="/login" />
      <form action="${loginUrl}" method="post" class="form-horizontal">
        <!-- Username-->
        <div class="col s12">
          <div class="input-field invalid MDC-color-grey-dark-2 MDC-login-form-size">
            <div class="material-icons MDC-login-icon-position prefix">account_circle</div>
            <input type="text" id="username" name="username" placeholder="Username" class="validate MDC-form-text MDC-color-grey-dark-2 MDC-font-15 MDC-font-weight-300">
          </div>
        </div>
        <!-- Password -->
        <div class="col s12">
          <div class="input-field invalid MDC-color-grey-dark-2 MDC-login-form-size">
            <div class="material-icons MDC-login-icon-position prefix">lock_outline</div>
            <input type="password" id="password" name="password" placeholder="Password" class="validate MDC-form-text MDC-color-grey-dark-2 MDC-font-15 MDC-font-weight-300">
          	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
          </div>
        </div>
        <!-- Submit -->
        <!-- Login Button -->
        <div class="col s12">
          <div class="MDC-center-image">
            <button id="login" type="submit" class="btn-large MDC-btn-huge waves-effect waves-light blue MDC-form-text MDC-login-button-position"  name="action">
              Login
            </button>
          </div>
        </div>
      </form>
      <!-- Form - END -->
      <div class="right">
        <div class="row MDC-margin-top20">
          <div class="col s12">
            <div class="MDC-color-grey-dark-2 MDC-login-form-size center-align MDC-font-15 MDC-font-weight-300">
              Don't have an account yet ? <a href="signup.html">Click here</a>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
  <!-- Login Box - END -->

</body>
</html>
