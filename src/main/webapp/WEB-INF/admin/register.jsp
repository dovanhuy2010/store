<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 22/4/2022
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<!-- Mirrored from pixinvent.com/demo/vuexy-html-bootstrap-admin-template/html/ltr/vertical-menu-template/page-auth-register-v1.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 25 Aug 2021 02:09:57 GMT -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="description"
          content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords"
          content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Register Page - Vuexy - Bootstrap HTML admin template</title>
    <link rel="apple-touch-icon" href="<c:url value='/template/admin/images/ico/apple-icon-120.html'/>">
    <link rel="shortcut icon" type="image/x-icon"
          href="https://pixinvent.com/demo/vuexy-html-bootstrap-admin-template/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600"
          rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" href="<c:url value='/template/admin/vendors/css/vendors.min.css'/>">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" href="<c:url value='/template/admin/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/bootstrap-extended.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/colors.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/components.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/themes/dark-layout.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/themes/bordered-layout.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/themes/semi-dark-layout.min.css'/>">
    <!-- END: Theme CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" href="<c:url value='/template/admin/css/core/menu/menu-types/vertical-menu.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/plugins/forms/form-validation.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/pages/page-auth.min.css'/>">

    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <%--    <link rel="stylesheet" type="text/css" href="../../../assets/css/style.css">--%>
    <!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->
<body class="vertical-layout vertical-menu-modern blank-page navbar-floating footer-static  " data-open="click"
      data-menu="vertical-menu-modern" data-col="blank-page">
