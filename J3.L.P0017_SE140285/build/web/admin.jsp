<%-- 
    Document   : userPage
    Created on : Jun 10, 2021, 4:22:41 PM
    Author     : HoaiHao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>User Management</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
    body {
        color: #566787;
        background: #f5f5f5;
        font-family: 'Varela Round', sans-serif;
        font-size: 13px;
    }
    
    .table-wrapper {
        min-width: 1000px;
        background: #fff;
        padding: 20px 25px;
        border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
    .table-title {
        padding-bottom: 15px;
        background: #299be4;
        color: #fff;
        padding: 16px 30px;
        margin: -20px -25px 10px;
        border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
        margin: 5px 0 0;
        font-size: 24px;
    }
    .table-title .btn {
        color: #566787;
        float: right;
        font-size: 13px;
        background: #fff;
        border: none;
        min-width: 50px;
        border-radius: 2px;
        border: none;
        outline: none !important;
        margin-left: 10px;
    }
    .table-title .btn:hover, .table-title .btn:focus {
        color: #566787;
        background: #f2f2f2;
    }
    .table-title .btn i {
        float: left;
        font-size: 21px;
        margin-right: 5px;
    }
    .table-title .btn span {
        float: left;
        margin-top: 2px;
    }
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
        padding: 12px 15px;
        vertical-align: middle;
    }
    table.table tr th:first-child {
        width: 60px;
    }
    table.table tr th:last-child {
        width: 100px;
    }
    table.table-striped tbody tr:nth-of-type(odd) {
        background-color: #fcfcfc;
    }
    table.table-striped.table-hover tbody tr:hover {
        background: #f5f5f5;
    }
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }	
    table.table td:last-child i {
        opacity: 0.9;
        font-size: 22px;
        margin: 0 5px;
    }
    table.table td a {
        font-weight: bold;
        color: #566787;
        display: inline-block;
        text-decoration: none;
    }
    table.table td a:hover {
        color: #2196F3;
    }
    table.table td a.addtolist {
        color: green;
    }
    table.table td a.settings {
        color: #2196F3;
    }
    table.table td a.delete {
        color: #F44336;
    }
    table.table td i {
        font-size: 19px;
    }
    table.table .avatar {
        border-radius: 50%;
        vertical-align: middle;
        margin-right: 10px;
    }
    .status {
        font-size: 30px;
        margin: 2px 2px 0 0;
        display: inline-block;
        vertical-align: middle;
        line-height: 10px;
    }
    .text-success {
        color: #10c469;
    }
    .text-info {
        color: #62c9e8;
    }
    .text-warning {
        color: #FFC107;
    }
    .text-danger {
        color: #ff5b5b;
    }
    .pagination {
        float: right;
        margin: 0 0 5px;
    }
    .pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
    }
    .pagination li a:hover {
        color: #666;
    }	
    .pagination li.active a, .pagination li.active a.page-link {
        background: #03A9F4;
    }
    .pagination li.active a:hover {        
        background: #0397d6;
    }
    .pagination li.disabled i {
        color: #ccc;
    }
    .pagination li i {
        font-size: 16px;
        padding-top: 6px
    }
    .hint-text {
        float: left;
        margin-top: 10px;
        font-size: 13px;
    }
    .search-box {
        position: relative;        
        float: right;
    }
    .search-box input {
        height: 34px;
        border-radius: 20px;
        padding-left: 35px;
        border-color: #ddd;
        box-shadow: none;
    }
    .search-box input:focus {
        border-color: #3FBAE4;
    }
    .search-box i {
        color: #a0a5b1;
        position: absolute;
        font-size: 19px;
        top: 8px;
        left: 10px;
    }
    .profile-img-card {
        width: 125px;
        height: 125px;
        margin: 0 auto 10px;
        display: block;
        -moz-border-radius: 50%;
        -webkit-border-radius: 50%;
        border-radius: 50%;
    }
    .modal-confirm {		
	color: #434e65;
	width: 525px;
    }
    .modal-confirm .modal-content {
            padding: 20px;
            font-size: 16px;
            border-radius: 5px;
            border: none;
    }
    .modal-confirm .modal-header {
            background: #47c9a2;
            border-bottom: none;   
            position: relative;
            text-align: center;
            margin: -20px -20px 0;
            border-radius: 5px 5px 0 0;
            padding: 35px;
    }
    .modal-confirm h4 {
            text-align: center;
            font-size: 36px;
            margin: 10px 0;
    }
    .modal-confirm .form-control, .modal-confirm .btn {
            min-height: 40px;
            border-radius: 3px; 
    }
    .modal-confirm .close {
            position: absolute;
            top: 15px;
            right: 15px;
            color: #fff;
            text-shadow: none;
            opacity: 0.5;
    }
    .modal-confirm .close:hover {
            opacity: 0.8;
    }
    .modal-confirm .icon-box {
            color: #fff;		
            width: 95px;
            height: 95px;
            display: inline-block;
            border-radius: 50%;
            z-index: 9;
            border: 5px solid #fff;
            padding: 15px;
            text-align: center;
    }
    .modal-confirm .icon-box i {
            font-size: 64px;
            margin: -4px 0 0 -4px;
    }
    .modal-confirm.modal-dialog {
            margin-top: 80px;
    }
    .modal-confirm .btn, .modal-confirm .btn:active {
            background: #47c9a2 !important;
            color: #fff;
            border: none;
    }
    .modal-confirm .btn:hover, .modal-confirm .btn:focus {
            background: #2c9777 !important;
            outline: none;
    }
    .modal-confirm-fail {		
            color: #434e65;
            width: 525px;
    }
    .modal-confirm-fail .modal-content {
            padding: 20px;
            font-size: 16px;
            border-radius: 5px;
            border: none;
    }
    .modal-confirm-fail .modal-header {
            background: #e85e6c;
            border-bottom: none;   
            position: relative;
            text-align: center;
            margin: -20px -20px 0;
            border-radius: 5px 5px 0 0;
            padding: 35px;
    }
    .modal-confirm-fail h4 {
            text-align: center;
            font-size: 36px;
            margin: 10px 0;
    }
    .modal-confirm-fail .form-control, .modal-confirm .btn {
            min-height: 40px;
            border-radius: 3px; 
    }
    .modal-confirm-fail .close {
            position: absolute;
            top: 15px;
            right: 15px;
            color: #fff;
            text-shadow: none;
            opacity: 0.5;
    }
    .modal-confirm-fail .close:hover {
            opacity: 0.8;
    }
    .modal-confirm-fail .icon-box {
            color: #fff;		
            width: 95px;
            height: 95px;
            display: inline-block;
            border-radius: 50%;
            z-index: 9;
            border: 5px solid #fff;
            padding: 15px;
            text-align: center;
    }
    .modal-confirm-fail .icon-box i {
            font-size: 58px;
            margin: -2px 0 0 -2px;
    }
    .modal-confirm-fail.modal-dialog {
            margin-top: 80px;
    }
    .modal-confirm-fail .btn, .modal-confirm-fail .btn:active {
            color: #fff;
            border-radius: 4px;
            background: #e85e6c !important;
            border: none;
    }
    .modal-confirm-fail .btn:hover, .modal-confirm-fail .btn:focus {
            background: #da1f32 !important;
            outline: none;
    }
    </style>
    <script>
        $(document).ready(function(){
                $('[data-toggle="tooltip"]').tooltip();
                $('[data-toggle="modal"]').tooltip();
        });
        
        function changeSelectRole() {
            document.getElementById("roleSearchForm").submit();
        };
        function initCheck() {
            <c:if test="${not empty requestScope.CREATEERROR}">
                $("#createUserModal").modal();    
            </c:if>
            <c:if test="${not empty requestScope.ADDSUCCESS}">
                $("#addToPromotionSuccess").modal();
            </c:if>
            <c:if test="${not empty requestScope.ADDFAIL}">
                $("#addToPromotionFail").modal();
            </c:if>
        };
    </script>
    </head>
    <body onload="initCheck()">
        <c:if test="${not empty sessionScope.USER}">
            <c:if test="${sessionScope.ADMIN}">
                <div style="width: 100%">
                    <div class="table-responsive">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-5">
                                        <h2>User <b>Management</b></h2>
                                    </div>
                                    <div class="col-sm-7">
                                        <a data-toggle="modal" data-target="#createUserModal" class="btn btn-secondary"><i class="material-icons">&#xE147;</i> <span>Add New User</span></a>					
                                        <a href="promotionList.jsp" class="btn btn-secondary"><i class="material-icons">&#9776;</i> <span>Promotion List</span></a>
                                        <a href="initHistory" class="btn btn-secondary"><i class="fa fa-history"></i> <span>Promotion History</span></a>
                                        <a href="userPage.jsp" class="btn btn-secondary"><i class="material-icons">&#9998;</i> <span>Profile</span></a>	
                                    </div>
                                </div>
                            </div>
                            <div>
                                Welcome, <b>${sessionScope.USER}</b> <a href="logout">Log out</a>
                            </div>
                            <div>
                                <div class="search-box">
                                    <form action="search">
                                        <i class="material-icons">&#xE8B6;</i>
                                        <input type="text" class="form-control" placeholder="Search&hellip;" value="${param.txtSearch}" name="txtSearch">
                                        <input type="submit" 
                                            style="position: absolute; left: -9999px; width: 1px; height: 1px;"
                                            tabindex="-1" />
                                    </form>
                                </div>
                            </div>
                            <form id="roleSearchForm" action="search">
                                <div class="input-group mb-3" style="padding-right: 85%;">
                                    <div class="input-group-prepend shadow-sm">
                                        <label class="input-group-text" for="roleSelect">Role</label>
                                    </div>
                                    <c:set var="roles" value="${sessionScope.ROLES}"/>
                                    <select onchange="changeSelectRole()" class="custom-select shadow-sm" name="role" id="roleSelect" style="width: 30%;">
                                        <option value="All"
                                                <c:if test="${'All' eq param.role}">
                                                        selected
                                                </c:if>
                                                >
                                            All
                                        </option>
                                        <c:forEach var="dto" items="${roles}">
                                            <option value="${dto.roleName}"
                                                    <c:if test="${dto.roleName eq param.role}">
                                                        selected
                                                    </c:if>
                                                    >
                                                ${dto.roleName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </form>
                            <c:set var="results" value="${requestScope.RESULTS}" />
                            <c:if test="${not empty results}">
                                <table class="table table-striped table-hover" style="margin-top: 10px;">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Name</th>						
                                            <th>Phone</th>
                                            <th>Email</th>
                                            <th>Role</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="dto" items="${results}" varStatus="counter">
                                            <tr>
                                                <td>${counter.count}</td>
                                                <td><a href="#"><img src="${dto.photo}" width="60px" height="60px" class="avatar" alt="Avatar"> ${dto.userName}</a></td>
                                                <td>${dto.phone}</td>
                                                <td>${dto.email}</td>
                                                <td>${dto.roleName}</td>
                                                <td>${dto.status}</td>
                                                <c:if test="${sessionScope.USERID ne dto.userID}">
                                                    <td style="width: 10%;" >
                                                        <c:url var="addToPromotionLink" value="addToPromotion">
                                                            <c:param name="txtUserID" value="${dto.userID}"/>
                                                        </c:url>
                                                        <c:url var="updateLink" value="initUpdate">
                                                            <c:param name="txtUserID" value="${dto.userID}"/>
                                                        </c:url>
                                                        <c:url var="delLink" value="deleteUser">
                                                            <c:param name="txtSearchValue" value="${param.txtSearch}"/>
                                                            <c:param name="txtRoleValue" value="${param.role}"/>
                                                            <c:param name="txtUserID" value="${dto.userID}"/>
                                                        </c:url>
                                                        <a href="${addToPromotionLink}" class="addtolist" title="Add to promotion list" data-toggle="tooltip"><i class="material-icons">&#xE147;</i></a>
                                                        <a href="${updateLink}" class="settings" title="Update" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>
                                                        <a href="#" data-toggle="modal" data-target="#${dto.userID}confirm-delete" class="delete" title="Delete"><i class="material-icons">&#xE5C9;</i></a>
                                                    </td>
                                                </c:if>
                                            </tr>
                                            <%-- delete modal --%>
                                            <div class="modal fade" id="${dto.userID}confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Confirm Delete</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                              <span aria-hidden="true">&times;</span>
                                                            </button>
                                                          </div>
                                                        <div class="modal-body" style="font-size: 1rem;">
                                                            <p>You are about to delete user <strong>${dto.userName}</strong>.</p>
                                                            <p>Do you want to delete?</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                            <a href="${delLink}" class="btn btn-danger" style="color: white;">Delete</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${empty results}">
                                <div class="pl-3" style="font-size: 1.5rem;">
                                    No result !
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
                            
                <%--add to promotion list success modal --%>
                <div id="addToPromotionSuccess" class="modal fade">
                    <div class="modal-dialog modal-confirm">
                            <div class="modal-content">
                                    <div class="modal-header justify-content-center">
                                            <div class="icon-box">
                                                <i class="material-icons" style="list-style-type: none;">&#xE876;</i>
                                            </div>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body text-center">
                                            <h4>Added!</h4>	
                                            <p>${requestScope.ADDSUCCESS}</p>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                                    </div>
                            </div>
                    </div>
                </div>
                          
                <%--add to promotion list fail modal --%>
                <div id="addToPromotionFail" class="modal fade">
                    <div class="modal-dialog modal-confirm-fail">
                            <div class="modal-content">
                                    <div class="modal-header justify-content-center">
                                            <div class="icon-box">
                                                <i class="material-icons" style="list-style-type: none;">&#xE14C;</i>
                                            </div>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body text-center">
                                            <h4>OOPS!</h4>	
                                            <p>${requestScope.ADDFAIL}</p>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                                    </div>
                            </div>
                    </div>
                </div> 
                                            
                <!-- Create new user modal -->
                <div class="modal fade" id="createUserModal" tabindex="-1" role="dialog" aria-labelledby="CreateNewUser" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <form id="createForm" action="create" method="post">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">New user</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                        <div class="modal-body">
                                <c:if test="${not empty requestScope.CREATEERROR}">
                                    <c:if test="${not empty param.createImageSource}">
                                        <img id="profile-img" class="profile-img-card" src="${param.createImageSource}" />
                                    </c:if>
                                    <c:if test="${empty param.createImageSource}">
                                        <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
                                    </c:if>
                                    <div class="form-group row">
                                        <div class="custom-file" style="margin-left: 63px; margin-right: 63px;">
                                            <input type="file" class="custom-file-input" id="createImageSource" name="createImageSource" value="${param.createImageSource}">
                                            <input type="hidden" name="photo" value="${param.createImageSource}" id ="hiddenSource"/>
                                            <label class="custom-file-label" for="imageSource">Choose file...</label>
                                        </div>
                                    </div>
                                    <c:if test="${not empty requestScope.CREATEERROR}">
                                        <c:if test="${not empty requestScope.CREATEERROR.photoError}">
                                            <div class="alert alert-danger" role="alert" style="margin-left: 50px; margin-right: 50px;">
                                                ${requestScope.CREATEERROR.photoError}
                                            </div>
                                        </c:if>
                                    </c:if>
                                    <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                        <label for="uid" style="opacity: 0.54;">User ID</label>
                                        <input type="text" class="form-control" id="uid" placeholder="Enter User ID" name="txtCreateUserID" value="${param.txtCreateUserID}" required/>
                                    </div>
                                    <c:if test="${not empty requestScope.CREATEERROR}">
                                        <c:if test="${not empty requestScope.CREATEERROR.userIDError}">
                                            <div class="alert alert-danger" role="alert" style="margin-left: 50px; margin-right: 50px;">
                                                ${requestScope.CREATEERROR.userIDError}
                                            </div>
                                        </c:if>
                                    </c:if>
                                    <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                        <label for="upw" style="opacity: 0.54;">Password</label>
                                        <input type="password" class="form-control" id="upw" placeholder="Enter password" name="txtCreatePassword" required/>
                                    </div>
                                    <c:if test="${not empty requestScope.CREATEERROR}">
                                        <c:if test="${not empty requestScope.CREATEERROR.passwordError}">
                                            <div class="alert alert-danger" role="alert" style="margin-left: 50px; margin-right: 50px;">
                                                ${requestScope.CREATEERROR.passwordError}
                                            </div>
                                        </c:if>
                                    </c:if>
                                    <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                        <label for="ucpw" style="opacity: 0.54;">Confirm password</label>
                                        <input type="password" class="form-control" id="ucpw" placeholder="Confirm password" name="txtCreateConfirmPassword" required/>
                                    </div>
                                    <c:if test="${not empty requestScope.CREATEERROR}">
                                        <c:if test="${not empty requestScope.CREATEERROR.confirmPasswordError}">
                                            <div class="alert alert-danger" role="alert" style="margin-left: 50px; margin-right: 50px;">
                                                ${requestScope.CREATEERROR.confirmPasswordError}
                                            </div>
                                        </c:if>
                                    </c:if>
                                    <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                        <label for="un" style="opacity: 0.54;">UserName</label>
                                        <input type="text" class="form-control" id="un" placeholder="Enter userName" name="txtCreateUserName" value="${param.txtCreateUserName}" required/>
                                    </div>
                                    <c:if test="${not empty requestScope.CREATEERROR}">
                                        <c:if test="${not empty requestScope.CREATEERROR.userNameError}">
                                            <div class="alert alert-danger" role="alert" style="margin-left: 50px; margin-right: 50px;">
                                                ${requestScope.CREATEERROR.userNameError}
                                            </div>
                                        </c:if>
                                    </c:if>
                                    <div style="margin-left: 50px; margin-right: 50px;">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend shadow-sm">
                                                <label class="input-group-text" for="roleCreateSelect">Role</label>
                                            </div>
                                            <c:set var="roles" value="${sessionScope.ROLES}"/>
                                            <select class="custom-select shadow-sm" name="txtCreateRole" id="roleCreateSelect" style="width: 10%;">
                                                <c:forEach var="dto" items="${roles}">
                                                    <option value="${dto.roleName}"
                                                            <c:if test="${param.txtCreateRole eq dto.roleName}">
                                                                selected
                                                            </c:if>
                                                            >
                                                        ${dto.roleName}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                        <label for="uem" style="opacity: 0.54;">Email</label>
                                        <input type="email" class="form-control" id="uem" placeholder="Enter email" name="txtCreateEmail" value="${param.txtCreateEmail}" required/>
                                    </div>
                                    <c:if test="${not empty requestScope.CREATEERROR}">
                                        <c:if test="${not empty requestScope.CREATEERROR.emailError}">
                                            <div class="alert alert-danger" role="alert" style="margin-left: 50px; margin-right: 50px;">
                                                ${requestScope.CREATEERROR.emailError}
                                            </div>
                                        </c:if>
                                    </c:if>
                                    <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                        <label for="up" style="opacity: 0.54;">Phone number</label>
                                        <input type="text" class="form-control" id="up" placeholder="Enter phone" name="txtCreatePhone" value="${param.txtCreatePhone}" required/>
                                    </div>
                                    <c:if test="${not empty requestScope.CREATEERROR}">
                                        <c:if test="${not empty requestScope.CREATEERROR.phoneError}">
                                            <div class="alert alert-danger" role="alert" style="margin-left: 50px; margin-right: 50px;">
                                                ${requestScope.CREATEERROR.phoneError}
                                            </div>
                                        </c:if>
                                    </c:if>
                                </c:if>
                                <c:if test="${empty requestScope.CREATEERROR}">
                                    <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
                                    <div class="form-group row">
                                        <div class="custom-file" style="margin-left: 63px; margin-right: 63px;">
                                            <input type="file" class="custom-file-input" id="createImageSource" name="createImageSource" required>
                                            <input type="hidden" name="photo" id ="hiddenSource"/>
                                            <label class="custom-file-label" for="imageSource">Choose file...</label>
                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                        <label for="uid" style="opacity: 0.54;">User id</label>
                                        <input type="text" class="form-control" id="uid" placeholder="Enter user id" name="txtCreateUserID" required/>
                                    </div>
                                    <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                        <label for="upw" style="opacity: 0.54;">Password</label>
                                        <input type="password" class="form-control" id="upw" placeholder="Enter password" name="txtCreatePassword" required/>
                                    </div>
                                    <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                        <label for="ucpw" style="opacity: 0.54;">Confirm password</label>
                                        <input type="password" class="form-control" id="ucpw" placeholder="Confirm password" name="txtCreateConfirmPassword" required/>
                                    </div>
                                    <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                        <label for="un" style="opacity: 0.54;">UserName</label>
                                        <input type="text" class="form-control" id="un" placeholder="Enter userName" name="txtCreateUserName" required/>
                                    </div>
                                    <div style="margin-left: 50px; margin-right: 50px;">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend shadow-sm">
                                                <label class="input-group-text" for="roleCreateSelect">Role</label>
                                            </div>
                                            <c:set var="roles" value="${sessionScope.ROLES}"/>
                                            <select class="custom-select shadow-sm" name="txtCreateRole" id="roleCreateSelect" style="width: 10%;">
                                                <c:forEach var="dto" items="${roles}">
                                                    <option value="${dto.roleName}"
                                                            >
                                                        ${dto.roleName}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                        <label for="uem" style="opacity: 0.54;">Email</label>
                                        <input type="email" class="form-control" id="uem" placeholder="Enter email" name="txtCreateEmail" required/>
                                    </div>
                                    <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                        <label for="up" style="opacity: 0.54;">Phone number</label>
                                        <input type="text" class="form-control" id="up" placeholder="Enter phone" name="txtCreatePhone" required/>
                                    </div>
                            </c:if>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeCreate()">Close</button>
                        <button type="submit" class="btn btn-primary">Create</button>
                        </div>
                    </form>
                    </div>
                  </div>
                </div>

                <script>
                    window.addEventListener('load', function () {
                        document.getElementById('createImageSource').addEventListener('change', function () {
                            if (this.files && this.files[0]) {
                                var img = document.getElementById('profile-img');
                                var file = document.getElementById('createImageSource');
                                var source = document.getElementById('createHiddenSource');
                                img.src = file.value; // set source to blob url
                                source.setAttribute('value', file.value);
                            }
                        });
                    });
                 </script>
            </c:if>
            <c:if test="${!sessionScope.ADMIN}">
                <a href="login.html">Login</a>
            </c:if>
        </c:if>
        <c:if test="${empty sessionScope.USER}">
            <a href="login.html">Login</a>
        </c:if>
    </body>
    </html>
