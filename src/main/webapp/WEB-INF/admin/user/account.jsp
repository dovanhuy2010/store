<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/5/2022
  Time: 4:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--
Template Name: Vuexy - Vuejs, HTML & Laravel Admin Dashboard Template
Author: PixInvent
Website: http://www.pixinvent.com/
Contact: hello@pixinvent.com
Follow: www.twitter.com/pixinvents
Like: www.facebook.com/pixinvents
Purchase: https://1.envato.market/vuexy_admin
Renew Support: https://1.envato.market/vuexy_admin
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.

-->
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<!-- Mirrored from pixinvent.com/demo/vuexy-html-bootstrap-admin-template/html/ltr/vertical-menu-template/page-account-settings.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 25 Aug 2021 02:09:41 GMT -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="description"
          content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords"
          content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Account Settings</title>
    <link rel="apple-touch-icon" href="<c:url value='/template/admin/images/ico/apple-icon-120.html'/>">
    <link rel="shortcut icon" type="image/x-icon"
          href="https://pixinvent.com/demo/vuexy-html-bootstrap-admin-template/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600"
          rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" href="<c:url value='/template/admin/vendors/css/vendors.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/vendors/css/forms/select/select2.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/vendors/css/pickers/flatpickr/flatpickr.min.css'/>">

    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" href="<c:url value='/template/admin/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/bootstrap-extended.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/colors.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/components.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/themes/dark-layout.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/themes/bordered-layout.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/themes/semi-dark-layout.min.css'/>">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" href="<c:url value='/template/admin/css/core/menu/menu-types/vertical-menu.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/plugins/forms/pickers/form-pickadate.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/plugins/forms/pickers/form-flat-pickr.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/plugins/forms/form-validation.css'/>">

    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <%--    <link rel="stylesheet" type="text/css" href="../../../assets/css/style.css">--%>
    <!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->
<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static  " data-open="click"
      data-menu="vertical-menu-modern" data-col="">

<!-- BEGIN: Header-->
<jsp:include page="../common/head.jsp"/>
<!-- END: Header-->


<!-- BEGIN: Main Menu-->
<jsp:include page="../common/menuNav.jsp"/>
<!-- END: Main Menu-->

