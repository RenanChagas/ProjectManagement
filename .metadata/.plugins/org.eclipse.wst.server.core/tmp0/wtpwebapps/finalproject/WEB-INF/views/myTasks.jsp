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
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
            	<form:form id="searchForm" action="/finalproject/search?string" method="POST" modelAttribute="search">
              		<div class="input-field">
                		<form:input id="input_text" type="search" class="MDC-nav-search-focus" path="string" />
                		<label class="label-icon" for="search"><i class="material-icons MDC-nav-search-focus">search</i></label>
                  		<i class="material-icons MDC-nav-search-focus">close</i>
              		</div>
            	</form:form>
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
	                 	${userLogin.username}
	               		</span>
	               		<img src="<c:url value="/static/images/avatar/${userLogin.username}/${userLogin.username}.png"/>"
	               				class="MDC-avatar-circle-small mdc-nav-avatar-position"/>
	            	</a>
	            	<!-- Dropdown Structure -->
	            	<ul id='account-dropdown' class='dropdown-content MDC-nav-account-dropdown-position'>
	              		<li><a id="profile" class="modal-trigger MDC-color-grey-dark-2 MDC-font-15" href="${contextPath}/profile">Profile</a></li>
	              		<li class="divider"></li>
	              		<li><a class="MDC-color-grey-dark-2 MDC-font-15" href="${contextPath}/logout">Logout</a></li>
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
                    <li class="MDC-navbar-menu"><a href="${contextPath}/dashboard">Dashboard</a></li>
                    <li class="MDC-navbar-menu"><a href="${contextPath}/projects">Projects</a></li>
                    <li class="MDC-navbar-menu"><a class="active MDC-navbar-active" href="${contextPath}/task/myTasks">My Tasks</a></li>
                    <li class="MDC-navbar-menu"><a href="${contextPath}/notification">Notifications
                      
                      </a>
                    </li>
                  </ul>
                  <div id="mySidenav" class="MDC-sidenav">
                    <a href="javascript:void(0)" class="MDC-closebtn" onclick="closeNav()">x</a>
                    <a href="${contextPath}/dashboard">Dashboard</a>
                    <a href="${contextPath}/projects">Projects</a>
                    <a href="${contextPath}/task/myTasks">My Tasks</a>
                    <a href="${contextPath}/notification">Notifications</a>
                    <a href="${contextPath}/profile">Profile</a>
                    <a href="${contextPath}/logout">Logout</a>
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
  
<!-- TITLE ROW -->
<div class="row  MDC-page-center MDC-page-container">
	<!-- TITLE -->	
  <div class="col MDC-padding-0 left">
    <div class="MDC-page-title-size">
      <font class="MDC-h5-style MDC-color-grey-dark-2 MDC-display-inline hide-on-small-and-down">My Tasks</font>
      <font class="MDC-h5-style MDC-color-grey-light-2 MDC-display-inline MDC-relative
                   MDC-news-counterBar-position hide-on-small-and-down">/
      </font>
      <!-- Dropdown Sorting -->
		  <a class='dropdown-button btn MDC-btn-dropdown-sort MDC-h5-style MDC-color-blue' 
		  	href='#' data-activates='sortDropdown'>${currentSorting}
		  	
		  </a>
      <i class="material-icons MDC-icon-small MDC-color-blue
                MDC-news-expand-icon-position MDC-relative">expand_more</i>
                
      <!-- Dropdown Structure -->
		  <c:url var="taskUrl" value="/projects/tasks" />
		  <ul id='sortDropdown' class='dropdown-content MDC-Dropdown-size'>
		  
		  	<li><a href="${taskUrl}/filter/Latest">Latest</a></li>
		    <li><a href="${taskUrl}/filter/Oldest">Oldest</a></li>
		    <li><a href="${taskUrl}/filter/Pending">Pending</a></li>
		    <li><a href="${taskUrl}/filter/Done">Done</a></li>
		    <li><a href="${taskUrl}/filter/Cancelled">Cancelled</a></li>
		    <li><a href="${taskUrl}/filter/Failed">Failed</a></li>
		  </ul>
		  
    </div>
  </div>  

</div>
<!-- TITLE ROW - END -->

<div class="MDC-page-center MDC-page-container">
	<div class="row MDC-page-margin-top">
	
 		<!-- TASKS -->
		<c:forEach items="${task}" var="tasks">
			<div class="col s12 m6 l3 MDC-padding-0 MDC-margin-bottom30 MDC-margin-card-Tablet">
				<!-- CARD -->
				<c:choose>
					<c:when test="${tasks.state=='1'}">
						<c:set var="backgroundColorIcon" value="MDC-background-blue" />
						<c:set var="floatIcon" value="query_builder" />
					</c:when>
					<c:when test="${tasks.state=='2'}">
						<c:set var="backgroundColorIcon" value="green" />
						<c:set var="floatIcon" value="done_all" />
					</c:when>   
					<c:when test="${tasks.state=='3'}">
						<c:set var="backgroundColorIcon" value="materialize-red" /> 
						<c:set var="floatIcon" value="clear" />
					</c:when>
					<c:when test="${tasks.state=='4'}">
						<c:set var="backgroundColorIcon" value="materialize-red" /> 
						<c:set var="floatIcon" value="block" />
					</c:when>
				</c:choose>
				
				<div class="MDC-card MDC-course-card-size"  onclick="<t:url value="/task/details?id=${tasks.id}&projectId=${tasks.project.id}" />">
					<a href=" <t:url value="/task/details?id=${tasks.id}&projectId=${tasks.project.id}" /> " 
						class="btn-floating btn waves-effect  MDC-absolute  right MDC-category-floatbtn-position ${backgroundColorIcon}">
			  		<i class="material-icons">${floatIcon}</i>
			  	</a>
			  	
			  	<!-- Image -->
				  <a href=" <t:url value="/task/details?id=${tasks.id}&projectId=${tasks.project.id}" /> ">
				  <div class="row center MDC-margin-top20">
				  	<img src="<c:url value="/static/images/default/tasks/${tasks.icon}.png"/>"
				    	class="MDC-avatar-circle-large MDC-shadow-default"/>
				  </div>
				  </a>
				  
				  <!-- Title -->
					<div class="row center MDC-margin-bottom-10">
				  	<font class="truncate MDC-font-15 MDC-color-grey-dark-2 MDC-font-h1">
				    	${tasks.name}
				    </font>
					</div>
					
					<!-- Description -->
       	<div class="row center MDC-margin-bottom-10">
        	<font class="truncate MDC-font-16-2 MDC-color-grey MDC-font-h1 MDC-uppercase-none">
          	Hours ${tasks.hours} / ${tasks.hoursUsed}
          </font>
      	</div>
      	
      	<!-- Project Date -->
        <div class="row MDC-margin-top10 MDC-width-80perc">
        <div class="MDC-divider"></div>
        	<font class="truncate MDC-font-16-2 MDC-uppercase-none MDC-font-h1 MDC-color-grey-dark-2">
          	Due Date:
         	</font>
        	<font class="MDC-color-grey">
        		<fmt:formatDate pattern="dd/MM/yyyy" value="${tasks.dueDate}" />
        	</font>
    		</div>
			  	
				</div>
			</div>
		</c:forEach>
		<!-- TASKS-END-->
		
	</div>
</div>

</body>
</html>