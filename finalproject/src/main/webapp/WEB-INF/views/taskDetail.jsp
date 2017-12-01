<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
  
  <script type="text/javascript">
    $(document).ready(function() {
    	
    	

      $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15, // Creates a dropdown of 15 years to control year,
        today: 'Today',
        clear: 'Clear',
        close: 'Ok',
        format: 'dd/mm/yyyy',
        closeOnSelect: false // Close upon selecting a date,
      });

      $('#textareaOverview').trigger('autoresize');
      
      $('#taskUser').material_select();
	     
    });
    
    function myFunc(item) {
    	var  selectedValue= $("#taskUser").val();
	    $('#userId').attr('value', item.value);
		}
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
                    <li class="MDC-navbar-menu"><a class="active MDC-navbar-active" href="${contextPath}/projects">Projects</a></li>
                    <li class="MDC-navbar-menu"><a href="${contextPath}/task/myTasks">My Tasks</a></li>
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

<!-- TITLE PAGE -->
<div class="row  MDC-page-center MDC-page-container">
  <div class="col MDC-padding-0 left">
    <div class="MDC-page-title-size">
      <font class="MDC-h5-style MDC-color-grey-dark-2 MDC-display-inline hide-on-small-and-down">Projects</font>
      <font class="MDC-h5-style MDC-color-grey-light-2 MDC-display-inline MDC-relative
                   MDC-news-counterBar-position hide-on-small-and-down">/
      </font>
      <font class="MDC-h5-style MDC-color-grey-dark-2 MDC-display-inline hide-on-small-and-down">${project.projectName}</font>
      <font class="MDC-h5-style MDC-color-grey-light-2 MDC-display-inline MDC-relative
                   MDC-news-counterBar-position hide-on-small-and-down">/
      </font>
      <font class="MDC-h5-style MDC-color-blue MDC-display-inline">${task.name}</font>
    </div>
  </div>
</div>
<!-- TITLE PAGE-END-->



<!-- CONTAINER-->
<form:form id="taskUpdate-form" method="POST" modelAttribute="task" class="form-horizontal" enctype="multipart/form-data">

<c:set var="disableField" value="true" />
<c:if test="${task.createUser == userLogin.username}">
	<c:set var="disableField" value="false" />
</c:if>