<!-- BEGIN: Content-->
<div class="app-content content ">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">
            <div class="auth-wrapper auth-v1 px-2">
                <div class="auth-inner py-2">
                    <!-- Register v1 -->
                    <div class="card mb-0">
                        <div class="card-body">
                            <a href="#" class="brand-logo">
                                <svg
                                        viewbox="0 0 139 95"
                                        version="1.1"
                                        xmlns="http://www.w3.org/2000/svg"
                                        xmlns:xlink="http://www.w3.org/1999/xlink"
                                        height="28"
                                >
                                    <defs>
                                        <lineargradient id="linearGradient-1" x1="100%" y1="10.5120544%" x2="50%"
                                                        y2="89.4879456%">
                                            <stop stop-color="#000000" offset="0%"></stop>
                                            <stop stop-color="#FFFFFF" offset="100%"></stop>
                                        </lineargradient>
                                        <lineargradient id="linearGradient-2" x1="64.0437835%" y1="46.3276743%"
                                                        x2="37.373316%" y2="100%">
                                            <stop stop-color="#EEEEEE" stop-opacity="0" offset="0%"></stop>
                                            <stop stop-color="#FFFFFF" offset="100%"></stop>
                                        </lineargradient>
                                    </defs>
                                    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                        <g id="Artboard" transform="translate(-400.000000, -178.000000)">
                                            <g id="Group" transform="translate(400.000000, 178.000000)">
                                                <path
                                                        class="text-primary"
                                                        id="Path"
                                                        d="M-5.68434189e-14,2.84217094e-14 L39.1816085,2.84217094e-14 L69.3453773,32.2519224 L101.428699,2.84217094e-14 L138.784583,2.84217094e-14 L138.784199,29.8015838 C137.958931,37.3510206 135.784352,42.5567762 132.260463,45.4188507 C128.736573,48.2809251 112.33867,64.5239941 83.0667527,94.1480575 L56.2750821,94.1480575 L6.71554594,44.4188507 C2.46876683,39.9813776 0.345377275,35.1089553 0.345377275,29.8015838 C0.345377275,24.4942122 0.230251516,14.560351 -5.68434189e-14,2.84217094e-14 Z"
                                                        style="fill: currentColor"
                                                ></path>
                                                <path
                                                        id="Path1"
                                                        d="M69.3453773,32.2519224 L101.428699,1.42108547e-14 L138.784583,1.42108547e-14 L138.784199,29.8015838 C137.958931,37.3510206 135.784352,42.5567762 132.260463,45.4188507 C128.736573,48.2809251 112.33867,64.5239941 83.0667527,94.1480575 L56.2750821,94.1480575 L32.8435758,70.5039241 L69.3453773,32.2519224 Z"
                                                        fill="url(#linearGradient-1)"
                                                        opacity="0.2"
                                                ></path>
                                                <polygon
                                                        id="Path-2"
                                                        fill="#000000"
                                                        opacity="0.049999997"
                                                        points="69.3922914 32.4202615 32.8435758 70.5039241 54.0490008 16.1851325"
                                                ></polygon>
                                                <polygon
                                                        id="Path-21"
                                                        fill="#000000"
                                                        opacity="0.099999994"
                                                        points="69.3922914 32.4202615 32.8435758 70.5039241 58.3683556 20.7402338"
                                                ></polygon>
                                                <polygon
                                                        id="Path-3"
                                                        fill="url(#linearGradient-2)"
                                                        opacity="0.099999994"
                                                        points="101.428699 0 83.0667527 94.1480575 130.378721 47.0740288"
                                                ></polygon>
                                            </g>
                                        </g>
                                    </g>
                                </svg>
                                <h2 class="brand-text text-primary ms-1">Vuexy</h2>
                            </a>

                            <h4 class="card-title mb-1">Adventure starts here 🚀</h4>
                            <p class="card-text mb-2">Make your app management easy and fun!</p>
                            <%--BEGIN:Form register--%>
                            <form:form class="auth-register-form mt-2"
                                       id="form-register"
                                       method="POST"
                                       modelAttribute="userDto">
                                <div class="mb-1">
                                    <label for="name" class="form-label">Name</label>
                                    <form:input
                                            type="text"
                                            class="form-control"
                                            id="name"
                                            name="name"
                                            placeholder="johndoe"
                                            aria-describedby="register-username"
                                            tabindex="1"
                                            path="name"
                                    />
                                </div>
                                <div class="mb-1">
                                    <label for="email" class="form-label">Email</label>
                                    <form:input
                                            type="text"
                                            class="form-control"
                                            id="email"
                                            name="email"
                                            placeholder="john@example.com"
                                            aria-describedby="register-email"
                                            tabindex="2"
                                            path="email"
                                    />
                                </div>

                                <div class="mb-1">
                                    <label class="form-label" for="phone">Phone</label>
                                    <form:input type="number" id="phone"
                                                class="form-control"
                                                name="phone"
                                                placeholder="Phone"
                                                path="phone"/>
                                </div>
                                <div class="mb-1">
                                    <label for="password" class="form-label">Password</label>
                                    <div class="input-group input-group-merge form-password-toggle">
                                        <form:input
                                                type="password"
                                                class="form-control form-control-merge"
                                                id="password"
                                                name="password"
                                                placeholder="******"
                                                aria-describedby="register-password"
                                                tabindex="3"
                                                path="password"
                                        />
                                        <span class="input-group-text cursor-pointer"><i data-feather="eye"></i></span>
                                    </div>
                                </div>
                                <div class="mb-1">
                                    <label for="confirm-password" class="form-label">Confirm Password</label>

                                    <div class="input-group input-group-merge form-password-toggle">
                                        <input
                                                type="password"
                                                class="form-control form-control-merge"
                                                id="confirm-password"
                                                name="confirm-password"
                                                placeholder="******"
                                                aria-describedby="register-password"
                                                tabindex="3"
                                        />
                                        <span class="input-group-text cursor-pointer"><i data-feather="eye"></i></span>
                                    </div>
                                </div>
                                <div class="mb-1">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="register-privacy-policy"
                                               tabindex="4"/>
                                        <label class="form-check-label" for="register-privacy-policy">
                                            I agree to <a href="#">privacy policy & terms</a>
                                        </label>
                                    </div>
                                </div>

                            </form:form>
                            <button type="button" onclick="registerAcc()" class="btn btn-primary w-100" tabindex="5">register</button>
                            <%--END:Form register--%>

                            <p class="text-center mt-2">
                                <span>Already have an account?</span>
                                <a href="<c:url value="/_admin/login"/>">
                                    <span>Sign in instead</span>
                                </a>
                            </p>

                            <div class="divider my-2">
                                <div class="divider-text">or</div>
                            </div>

                            <div class="auth-footer-btn d-flex justify-content-center">
                                <a href="#" class="btn btn-facebook">
                                    <i data-feather="facebook"></i>
                                </a>
                                <a href="#" class="btn btn-twitter white">
                                    <i data-feather="twitter"></i>
                                </a>
                                <a href="#" class="btn btn-google">
                                    <i data-feather="mail"></i>
                                </a>
                                <a href="#" class="btn btn-github">
                                    <i data-feather="github"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- /Register v1 -->
                </div>
            </div>

        </div>
    </div>