<!-- BEGIN: Content-->
<div class="app-content content ">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper container-xxl p-0">
        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-start mb-0">Account Settings</h2>
                        <div class="breadcrumb-wrapper">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<c:url value="/admin/home"/>">Home</a>
                                </li>
                                <li class="breadcrumb-item"><a href="#">Pages</a>
                                </li>
                                <li class="breadcrumb-item active"> Account Settings
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-header-right text-md-end col-md-3 col-12 d-md-block d-none">
                <%--                <div class="mb-1 breadcrumb-right">--%>
                <%--                    <div class="dropdown">--%>
                <%--                        <button class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle" type="button"--%>
                <%--                                data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i--%>
                <%--                                data-feather="grid"></i></button>--%>
                <%--                        <div class="dropdown-menu dropdown-menu-end"><a class="dropdown-item" href="app-todo.html"><i--%>
                <%--                                class="me-1" data-feather="check-square"></i><span--%>
                <%--                                class="align-middle">Todo</span></a><a class="dropdown-item" href="app-chat.html"><i--%>
                <%--                                class="me-1" data-feather="message-square"></i><span--%>
                <%--                                class="align-middle">Chat</span></a><a class="dropdown-item" href="app-email.html"><i--%>
                <%--                                class="me-1" data-feather="mail"></i><span class="align-middle">Email</span></a><a--%>
                <%--                                class="dropdown-item" href="app-calendar.html"><i class="me-1"--%>
                <%--                                                                                  data-feather="calendar"></i><span--%>
                <%--                                class="align-middle">Calendar</span></a></div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
        </div>
        <div class="content-body">
            <!-- account setting page -->
            <section id="page-account-settings">
                <div class="row">
                    <!-- left menu section -->
                    <div class="col-md-3 mb-2 mb-md-0">
                        <ul class="nav nav-pills flex-column nav-left">
                            <!-- general -->
                            <li class="nav-item">
                                <a
                                        class="nav-link active"
                                        id="account-pill-general"
                                        data-bs-toggle="pill"
                                        href="#account-vertical-general"
                                        aria-expanded="true"
                                >
                                    <i data-feather="user" class="font-medium-3 me-1"></i>
                                    <span class="fw-bold">General</span>
                                </a>
                            </li>
                            <!-- change password -->
                            <li class="nav-item">
                                <a
                                        class="nav-link"
                                        id="account-pill-password"
                                        data-bs-toggle="pill"
                                        href="#account-vertical-password"
                                        aria-expanded="false"
                                >
                                    <i data-feather="lock" class="font-medium-3 me-1"></i>
                                    <span class="fw-bold">Change Password</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!--/ left menu section -->

                    <!-- right content section -->
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-body">
                                <div class="tab-content">
                                    <!-- general tab -->
                                    <div
                                            role="tabpanel"
                                            class="tab-pane active"
                                            id="account-vertical-general"
                                            aria-labelledby="account-pill-general"
                                            aria-expanded="true"
                                    >
                                        <!-- header section -->
                                        <div class="d-flex">
                                            <a href="#" class="me-25">
                                                <img
                                                        src="<c:url value="/template/admin/images/avatars/account.png"/>"
                                                        id="account-upload-img"
                                                        class="rounded me-50"
                                                        alt="profile image"
                                                        height="80"
                                                        width="80"
                                                />
                                            </a>

                                            <!-- upload and reset button -->

                                            <!--/ upload and reset button -->
                                        </div>
                                        <!--/ header section -->

                                        <!-- form -->
                                        <form:form class="validate-form mt-2" id="form-account"
                                                   modelAttribute="accountSet">
                                            <div class="row">
                                                <div class="col-12 col-sm-6">
                                                    <div class="mb-1">
                                                        <label class="form-label" for="account-name">Name</label>
                                                        <form:input
                                                                type="text"
                                                                class="form-control"
                                                                id="account-name"
                                                                name="name"
                                                                placeholder="Name"
                                                                path="name"
                                                        />
                                                    </div>
                                                    <div class="invalid-feedback" style="display: block;"></div>
                                                </div>
                                                <div class="col-12 col-sm-6">
                                                    <div class="mb-1">
                                                        <label class="form-label" for="account-e-mail">E-mail</label>
                                                        <form:input
                                                                type="email"
                                                                class="form-control"
                                                                id="account-e-mail"
                                                                name="email"
                                                                placeholder="Email"
                                                                path="email"
                                                        />
                                                    </div>
                                                    <div class="invalid-feedback" style="display: block;"></div>
                                                </div>
                                                <div class="col-12 col-sm-6">
                                                    <div class="mb-1">
                                                        <label class="form-label" for="account-phone">Phone</label>
                                                        <form:input
                                                                type="number"
                                                                class="form-control"
                                                                id="account-phone"
                                                                name="phone"
                                                                placeholder="Phone"
                                                                path="phone"
                                                        />
                                                    </div>
                                                    <div class="invalid-feedback" style="display: block;"></div>
                                                </div>
                                                    <%--                                                <div class="col-12 col-sm-6">--%>
                                                    <%--                                                    <form:input path="id" id="account-id" type="hidden"/>--%>
                                                    <%--                                                </div>--%>


                                            </div>
                                        </form:form>
                                        <!--/ form -->
                                        <div class="col-12">
                                            <button type="submit" class="btn btn-primary mt-2 me-1"
                                                    id="btn-formAccount">Save
                                                changes
                                            </button>
                                            <button type="reset" class="btn btn-outline-secondary mt-2">Cancel
                                            </button>
                                        </div>
                                    </div>
                                    <!--/ general tab -->

                                    <!-- change password -->
                                    <div
                                            class="tab-pane fade"
                                            id="account-vertical-password"
                                            role="tabpanel"
                                            aria-labelledby="account-pill-password"
                                            aria-expanded="false"
                                    >
                                        <!-- form -->
                                        <form class="validate-form">
                                            <div class="row">
                                                <div class="col-12 col-sm-6">
                                                    <div class="mb-1">
                                                        <label class="form-label" for="account-old-password">Old
                                                            Password</label>
                                                        <div class="input-group form-password-toggle input-group-merge">
                                                            <input
                                                                    type="password"
                                                                    class="form-control"
                                                                    id="account-old-password"
                                                                    name="password"
                                                                    placeholder="Old Password"
                                                            />
                                                            <div class="input-group-text cursor-pointer">
                                                                <i data-feather="eye"></i>
                                                            </div>
                                                        </div>
                                                        <div class="invalid-feedback" style="display: block;"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-sm-6">
                                                    <div class="mb-1">
                                                        <label class="form-label" for="account-new-password">New
                                                            Password</label>
                                                        <div class="input-group form-password-toggle input-group-merge">
                                                            <input
                                                                    type="password"
                                                                    id="account-new-password"
                                                                    name="new-password"
                                                                    class="form-control"
                                                                    placeholder="New Password"
                                                            />
                                                            <div class="input-group-text cursor-pointer">
                                                                <i data-feather="eye"></i>
                                                            </div>
                                                        </div>
                                                        <div class="invalid-feedback" style="display: block;"></div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-6">
                                                    <div class="mb-1">
                                                        <label class="form-label" for="account-retype-new-password">Retype
                                                            New Password</label>
                                                        <div class="input-group form-password-toggle input-group-merge">
                                                            <input
                                                                    type="password"
                                                                    class="form-control"
                                                                    id="account-retype-new-password"
                                                                    name="confirm-new-password"
                                                                    placeholder="New Password"
                                                            />
                                                            <div class="input-group-text cursor-pointer"><i
                                                                    data-feather="eye"></i></div>
                                                            <p id="old-password-message"></p>
                                                        </div>
                                                        <div class="invalid-feedback" style="display: block;"></div>
                                                    </div>
                                                </div>

                                            </div>
                                        </form>
                                        <div class="col-12">
                                            <button type="submit" class="btn btn-primary me-1 mt-1"
                                                    id="btn-save-password">Save
                                                changes
                                            </button>
                                            <button type="reset" class="btn btn-outline-secondary mt-1">Cancel
                                            </button>
                                        </div>
                                        <!--/ form -->
                                    </div>
                                    <!--/ change password -->


                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/ right content section -->
                </div>
            </section>
            <!-- / account setting page -->

        </div>
    </div>