<div class="MDC-page-center MDC-page-container MDC-margin-top40">
	<div class="row MDC-float-none">
     	<!-- CONTEUDO -->
        <div class="col l10 MDC-padding-0 MDC-page-center MDC-float-none">
        <!-- TABS -->
        	<ul id="tabs-swipe" class="tabs MDC-tabs-style MDC-background-color">
            	<li class="tab col s4 MDC-background-color-white MDC-display-flex">
                	<a class="active MDC-color-grey-dark-2 breadcrumb" href="#overview-tab">Overview</a>
              </li>
              <li class="tab col s4 MDC-background-color MDC-display-flex">
                	<a class="MDC-color-grey-dark-2 breadcrumb" href="#finish-tab">Finish Task</a>
              </li>
					</ul>
            <!-- TABS-END -->
            <!-- OVERVIEW TAB -->
           	<div id="overview-tab">
            	<!-- CARD TAB -->
              	<div class="col s12 MDC-card">
                	<div class="MDC-card-news-container">
                	
                		<div class="row MDC-margin-bottom2">
                    	<div class="MDC-card-news-user-row">
                      	<div class="right MDC-font-12 MDC-color-grey MDC-margin-top10">Created by ${task.createUser}</div>
                        <div class="left MDC-font-12 MDC-color-grey MDC-margin-top10">
                        	<fmt:formatDate value="${task.createDate}" pattern="dd/MM/yyyy" />
                        </div>
                      </div>
                    </div>
                	
                	
                		<!-- Title -->
                        <div class="row MDC-margin-top40">
                           	<div class="input-field col s12">
                            	<form:input id="input_text" placeholder="Type of document you expect..." type="text"
                                	path="name" data-length="20" class="MDC-border-grey-light MDC-font-17 MDC-color-grey-dark-2
                                   										MDC-font-weight-300 " readonly="${disableField}" />
                                <label for="input_text">Title</label>
                           </div>
                        </div>
                        <!-- Title-END-->
                        <!-- Description -->
                        <div class="row MDC-margin-bottom40">
                        	<div class="input-field col s12">
                             	<form:textarea id="textareaOverview" placeholder="Tell the content here..."
                                	path="description"	class="materialize-textarea MDC-border-grey-light MDC-font-17 MDC-color-black
                                						MDC-font-weight-300" readonly="${disableField}"/>
                         		<label for="textareaOverview">Content</label>
                            </div>
                        </div>
                        <!-- Description-END-->
                       <!-- File Upload -->
                        <div class="file-field input-field MDC-margin-bottom40 MDC-margin-left10">
                        	<div class="btn waves-light blue MDC-form-text">
                            	<span>File</span>
                                <input type="file"  name="file" id="file">
                            </div>
                            <div class="file-path-wrapper">
	                            <input class="file-path validate MDC-border-grey-light MDC-font-17 MDC-color-grey-dark-2
	                            	MDC-font-weight-300 MDC-maxSize-60perc"
	                            	type="text" placeholder="Upload files">
                           	</div>
                    		</div>
                    	<!-- File Upload-END-->
                    	<!-- Links -->
                    	<div class="row MDC-margin-bottom40">
                    	<c:forEach items="${FilesProject}" var="FilesProjects">
                    		
                        	<a href="file://///${FilesProjects.location}" target="_blank">
                            	<div class="chip MDC-background-blue MDC-white-text">
                                	${FilesProjects.name}
                                    <i class="close material-icons">insert_drive_file</i>
                             	</div>
                       		</a>
                       	
                    	</c:forEach>
                    	</div>
                    	
                       
                        <!-- Links-END-->
                    	
                    	
                    	<!-- Due date -->
                    	<fmt:formatDate value="${task.dueDate}" pattern="dd/MM/yyyy" var="theFormattedDate"/>
                        <div class="row MDC-margin-bottom30">
	                        <div id="dueDateDiv" class="col MDC-maxSize-300">
	                        	<label for="datepicker1">Due Date</label>
	                        		<form:input id="datepicker1" type="date" path="dueDate" 
	                        			value=""
                                		placeholder="${theFormattedDate}"	
                                		class="datepicker MDC-border-grey-light 
                                		MDC-font-17 MDC-color-grey-dark-2 MDC-font-weight-300" readonly="${disableField}"/>
	                        </div>
                        </div>
                        <!-- Due date-END-->
                        
                        <!-- Hours -->      
                      <div class="row MDC-margin-bottom30">
                      	<div class="col MDC-maxSize-300">
                      		<form:input id="input_hours" placeholder="0.0 Hours" type="number" path="hours" step="0.1"
														class="MDC-border-grey-light MDC-font-17 MDC-color-grey-dark-2 MDC-font-weight-300" readonly="${disableField}"/>
                                <label for="input_hours">Hours</label>
                      	</div>
                      </div>
                      <!-- ASSIGN USER -->
                      <div class="row MDC-margin-bottom30">
                      	<div class="col MDC-maxSize-300">
                      		<label for="taskUser">Assign to</label>
                      		<form:select id="taskUser" itemValue="id" itemLabel="username"  path="user" items="${allUsers}" multiple="false"
                      		onchange="myFunc(this);"></form:select>
                      	</div>
                      </div>
                      
                      <input type="hidden" id="userId" name="userId" value="${userId}"/>
                      
                	</div>
                </div>
                <!-- CARD TAB-END-->
			</div>
      <!-- OVERVIEW TAB-END -->
      <!-- FINISH TAB -->
			<div id="finish-tab">
            	<!-- CARD TAB -->
                <div class="col s12 MDC-card">
                	<!-- CARD CONTAINER -->
                    <div class="MDC-card-news-container">
                    	<!-- User Information -->
                        <div class="row MDC-margin-bottom2">
                        	<div class="MDC-card-news-user-row">
                        		<div class="right MDC-font-12 MDC-color-grey MDC-margin-top10">
	                        		<c:choose>
									    <c:when test="${empty task.finishUser}">
									        
									    </c:when>
									    <c:otherwise>
									       Updated by ${task.finishUser}
									    </c:otherwise>
									</c:choose>
                        		</div>
                            	<div class="left MDC-font-12 MDC-color-grey MDC-margin-top10">
                            		
                            	</div>
                            </div>
                       	</div>
						<!-- Description -->
                        <div class="row MDC-margin-bottom40 MDC-margin-top40">
                        	<div class="input-field col s12">
                            	<form:textarea id="textareaFinish" placeholder="Tell the content here..."
                                	path="finishDesc"	class="materialize-textarea MDC-border-grey-light MDC-font-17 MDC-color-black
                                						MDC-font-weight-300"/>
                         		<label for="textareaFinish">Content</label>
                            </div>
                     	</div>

                		  <!-- Hours -->      
                      <div class="row MDC-margin-bottom30">
                      	<div class="col MDC-maxSize-300">
                      		<form:input id="input_hoursUsed" placeholder="0.0 Hours" type="number" path="hoursUsed" step="0.1"
														class="MDC-border-grey-light MDC-font-17 MDC-color-grey-dark-2 MDC-font-weight-300"/>
                                <label for="input_hoursUsed">Hours Used</label>
                      	</div>
                      </div>
                		
                		
                     	<!-- Status -->
                        <div class="row MDC-margin-bottom30">
                        	<div class="col">
                        		<form:radiobutton path="state" value="1" label="Pending" class="with-gap" checked="checked" 
                                    		name="state"/>
                        	</div>
                            <div class="col">
                            	<form:radiobutton path="state" value="2" label="Completed" class="with-gap" name="state"/>
                         	</div>
                            <div class="col">
                            	<form:radiobutton path="state" value="3" label="Cancelled" class="with-gap" name="state"/>
                       		</div>
                       		<div class="col">
                            	<form:radiobutton path="state" value="4" label="Failed" class="with-gap" name="state"/>
                       		</div>
                		</div>
                        <!-- Status-END-->
	   				</div>
                    <!-- CARD CONTAINER - END-->
      			</div>
                <!-- CARD TAB-END-->
        	</div>
			<!-- FINISH TAB -->
      <form:hidden path="icon" value="${task.icon}"/>
      <form:hidden path="taskType" value="${task.taskType}"/>
			
      
            <button id="salvar" type="submit" class="btn waves-effect waves-light
	        		blue MDC-form-text right" name="action">
	        		Save
	        	</button>

	        	<sec:authorize access="hasRole('Admin')">
			    		<a  href="<c:url value="/deleteTask?id=${task.id}" />"
								class="waves-effect waves-light btn red left">Delete</a>
			    	</sec:authorize>
			    	<c:if test="${task.createUser}==${userLogin.username}">
			       	<a  href="<c:url value="/deleteTask?id=${task.id}" />"
								class="waves-effect waves-light btn red left">Delete</a>
			    	</c:if>
	        	
        </div>
        <!-- CONTEUDO -->
	</div>
</div>
</form:form>

</body>
</html>
