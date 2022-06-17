<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
    <%--    <link rel="stylesheet" href="<c:url value='/template/admin/vendors/css/charts/apexcharts.css'/>">--%>
    <%--    <link rel="stylesheet" href="<c:url value='/template/admin/vendors/css/extensions/toastr.min.css'/>">--%>
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
    <%--    <link rel="stylesheet" href="<c:url value='/template/admin/css/plugins/extensions/ext-component-toastr.min.css'/>">--%>
    <!-- END: Page CSS-->
    <link rel="stylesheet" href="<c:url value='/template/admin/vendors/dist/css/dropzone.min.css'/>">


    <!-- BEGIN: Custom CSS-->
    <%--    <link rel="stylesheet" type="text/css" href="../../../assets/css/style.css">--%>
    <!-- END: Custom CSS-->
    <style>
        .modal button.close {
            padding-top: 1.75rem;
        }

        form {
            margin: unset;
        }

        .m-portlet .m-portlet__foot .m-form__actions {
            padding: 15px;
        }

        .wysiwyg-editor-container .nicEdit-main:focus {
            outline: none !important;
        }

        .wysiwyg-editor {
            width: 100%;
        }

        .m-dropzone {
            padding: 5px;
            border-radius: 5px;
            border: 2px dashed rgb(0, 135, 247);
        }

        .m-dropzone.dz-started .dz-message {
            display: none;
        }

        .m-dropzone .dz-preview .dz-success-mark {
            display: none;
        }

        .m-dropzone .dz-preview .dz-error-mark {
            display: none;
        }

        .m-dropzone .m-dropzone__msg-title {
            margin: auto;
        }

        .m-dropzone .dz-error-message {
            color: red;
        }

        .m-dropzone .dz-preview {
            display: inline-block;
            position: relative;
            background-color: #efefef;
            padding: 2px;
            margin: 5px;
            min-width: 180px;
        }

        .m-dropzone .dz-remove i:before {
            content: "\00d7";
            font-size: 2rem;
            color: #e51d18;
            position: absolute;
            top: -8px;
            right: 5px;
        }
    </style>
</head>
<body>
<!-- BEGIN: Header-->
<jsp:include page="common/head.jsp"/>
<!-- END: Header-->

<!-- BEGIN: Main Menu-->
<jsp:include page="common/menuNav.jsp"/>
<!-- END: Main Menu-->

<!-- BEGIN: Content-->
<div class="app-content content ">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper container-xxl p-0">
        <div class="content-header row">

            <div class="modal-content">
                <div class="modal-header">
                    <%--                    <h5 class="modal-title">error</h5>--%>
                    <%--                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="padding-top: 15px">--%>
                    <%--                        <span aria-hidden="true">×</span>--%>
                    <%--                    </button>--%>
                </div>
                <div class="modal-body">
                    <form action="JavaScript:void(0)" class="m-form m-form--fit m-form--label-align-right"

                          id="form_validation_create_staff">

                        <div class="form-group m-form__group row">
                            <div class="col-lg-12">
                                <div class="form-group m-form__group row padding-left-zero-form">
                                    <div class="col-md-3">
                                        <label class="control-label">
                                            File
                                        </label>
                                    </div>
                                    <div class="col-md-9">

                                        <%--                                        <div class="m-dropzone dropzone m-dropzone--primary"--%>
                                        <%--                                             action="/uplaod-file"--%>
                                        <%--                                             id="demo-upload">--%>
                                        <%--                                            <div class="m-dropzone__msg dz-message needsclick">--%>
                                        <%--                                                <h3 class="m-dropzone__msg-title">TẢI FILE</h3>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--                        <div class="form-group m-form__group row" hidden>--%>
                        <%--                            <div class="col-lg-12">--%>
                        <%--                                <div class="form-group m-form__group row padding-left-zero-form">--%>
                        <%--                                    <div class="col-md-4">--%>
                        <%--                                        <label class="control-label">--%>
                        <%--                                            Tên File--%>
                        <%--                                        </label>--%>
                        <%--                                    </div>--%>
                        <%--                                    <div class="col-md-8">--%>
                        <%--                                        <input class="form-control m-input form-md-line-input" name="fileName"--%>
                        <%--                                               id="fileName" readonly>--%>
                        <%--                                    </div>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                        <div class="m-checkbox-list">
                        </div>
                        <%--                        <div class="modal-footer">--%>
                        <%--                            <a target="_blank" href="<c:url value='/import/${typefile}/get-file' />">--%>
                        <%--                            </a>--%>
                        <%--                            <button type="button" class="btn btn-primary" id="popup-btn-upload-file"></button>--%>
                        <%--                        </div>--%>
                    </form>
                    <form action="JavaScript:void(0)"
                          data-url="<c:url value='/import/upload-file' />"
                          data-redirect="<c:url value='/admin' />" method="post"
                          class="m-form m-form--fit m-form--label-align-right"
                          enctype="multipart/form-data">
                        <div>
                            <div id="form-upload-file"
                                 class="m-dropzone__msg dz-message needsclick file-dropzone m-dropzone dropzone m-dropzone--primary"
                                 action="/import/upload-file"
                            >
                                <h3 class="m-dropzone__msg-title">TẢI FILE</h3>
                            </div>
                            <div class="col-md-4">
                                <label class="control-label">
                                    Tên File
                                </label>
                            </div>
                            <div class="col-md-8">
                                <input class="form-control m-input form-md-line-input" name="fileName" id="fileName"
                                       readonly>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" id="reset-form">Reset</button>
                                <button type="button" class="btn btn-primary" id="popup-btn-upload-file">Save file
                                </button>
                            </div>
                        </div>
                    </form>


                </div>

            </div>

        </div>
    </div>
