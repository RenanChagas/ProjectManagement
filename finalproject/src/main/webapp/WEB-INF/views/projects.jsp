<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
  <script src="<c:url value="/static/js/menu.js" />"></script>
  
  <!-- Website Logo -->
  <link rel="icon" href="<c:url value="/static/images/default/logo.png"/>">
  
  <script>
    $(document).ready(function(){
      $('.modal').modal();
    });

  </script>

</head>
<body>

	<!-- NAV TOP  -->
	<nav id="logo_nav" class="MDC-navbar-style MDC-shadow-0 hide-on-small-and-down">
    	<div class="nav-wrapper MDC-nav-margin">
    		<!--  NAV CONTAINER -->
      		<div class="row MDC-nav-top-container ">

        	<!-- Logo -->
        	<div class="col s12 m3 l2">
          		<div class="MDC-nav-logo-position">
          			<img src="<c:url value="/static/images/default/logo.png"/>" class="MDC-nav-logo-size"/>
          		</div>
        	</div>

        	<!-- Search -->
        	<div class="col s12 m7 l7">
          		<div class="MDC-nav-search-position">
            	<form>
              		<div class="input-field">
                		<input id="search" type="search" class="MDC-nav-search-focus" required>
                		<label class="label-icon" for="search"><i class="material-icons MDC-nav-search-focus">search</i></label>
                  		<i class="material-icons MDC-nav-search-focus">close</i>
              		</div>
            	</form>
          		</div>
        	</div>

        	<!-- Avatar -->
        	<div class="col s12 m2 l3">
          		<div class="MDC-nav-account-position">
	            	<!-- Dropdown Trigger -->
	            	<a class="dropdown-button " data-beloworigin="true"
	               		href='#' data-activates='account-dropdown'>
	               		<div class="MDC-nav-account-option-position hide-on-med-and-down">
	                		 <i class="material-icons MDC-icon-small MDC-color-grey-light">expand_more</i>
	               		</div>
	               		<span class="MDC-login-text MDC-nav-account-text-position 
	               					MDC-color-grey-light hide-on-med-and-down">
	                 	${user.username}
	               		</span>
	               		<img src="<c:url value="/static/images/avatar/${user.username}/${user.username}.png"/>"
	               				class="MDC-avatar-circle-small mdc-nav-avatar-position"/>
	            	</a>
	            	<!-- Dropdown Structure -->
	            	<ul id='account-dropdown' class='dropdown-content MDC-nav-account-dropdown-position'>
	              		<li><a id="profile" class="modal-trigger MDC-color-grey-dark-2 MDC-font-15" href="profile">Profile</a></li>
	              		<li><a class="MDC-color-grey-dark-2 MDC-font-15" href="#!">Report a Problem</a></li>
	              		<li class="divider"></li>
	              		<li><a class="MDC-color-grey-dark-2 MDC-font-15" href="logout">Logout</a></li>
	            	</ul>
          		</div>
        	</div>

			</div>
			<!--  NAV CONTAINER - END-->
		</div>
	</nav>
	<!-- NAV TOP - END -->
  	
  <!-- NAV MENU  -->
  <div class="MDC-menu-fullWidth">
    <div class="MDC-shadow-bottom">
      <header class="MDC-shadow-bottom">
        <nav id="menu_nav" class="MDC-navbar-menu-size MDC-navbar-style MDC-shadow-0 MDC-nav-margin">
          <div class="nav-wrapper MDC-nav-margin MDC-left">
            <!-- MENU ROW -->
            <div class="row">
              <div class="col">
                <div class="MDC-nav-menu-container">

                  <ul id="nav-mobile" class="MDC-nav-menu-ul left left-align">
                    <a href="#" id="mobile-icon" onclick="openNav()" class="left MDC-padding-mobile-0
                    MDC-hover-none">
                      <i class="material-icons MDC-nav-tabs-icon MDC-color-grey-light">
                        menu
                      </i>
                    </a>
                    <li class="MDC-navbar-menu"><a href="dashboard">Dashboard</a></li>
                    <li class="MDC-navbar-menu"><a class="active MDC-navbar-active" href="projects">Projects</a></li>
                    <li class="MDC-navbar-menu"><a href="#!">My Tasks</a></li>
                    <li class="MDC-navbar-menu"><a  href="#!">Notifications
                      <span class="new badge MDC-notification-badge-style" data-badge-caption="">
                        <font class="MDC-font-weight-400">4 NEW</font>
                      </span>
                      </a>
                    </li>
                  </ul>
                  <div id="mySidenav" class="MDC-sidenav">
                    <a href="javascript:void(0)" class="MDC-closebtn" onclick="closeNav()">x</a>
                    <a href="#">About</a>
                    <a href="#">Services</a>
                    <a href="#">Clients</a>
                    <a href="#">Contact</a>
                  </div>

                </div>
              </div>
            </div>
            <!-- MENU ROW - END -->
          </div>
        </nav>
      </header>
    </div>
  </div>
  <!-- NAV MENU - END -->

