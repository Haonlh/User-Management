<%-- 
    Document   : userPage
    Created on : Jun 17, 2021, 4:21:41 PM
    Author     : HoaiHao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Information</title>
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
    </style>
    <script>
        $(document).ready(function(){
                $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
    </head>
    <body>
    <c:if test="${not empty sessionScope.USER}">
           
                <c:set var="dto" value="${sessionScope.USERINFOR}" />
                <div style="width: 100%">
                    <div class="table-responsive">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-5">
                                        <h2>User <b>profile</b></h2>
                                    </div>
                                    <c:if test="${sessionScope.ADMIN}">
                                        <div class="col-sm-7">		
                                            <a href="initSearch" class="btn btn-secondary"><i class="material-icons">&larr;</i> <span>Back to admin page</span></a>	
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            <div>
                                Welcome, <b>${sessionScope.USER}</b> <a href="logout">Log out</a>
                            </div>
                            <div id="updateUserModal" tabindex="-1" role="dialog" aria-labelledby="UpdateUser" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                              <div class="modal-content">
                                <form id="updateForm" action="update" method="post">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel">User information</h5>
                                </div>
                                  <div class="modal-body">
                                      <div class="form-group" style="margin-left: 50px; margin-right: 50px; font-size: 1rem;">
                                            <a href="#">User: <strong>${dto.userID}</strong></a>
                                      </div>
                                      <div class="form-group" style="margin-left: 50px; margin-right: 50px; font-size: 1rem;">
                                            Role: <strong>${dto.roleName}</strong>
                                        </div>
                                      <input type="hidden" name="txtUserID" value="${dto.userID}"/>
                                      <input type="hidden" name="txtUpdateRole" value="${dto.roleName}"/>
                                        <img id="profile-img" class="profile-img-card" src="${dto.photo}" />
                                        <div class="form-group row">
                                            <div class="custom-file" style="margin-left: 63px; margin-right: 63px;">
                                                <input type="file" class="custom-file-input" id="createImageSource" name="updateImageSource" value="${dto.photo}">
                                                <input type="hidden" name="photo" value="${dto.photo}" id ="hiddenSource"/>
                                                <input type="hidden" name="defaultPhoto" value="${dto.photo}"/>
                                                <label class="custom-file-label" for="imageSource">Choose file...</label>
                                            </div>
                                        </div>
                                        <c:if test="${not empty requestScope.UPDATEERROR}">
                                            <c:if test="${not empty requestScope.UPDATEERROR.photoError}">
                                                <div class="alert alert-danger" role="alert" style="margin-left: 50px; margin-right: 50px;">
                                                    ${requestScope.UPDATEERROR.photoError}
                                                </div>
                                            </c:if>
                                        </c:if>
                                        <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                            <label for="un" style="opacity: 0.54;">Username</label>
                                            <input type="text" class="form-control" id="un" placeholder="Enter username" name="txtUpdateUserName" value="${dto.userName}" required/>
                                        </div>
                                        <c:if test="${not empty requestScope.UPDATEERROR}">
                                            <c:if test="${not empty requestScope.UPDATEERROR.userNameError}">
                                                <div class="alert alert-danger" role="alert" style="margin-left: 50px; margin-right: 50px;">
                                                    ${requestScope.UPDATEERROR.userNameError}
                                                </div>
                                            </c:if>
                                        </c:if>
                                        <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                            <label for="upw" style="opacity: 0.54;">New password</label>
                                            <input type="password" class="form-control" id="upw" placeholder="Enter new password" name="txtUpdatePassword" />
                                        </div>
                                        <c:if test="${not empty requestScope.UPDATEERROR}">
                                            <c:if test="${not empty requestScope.UPDATEERROR.passwordError}">
                                                <div class="alert alert-danger" role="alert" style="margin-left: 50px; margin-right: 50px;">
                                                    ${requestScope.UPDATEERROR.passwordError}
                                                </div>
                                            </c:if>
                                        </c:if>
                                        <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                            <label for="ucpw" style="opacity: 0.54;">Confirm new password</label>
                                            <input type="password" class="form-control" id="ucpw" placeholder="Confirm new password" name="txtUpdateConfirmPassword" />
                                        </div>
                                        <c:if test="${not empty requestScope.UPDATEERROR}">
                                            <c:if test="${not empty requestScope.UPDATEERROR.confirmPasswordError}">
                                                <div class="alert alert-danger" role="alert" style="margin-left: 50px; margin-right: 50px;">
                                                    ${requestScope.UPDATEERROR.confirmPasswordError}
                                                </div>
                                            </c:if>
                                        </c:if>
                                        <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                            <label for="uem" style="opacity: 0.54;">Email</label>
                                            <input type="email" class="form-control" id="uem" placeholder="Enter email" name="txtUpdateEmail" value="${dto.email}" required/>
                                        </div>
                                        <c:if test="${not empty requestScope.UPDATEERROR}">
                                            <c:if test="${not empty requestScope.UPDATEERROR.emailError}">
                                                <div class="alert alert-danger" role="alert" style="margin-left: 50px; margin-right: 50px;">
                                                    ${requestScope.UPDATEERROR.emailError}
                                                </div>
                                            </c:if>
                                        </c:if>
                                        <div class="form-group" style="margin-left: 50px; margin-right: 50px;">
                                            <label for="up" style="opacity: 0.54;">Phone number</label>
                                            <input type="text" class="form-control" id="up" placeholder="Enter phone" name="txtUpdatePhone" value="${dto.phone}" required/>
                                        </div>
                                        <c:if test="${not empty requestScope.UPDATEERROR}">
                                            <c:if test="${not empty requestScope.UPDATEERROR.phoneError}">
                                                <div class="alert alert-danger" role="alert" style="margin-left: 50px; margin-right: 50px;">
                                                    ${requestScope.UPDATEERROR.phoneError}
                                                </div>
                                            </c:if>
                                        </c:if>
                                  </div>
                                  <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary">Update</button>
                                  </div>
                              </form>
                              </div>
                            </div>
                          </div>
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
        <c:if test="${empty sessionScope.USER}">
            <a href="login.html">Login</a>
        </c:if>
    </body>
</html>