</div>
<!-- END: Content-->


<!-- BEGIN: Customizer-->
<jsp:include page="../common/customizer.jsp"/>
<!-- End: Customizer-->


<div class="sidenav-overlay"></div>
<div class="drag-target"></div>

<!-- BEGIN: Footer-->
<jsp:include page="../common/footer.jsp"/>
<button class="btn btn-primary btn-icon scroll-top" type="button"><i data-feather="arrow-up"></i></button>
<!-- END: Footer-->


<!-- BEGIN: Vendor JS-->
<script src="<c:url value='/template/admin/vendors/js/vendors.min.js'/>"></script>
<!-- BEGIN Vendor JS-->

<!-- BEGIN: Page Vendor JS-->
<script src="<c:url value='/template/admin/vendors/js/forms/select/select2.full.min.js'/>"></script>
<%--<script src="<c:url value='/template/admin/vendors/js/forms/validation/jquery.validate.min.js'/>"></script>--%>
<script src="<c:url value='/template/admin/vendors/js/file-uploaders/dropzone.min.js'/>"></script>
<script src="<c:url value='/template/admin/vendors/js/pickers/flatpickr/flatpickr.min.js'/>"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script src="<c:url value='/template/admin/js/core/app-menu.min.js'/>"></script>
<script src="<c:url value='/template/admin/js/core/app.min.js'/>"></script>
<script src="<c:url value='/template/admin/js/scripts/customizer.min.js'/>"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script src="<c:url value='/template/admin/js/scripts/pages/page-account-settings.min.js'/>"></script>
<!-- END: Page JS-->

