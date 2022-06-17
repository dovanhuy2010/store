<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="stylesheet" href="<c:url value='/template/admin/vendors/css/forms/select/select2.min.css'/>">
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
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title"><a href="<c:url value="/admin/user"/>">User</a> > ${action}</h4>
                            </div>
                            <div class="card-body">
                                <form:form id="form-user" class="form form-vertical" modelAttribute="user">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="mb-1">
                                                <label class="form-label" for="id">Id</label>
                                                <form:input type="text" id="id" class="form-control"
                                                            name="id"
                                                            placeholder="Id" path="id" readonly="true"/>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="mb-1">
                                                <label class="form-label" for="name">Name</label>
                                                <form:input type="text" id="name" class="form-control"
                                                            name="name"
                                                            placeholder="Name" path="name"/>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="mb-1">
                                                <label class="form-label" for="email">Email</label>
                                                <form:input type="email" id="email" class="form-control"
                                                            name="email"
                                                            placeholder="Email" path="email"/>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="mb-1">
                                                <label class="form-label" for="phone">Phone</label>
                                                <form:input type="number" id="phone"
                                                            class="form-control"
                                                            name="phone" placeholder="Phone" path="phone"/>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="mb-1">
                                                <label class="form-label" for="password-vertical">Password</label>
                                                <form:input type="password" id="password-vertical" class="form-control"
                                                            name="contact" placeholder="Password" path="password"/>
                                            </div>
                                        </div>


                                            <%--roleName--%>
                                            <%--                                        <div class="mb-1">--%>
                                            <%--                                            <label class="form-label" for="idRole">Role</label>--%>
                                            <%--                                            <form:select class="form-select" id="idRole" path="">--%>
                                            <%--                                                <c:forEach items="${listRole}" var="role">--%>
                                            <%--                                                    <option value="${role.id}" name="${role}"--%>
                                            <%--                                                            <c:if test="${role.id ==user.idRole}">selected</c:if>--%>
                                            <%--                                                    >${role.roleName}</option>--%>
                                            <%--                                                </c:forEach>--%>
                                            <%--                                            </form:select>--%>
                                            <%--                                        </div>--%>
                                            <%--roleName--%>


                                    </div>
                                </form:form>
                                <form:form modelAttribute="userRoles">
                                    <div class="col-12">
                                        <div class="table-responsive border rounded mt-1">
                                            <h6 class="py-1 mx-1 mb-0 font-medium-2">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                     stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-lock font-medium-3 me-25">
                                                    <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                                    <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                                </svg>
                                                <span class="align-middle">Permission</span>
                                            </h6>
                                            <table class="table table-striped table-borderless">
                                                <thead class="table-light">
                                                <tr>
                                                    <th>User role</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listRole}" var="roles">
                                                    <tr>
                                                        <td>${roles.roleName}</td>
                                                        <td>
                                                            <div class="form-check">
                                                                <form:input type="checkbox" class="form-check-input"
                                                                            id="${roles.id}" value="${roles.roleName}"
                                                                            path=""
                                                                           <c:if test="${userRoles.contains(roles)}">checked</c:if>
                                                                >
                                                                <label class="form-check-label"
                                                                       for="${roles.id}"></label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </form:form>
                                <div class="col-12">
                                    <button onclick="submitFunc(${user.id})" type="reset"
                                            class="btn btn-primary me-1 waves-effect waves-float waves-light">
                                        Submit
                                    </button>
                                    <%--                                    <button onclick="demo()" type="reset"--%>
                                    <%--                                            class="btn btn-primary me-1 waves-effect waves-float waves-light">--%>
                                    <%--                                        Submit--%>
                                    <%--                                    </button>--%>
                                    <button type="reset" class="btn btn-outline-secondary waves-effect">Reset
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END: Content-->
<!-- BEGIN: Footer-->
<jsp:include page="../common/footer.jsp"/>
<!-- END: Footer-->

<!-- BEGIN: Customizer-->
<jsp:include page="../common/customizer.jsp"/>
<!-- End: Customizer-->

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>


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
<script src="<c:url value='/template/admin/js/scripts/forms/form-select2.min.js'/>"></script>
<!-- END: Page JS-->

<!-- BEGIN: Page Vendor JS-->
<script src="<c:url value='/template/admin/vendors/js/forms/select/select2.full.min.js'/>"></script>
<!-- END: Page Vendor JS-->

<%--jquery ajax--%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

<%--<script src="<c:url value="/template/admin/user/js/createUser.js"/>"/>--%>


<%--jquery ajax--%>
<script>
    $(window).on('load', function () {
        if (feather) {
            feather.replace({width: 14, height: 14});
        }

    })

    $(document).ready(function () {
        $('#password-vertical').val("");
    });


    function submitFunc(id) {
        var formArr = $("#form-user").serializeArray();
        if (formArr[0].value == null || formArr[0].value <= 0) {
            $.ajax({
                url: '/admin/user/save',
                type: 'POST',
                contentType: "application/json",
                data: JSON.stringify({
                    id: formArr[0].value,
                    name: formArr[1].value,
                    email: formArr[2].value,
                    phone: formArr[3].value,
                    password: formArr[4].value,
                    idRole: formArr[5].value
                })
            }).done(function (data) {
                if (data != null) {
                    window.location.replace("/admin/user");
                } else {
                    alert("Form invalid")
                }
            });
        } else {
            $.ajax({
                url: '/admin/user/' + id,
                type: 'PUT',
                contentType: "application/json",
                data: JSON.stringify({
                    id: formArr[0].value,
                    name: formArr[1].value,
                    email: formArr[2].value,
                    phone: formArr[3].value,
                    password: formArr[4].value,
                    idRole: formArr[5].value
                })
            }).done(function (data) {
                if (data != null) {
                    window.location.replace("/admin/user");
                } else {
                    alert("Form invalid")
                }
            });
        }
    }
</script>
</body>
</html>