</div>
<!-- END: Content-->

<!-- BEGIN: Vendor JS-->
<script src="<c:url value='/template/admin/vendors/js/vendors.min.js'/>"></script>
<!-- BEGIN Vendor JS-->


<!-- BEGIN: Page Vendor JS-->
<script src="<c:url value='/template/admin/vendors/js/forms/validation/jquery.validate.min.js'/>"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script src="<c:url value='/template/admin/js/core/app-menu.min.js'/>"></script>
<script src="<c:url value='/template/admin/js/core/app.min.js'/>"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script src="<c:url value='/template/admin/js/scripts/pages/page-auth-register.min.js'/>"></script>
<!-- END: Page JS-->

<script>
    $(window).on('load', function () {
        if (feather) {
            feather.replace({width: 14, height: 14});
        }
    })

    function registerAcc() {
        var formArr = $("#form-register").serializeArray();
        var res = validate();
        if (res == false) {
            return res;
        }
        if (formArr[3].value != formArr[4].value) {
            $('#confirm-password').css('border-color', 'red');
            return false;
        }
        // clearTextBox();

        $.ajax({
            url: '/register',
            type: 'POST',
            contentType: "application/json",
            data: JSON.stringify({
                name: formArr[0].value,
                email: formArr[1].value,
                phone: formArr[2].value,
                password: formArr[3].value,
                idRole: 2
            })
        }).done(function (data) {
            if (data != null) {
                window.location.replace("admin/verify");
            } else {
                alert("Form invalid")
            }
        });
    }

    function validate() {
        var isValid = true;
        if ($('#name').val().trim() == "") {
            $('#name').css('border-color', 'Red');
            isValid = false;
        } else {
            $('#name').css('border-color', 'lightgrey');
        }
        if ($('#email').val().trim() == "") {
            $('#email').css('border-color', 'Red');
            isValid = false;
        } else {
            $('#email').css('border-color', 'lightgrey');
        }
        if ($('#phone').val().trim() == "") {
            $('#phone').css('border-color', 'Red');
            isValid = false;
        } else {
            $('#phone').css('border-color', 'lightgrey');
        }
        if ($('#password').val().trim() == "") {
            $('#password').css('border-color', 'Red');
            isValid = false;
        } else {
            $('#password').css('border-color', 'lightgrey');
        }
        if ($('#confirm-password').val().trim() == "") {
            $('#confirm-password').css('border-color', 'Red');
            isValid = false;
        } else {
            $('#confirm-password').css('border-color', 'lightgrey');
        }
        return isValid;
    }

    function clearTextBox() {
        $('#name').val("");
        $('#email').val("");
        $('#phone').val("");
        $('#password').val("");
        $('#confirm-password').val("");

        $('#name').css('border-color', 'lightgrey');
        $('#email').css('border-color', 'lightgrey');
        $('#phone').css('border-color', 'lightgrey');
        $('#password').css('border-color', 'lightgrey');
        $('#confirm-password').css('border-color', 'lightgrey');
    }
</script>
</body>
<!-- END: Body-->

<!-- Mirrored from pixinvent.com/demo/vuexy-html-bootstrap-admin-template/html/ltr/vertical-menu-template/page-auth-register-v1.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 25 Aug 2021 02:09:57 GMT -->
</html>