<!-- BEGIN: CustomizerJS-->
<script src="<c:url value='/template/admin/js/scripts/customizerJS.js'/>"></script>
<!-- END: CustomizerJS-->
<script>
    $(document).ready(function () {

        if (feather) {
            feather.replace({width: 14, height: 14});
        }
        checkKey();

    })

    //
    $(document).on('click', '#btn-save-password', function () {
        const formArr = $("#form-account").serializeArray();
        const newPass = $('#account-new-password').val();
        if (checkValidateAccountPassword()) {
            $.ajax({
                url: '/admin/account-update',
                type: 'PUT',
                contentType: "application/json",
                data: JSON.stringify({
                    id: '',
                    name: formArr[0].value,
                    email: formArr[1].value,
                    phone: formArr[2].value,
                    password: newPass,
                    idRole: ''
                })
            }).done(function (data) {
                window.location.replace("/admin/Account-setting");
            });
        }
    });



    function checkValidateAccountPassword() {
        var check = true;
        var _oldPass = $('#account-old-password').val();
        var _newPass = $('#account-new-password').val();
        var _retypePass = $('#account-retype-new-password').val();
        if (_oldPass == '') {
            $('#account-old-password').css('border-color', 'Red');
            $('#account-old-password').parent().next().html('Please enter a valid password!');
            check = false;
        } else {
            $.ajax({
                url: '/admin/Account-check-Password',
                type: 'POST',
                contentType: "application/json",
                data: $('#account-old-password').val()
            }).done(function (data) {
                if (data == true) {
                    $('#account-old-password').css('border-color', 'rgb(33, 230, 11)');
                    $('#account-old-password').parent().next().html('');
                } else {
                    $('#account-old-password').css('border-color', 'red');
                    $('#account-old-password').parent().next().html('old password incorrect!');
                    check = false;
                }
            });
        }

        if (_newPass === '') {
            $('#account-new-password').css('border-color', 'Red');
            $('#account-new-password').parent().next().html('Please enter a valid password!');
            check = false;
        } else {
            $('#account-new-password').css('border-color', 'lightgrey');
            $('#account-new-password').parent().next().html('');
        }

        if (_retypePass === '') {
            $('#account-retype-new-password').css('border-color', 'Red');
            $('#account-retype-new-password').parent().next().html('Please enter a valid password!');
            check = false;
        } else if (_retypePass != _newPass) {
            $('#account-retype-new-password').css('border-color', 'Red');
            $('#account-retype-new-password').parent().next().html('Does not match the new password!');
            check = false;
        } else {
            $('#account-retype-new-password').css('border-color', 'lightgrey');
            $('#account-retype-new-password').parent().next().html('');
        }

        return check;
    }


    //PUT account

    $(document).on('click', '#btn-formAccount', function () {
        var formArr = $("#form-account").serializeArray();
        var isValid = true;

        if ($('#account-name').val().trim() == "") {
            $('#account-name').css('border-color', 'Red');
            $('#account-name').parent().next().html('Please enter a valid name!');
            isValid = false;
        } else {
            $('#account-name').css('border-color', 'lightgrey');
            $('#account-name').parent().next().html('');
        }
        if ($('#account-e-mail').val().trim() == "") {
            $('#account-e-mail').css('border-color', 'Red');
            $('#account-e-mail').parent().next().html('Please enter a valid email!');
            isValid = false;
        } else {
            $('#account-e-mail').css('border-color', 'lightgrey');
            $('#account-e-mail').parent().next().html('');
        }
        if ($('#account-phone').val().trim() == "") {
            $('#account-phone').css('border-color', 'Red');
            $('#account-phone').parent().next().html('Please enter a valid phone!');
            isValid = false;
        } else {
            $('#account-phone').css('border-color', 'lightgrey');
            $('#account-phone').parent().next().html('');
        }
        if (isValid == true) {
            $.ajax({
                url: '/admin/Account-update',
                type: 'PUT',
                contentType: "application/json",
                data: JSON.stringify({
                    id: '',
                    name: formArr[0].value,
                    email: formArr[1].value,
                    phone: formArr[2].value,
                    password: '',
                    idRole: ''
                })
            }).done(function (data) {
                window.location.replace("/admin/Account-setting");
            });
        }
    })
</script>
</body>
<!-- END: Body-->

<!-- Mirrored from pixinvent.com/demo/vuexy-html-bootstrap-admin-template/html/ltr/vertical-menu-template/page-account-settings.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 25 Aug 2021 02:09:41 GMT -->
</html>