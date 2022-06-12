<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 14/3/2022
  Time: 11:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="description"
          content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords"
          content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Dashboard ecommerce - Vuexy - Bootstrap HTML admin template</title>

    <link rel="apple-touch-icon" href="<c:url value='/template/admin/images/ico/apple-icon-120.html'/>">
    <link rel="shortcut icon" type="image/x-icon"
          href="https://pixinvent.com/demo/vuexy-html-bootstrap-admin-template/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600"
          rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" href="<c:url value='/template/admin/vendors/css/vendors.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/vendors/css/charts/apexcharts.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/vendors/css/extensions/toastr.min.css'/>">
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
    <link rel="stylesheet" href="<c:url value='/template/admin/css/pages/dashboard-ecommerce.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/plugins/charts/chart-apex.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/plugins/extensions/ext-component-toastr.min.css'/>">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <%--    <link rel="stylesheet" type="text/css" href="../../../assets/css/style.css">--%>
    <!-- END: Custom CSS-->
</head>
<body>
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
        </div>
        <div class="content-body">
            <!-- Bordered table start -->
            <div class="row" id="table-bordered">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title"><a href="/admin/user/">User</a></h4>
                            <c:if test="${successMessage}!=null">
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    <span>${successMessage}</span>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:if>
                        </div>
                        <div class="card-body">
                            <a class="btn btn-primary me-1 waves-effect waves-float waves-light"
                               href="<c:url value="/admin/user/create"/>">
                                <i data-feather="user-plus"></i>
                                Create</a>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Role</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="stt" value="1"></c:set>
                                <c:forEach items="${data}" var="user">
                                    <tr>
                                        <th scope="row">${stt}</th>
                                        <th>${user.name}</th>
                                        <th>${user.email}</th>
                                        <th>${user.phone}</th>
                                        <th>${user.name}</th>

                                        <th>
                                            <a href="<c:url value='/admin/user/update/${user.id}'/>"
                                               class="mr-sm-2 text-primary">
                                                <i data-feather="edit"></i>
                                            </a>

                                            <a href="<c:url value='/admin/user/delete/${user.id}'/>"
                                               class="text-danger">
                                                <i data-feather="delete"></i>
                                            </a>
                                        </th>
                                    </tr>
                                    <c:set var="stt" value="${stt + 1}"></c:set>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Bordered table end -->
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
<!-- END: Footer-->

<!-- BEGIN: Vendor JS-->
<script src="<c:url value='/template/admin/vendors/js/vendors.min.js'/>"></script>
<!-- BEGIN Vendor JS-->

<!-- BEGIN: Page Vendor JS-->
<script src="<c:url value='/template/admin/vendors/js/charts/apexcharts.min.js'/>"></script>
<script src="<c:url value='/template/admin/vendors/js/extensions/toastr.min.js'/>"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script src="<c:url value='/template/admin/js/core/app-menu.min.js'/>"></script>
<script src="<c:url value='/template/admin/js/core/app.min.js'/>"></script>
<script src="<c:url value='/template/admin/js/scripts/customizer.min.js'/>"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script src="<c:url value='/template/admin/js/scripts/pages/dashboard-ecommerce.min.js'/>"></script>
<!-- END: Page JS-->
<!-- BEGIN: Page JS-->
<script src="<c:url value='/template/admin/js/scripts/customizerJS.js'/>"></script>
<!-- END: Page JS-->
<script>


    $(document).ready(function () {
        if (feather) {
            feather.replace({width: 14, height: 14});
        }
        checkKey();
    })

</script>
</body>
</html>