</div>
<!-- END: Content-->


<!-- BEGIN: Customizer-->
<jsp:include page="common/customizer.jsp"/>
<!-- End: Customizer-->

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>

<!-- BEGIN: Footer-->
<jsp:include page="common/footer.jsp"/>
<!-- END: Footer-->

<!-- BEGIN: Vendor JS-->
<script src="<c:url value='/template/admin/vendors/js/vendors.min.js'/>"></script>
<!-- BEGIN Vendor JS-->

<!-- BEGIN: Page Vendor JS-->
<%--<script src="<c:url value='/template/admin/vendors/js/charts/apexcharts.min.js'/>"></script>--%>
<%--<script src="<c:url value='/template/admin/vendors/js/extensions/toastr.min.js'/>"></script>--%>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script src="<c:url value='/template/admin/js/core/app-menu.min.js'/>"></script>
<script src="<c:url value='/template/admin/js/core/app.min.js'/>"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<%--<script src="<c:url value='/template/admin/js/scripts/pages/dashboard-ecommerce.min.js'/>"></script>--%>
<!-- END: Page JS-->

<!-- BEGIN: CustomizerJS-->
<script src="<c:url value='/template/admin/js/scripts/customizerJS.js'/>"></script>
<script src="<c:url value='/template/admin/vendors/dist/js/Dropzone.js'/>"></script>
<script src="<c:url value='/template/admin/vendors/dist/js/dropzone-amd-module.min.js'/>"></script>

<script src="<c:url value='https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js'/>"></script>


<!-- END: CustomizerJS-->
<script type="text/javascript">

    $(document).ready(function () {
        if (feather) {
            feather.replace({width: 14, height: 14});
        }
        checkKey();
        //


    })

    Dropzone.autoDiscover = false;
    var MyDropzone = $(".m-dropzone--primary").Dropzone({
        maxFiles: 1, //chỉ được tải lên 1 file
        addRemoveLinks: true, //điều này sẽ thêm một liên kết đến mọi bản xem trước tệp để xóa hoặc hủy tệp(nếu đã tải lên)
        dictCancelUploadConfirmation: "Bạn có muốn dừng tải file?",
        dictRemoveFile: "Xóa file", //các lựa chọn nếu  addRemoveLinks: true
        timeOut: 360000,//thời gian chờ tải file
        maxFilesize: 512, // dung lượng file tối đa
        success: function (file, res) {
            $('#fileName').val(res.toString());
            alert("File verify success!");
            $('#fileName').val('img_demo');
            if (res != null && res == true) {
                alert("File verify success!");
                $('#fileName').val('img_demo');
            } else {
                alert("File verify error!");
                $('#fileName').val('');
            }
        },
        init: function () {
            this.on('removedfile', function (file) {
                var res;
                alert("File verify success!");
                return (res = file.previewElement) != null ? res.parentNode.removeChild(file.previewElement) : void 0;
            })
            this.on('addedfile', function (file) {
                alert("File verify error!");
                //thêm file thứ 2 sẽ xóa file đầu tiên
                if (this.files.length > 1) {
                    this.removeFile(this.files[0]);
                    this.removedfile(this.files[0]);
                }
            });
            this.on('maxfilesexceeded', function () {
                alert("File verify error!");
                this.removeAllFiles();
                this.addFile(file);
            })
            this.on("success", function (file, res) {
                $('#fileName').val(res.toString());
                alert("File verify success!");
                $('#fileName').val('img_demo');
                if (res != null && res == true) {
                    alert("File verify success!");
                    $('#fileName').val('img_demo');
                } else {
                    alert("File verify error!");
                    $('#fileName').val('');
                }
            })
        }
    })
    var dropzoneObj = MyDropzone.dropzone;

    function clearFormUploadFiles() {
        $dropzone.removedfile();
        dropzoneObj.removedfile();
        $('#fileName').val('');
    }

    // $(document).on('click','#reset-form',function () {
    //     alert("File verify success!");
    //     var res;
    //     clearFormUploadFiles();
    //     return (res = file.previewElement) != null ? res.parentNode.removeChild(file.previewElement) : void 0;
    // })
    $('#reset-form').onclick(function () {
        alert("File verify success!");
        var res;
        return (res = file.previewElement) != null ? res.parentNode.removeChild(file.previewElement) : void 0;
        clearFormUploadFiles();
    })

    // popup-btn-upload-file
    $(document).on('click', '#popup-btn-upload-file', function () {
        alert("File verify success!");
        // $.ajax({
        //     url: '/import/save-file',
        //     type: 'POST',
        //     contentType: "application/json",
        //     data: $('#form-upload-file').dropzone()
        //     })
        // }).done(function (data) {
        //     if (data != null) {
        //         window.location.replace("/admin/user");
        //     } else {
        //         alert("Form invalid")
        //     }
        // });
        $('#fileName').val('demo');
    })

</script>
</body>
</html>