<!-- TITLE PAGE -->
<div class="row  MDC-page-center MDC-page-container">
  <div class="col MDC-padding-0 left">
    <div class="MDC-page-title-size">
      <font class="MDC-h5-style MDC-color-grey-dark-2 MDC-display-inline">Projects</font>
      <font class="MDC-h5-style MDC-color-grey-light-2 MDC-display-inline MDC-relative
                   MDC-news-counterBar-position">/
      </font>
      <font class="MDC-h5-style MDC-color-blue MDC-display-inline">Latest</font>
      <i class="material-icons MDC-icon-small MDC-color-blue
                MDC-news-expand-icon-position MDC-relative">expand_more</i>

    </div>
  </div>

  <!-- ADD TASK -->
  <div class="right MDC-margin-right50">
    <a href="projects/create" 
      class="btn-floating btn-large waves-effect MDC-absolute right
            MDC-background-blue MDC-General-floatbtn-position">
      <i class="material-icons">add</i>
    </a>
  </div>
</div>

  <div class="MDC-page-center MDC-page-container">
	<div class="row MDC-page-margin-top">
    
		<c:forEach items="${project}" var="projects">
			<!-- Project -->
			<div class="col MDC-padding-0 MDC-margin-right40 MDC-margin-bottom30">
				<!-- CARD -->
				<div class="MDC-card MDC-course-card-size"  onclick="<t:url value="/projects/details?id=${projects.id}" />">
					<!-- float btn -->
					<a href=" <t:url value="/projects/details?id=${projects.id}" /> " 
						class="btn-floating btn waves-effect  MDC-absolute  right
						MDC-background-blue  MDC-category-floatbtn-position">
			            <i class="material-icons">query_builder</i>
			    	</a>
			    	
			    	<!-- Image -->
			    	<a href=" <t:url value="/projects/details?id=${projects.id}" /> ">
			        <div class="row center MDC-margin-top20">
			        	<img src="<c:url value="/static/images/default/projects/${projects.icon}.png"/>"
			            	class="MDC-avatar-circle-large MDC-shadow-default"/>
			        </div>
			        </a>
			        <!-- Title -->
					<div class="row center MDC-margin-bottom-10">
			        	<font class="truncate MDC-font-15 MDC-color-grey-dark-2 MDC-font-h1">
			            	${projects.projectName}
			            </font>
			        </div>
			        
			        <!-- Hours -->
          			<div class="row center MDC-margin-bottom-10">
            			<font class="truncate MDC-font-16-2 MDC-color-grey MDC-font-h1
                        	MDC-uppercase-none">
               				0 Hours
            			</font>
          			</div>
          			
          			<!-- Task Date -->
          			<div class="row MDC-margin-top10 MDC-width-80perc">
            			<div class="MDC-divider"></div>
            				<font class="truncate MDC-font-16-2 MDC-uppercase-none MDC-font-h1
                        		MDC-color-grey-dark-2">
                	 			Due Date:
            				</font>
            				<font class="MDC-color-grey">
            					<fmt:formatDate pattern="dd/MM/yyyy" value="${projects.dueDate}" />
            				</font>
          			</div>
          			
				</div>
				<!-- CARD END -->
			</div>
			<!-- Project-END -->
		</c:forEach>

    </div>
</div>

</body>
</html>
