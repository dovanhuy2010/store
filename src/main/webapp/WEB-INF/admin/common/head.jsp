<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 22/4/2022
  Time: 9:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- BEGIN: Header-->
<nav class="header-navbar navbar navbar-expand-lg align-items-center floating-nav navbar-light navbar-shadow container-xxl">
    <div class="navbar-container d-flex content">
        <div class="bookmark-wrapper d-flex align-items-center">
            <ul class="nav navbar-nav d-xl-none">
                <li class="nav-item"><a class="nav-link menu-toggle" href="#"><i class="ficon" data-feather="menu"></i></a>
                </li>
            </ul>
            <ul class="nav navbar-nav bookmark-icons">
                <li class="nav-item d-none d-lg-block"><a class="nav-link" href="app-email.html"
                                                          data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                          title="Email"><i class="ficon" data-feather="mail"></i></a>
                </li>
                <li class="nav-item d-none d-lg-block"><a class="nav-link" href="app-chat.html" data-bs-toggle="tooltip"
                                                          data-bs-placement="bottom" title="Chat"><i class="ficon"
                                                                                                     data-feather="message-square"></i></a>
                </li>
                <li class="nav-item d-none d-lg-block"><a class="nav-link" href="app-calendar.html"
                                                          data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                          title="Calendar"><i class="ficon" data-feather="calendar"></i></a>
                </li>
                <li class="nav-item d-none d-lg-block"><a class="nav-link" href="app-todo.html" data-bs-toggle="tooltip"
                                                          data-bs-placement="bottom" title="Todo"><i class="ficon"
                                                                                                     data-feather="check-square"></i></a>
                </li>
            </ul>
            <ul class="nav navbar-nav">
                <li class="nav-item d-none d-lg-block"><a class="nav-link bookmark-star"><i class="ficon text-warning"
                                                                                            data-feather="star"></i></a>
                    <div class="bookmark-input search-input">
                        <div class="bookmark-input-icon"><i data-feather="search"></i></div>
                        <input class="form-control input" type="text" placeholder="Bookmark" tabindex="0"
                               data-search="search">
                        <ul class="search-list search-list-bookmark"></ul>
                    </div>
                </li>
            </ul>
        </div>
        <ul class="nav navbar-nav align-items-center ms-auto">
            <li class="nav-item d-none d-lg-block"><a class="nav-link nav-link-style"><i class="ficon"
                                                                                         data-feather="moon"></i></a>
            </li>
            <li class="nav-item nav-search"><a class="nav-link nav-link-search"><i class="ficon"
                                                                                   data-feather="search"></i></a>
                <div class="search-input">
                    <div class="search-input-icon"><i data-feather="search"></i></div>
                    <input class="form-control input" type="text" placeholder="Explore Vuexy..." tabindex="-1"
                           data-search="search">
                    <div class="search-input-close"><i data-feather="x"></i></div>
                    <ul class="search-list search-list-main"></ul>
                </div>
            </li>

            <li class="nav-item dropdown dropdown-user"><a class="nav-link dropdown-toggle dropdown-user-link"
                                                           id="dropdown-user" href="#" data-bs-toggle="dropdown"
                                                           aria-haspopup="true" aria-expanded="false">
                <div class="user-nav d-sm-flex d-none">

                    <span class="user-name fw-bolder" id="user-name"><%--        ${userDto.name}            --%></span>
                    <span class="user-status" id="user-role"><%--        ${testSession}            --%></span>
                </div>
                <span class="avatar"><img class="round"
                                          src="<c:url value="/template/admin/images/avatars/account.png"/>"
                                          alt="avatar" height="40" width="40"><span class="avatar-status-online"></span></span></a>
                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdown-user"><a class="dropdown-item"
                                                                                                href="page-profile.html"><i
                        class="me-50" data-feather="user"></i> Profile</a><a class="dropdown-item"
                                                                             href="app-email.html"><i class="me-50"
                                                                                                      data-feather="mail"></i>
                    Inbox</a><a class="dropdown-item" href="app-todo.html"><i class="me-50"
                                                                              data-feather="check-square"></i>
                    Task</a><a class="dropdown-item" href="app-chat.html"><i class="me-50"
                                                                             data-feather="message-square"></i>
                    Chats</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="<c:url value='/admin/account/redirect-account-page'/>"><i class="me-50"
                                                                                                  data-feather="settings"></i>
                        Settings</a><a
                            class="dropdown-item" href="page-pricing.html"><i class="me-50"
                                                                              data-feather="credit-card"></i>
                        Pricing</a><a class="dropdown-item" href="page-faq.html"><i class="me-50"
                                                                                    data-feather="help-circle"></i> FAQ</a><a
                            class="dropdown-item" href="<c:url value="/logout"/>"><i class="me-50"
                                                                                     data-feather="power"></i>
                        Logout</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
<ul class="main-search-list-defaultlist d-none">
    <li class="d-flex align-items-center"><a href="#">
        <h6 class="section-label mt-75 mb-0">Files</h6></a></li>
    <li class="auto-suggestion"><a class="d-flex align-items-center justify-content-between w-100"
                                   href="app-file-manager.html">
        <div class="d-flex">
            <div class="me-75"><img src="../../../app-assets/images/icons/xls.png" alt="png" height="32"></div>
            <div class="search-data">
                <p class="search-data-title mb-0">Two new item submitted</p><small class="text-muted">Marketing
                Manager</small>
            </div>
        </div>
        <small class="search-data-size me-50 text-muted">&apos;17kb</small></a></li>
    <li class="auto-suggestion"><a class="d-flex align-items-center justify-content-between w-100"
                                   href="app-file-manager.html">
        <div class="d-flex">
            <div class="me-75"><img src="../../../app-assets/images/icons/jpg.png" alt="png" height="32"></div>
            <div class="search-data">
                <p class="search-data-title mb-0">52 JPG file Generated</p><small class="text-muted">FontEnd
                Developer</small>
            </div>
        </div>
        <small class="search-data-size me-50 text-muted">&apos;11kb</small></a></li>
    <li class="auto-suggestion"><a class="d-flex align-items-center justify-content-between w-100"
                                   href="app-file-manager.html">
        <div class="d-flex">
            <div class="me-75"><img src="../../../app-assets/images/icons/pdf.png" alt="png" height="32"></div>
            <div class="search-data">
                <p class="search-data-title mb-0">25 PDF File Uploaded</p><small class="text-muted">Digital Marketing
                Manager</small>
            </div>
        </div>
        <small class="search-data-size me-50 text-muted">&apos;150kb</small></a></li>
    <li class="auto-suggestion"><a class="d-flex align-items-center justify-content-between w-100"
                                   href="app-file-manager.html">
        <div class="d-flex">
            <div class="me-75"><img src="../../../app-assets/images/icons/doc.png" alt="png" height="32"></div>
            <div class="search-data">
                <p class="search-data-title mb-0">Anna_Strong.doc</p><small class="text-muted">Web Designer</small>
            </div>
        </div>
        <small class="search-data-size me-50 text-muted">&apos;256kb</small></a></li>
    <li class="d-flex align-items-center"><a href="#">
        <h6 class="section-label mt-75 mb-0">Members</h6></a></li>
    <li class="auto-suggestion"><a class="d-flex align-items-center justify-content-between py-50 w-100"
                                   href="app-user-view.html">
        <div class="d-flex align-items-center">
            <div class="avatar me-75"><img src="../../../app-assets/images/portrait/small/avatar-s-8.jpg" alt="png"
                                           height="32"></div>
            <div class="search-data">
                <p class="search-data-title mb-0">John Doe</p><small class="text-muted">UI designer</small>
            </div>
        </div>
    </a></li>
    <li class="auto-suggestion"><a class="d-flex align-items-center justify-content-between py-50 w-100"
                                   href="app-user-view.html">
        <div class="d-flex align-items-center">
            <div class="avatar me-75"><img src="../../../app-assets/images/portrait/small/avatar-s-1.jpg" alt="png"
                                           height="32"></div>
            <div class="search-data">
                <p class="search-data-title mb-0">Michal Clark</p><small class="text-muted">FontEnd Developer</small>
            </div>
        </div>
    </a></li>
    <li class="auto-suggestion"><a class="d-flex align-items-center justify-content-between py-50 w-100"
                                   href="app-user-view.html">
        <div class="d-flex align-items-center">
            <div class="avatar me-75"><img src="../../../app-assets/images/portrait/small/avatar-s-14.jpg" alt="png"
                                           height="32"></div>
            <div class="search-data">
                <p class="search-data-title mb-0">Milena Gibson</p><small class="text-muted">Digital Marketing
                Manager</small>
            </div>
        </div>
    </a></li>
    <li class="auto-suggestion"><a class="d-flex align-items-center justify-content-between py-50 w-100"
                                   href="app-user-view.html">
        <div class="d-flex align-items-center">
            <div class="avatar me-75"><img src="../../../app-assets/images/portrait/small/avatar-s-6.jpg" alt="png"
                                           height="32"></div>
            <div class="search-data">
                <p class="search-data-title mb-0">Anna Strong</p><small class="text-muted">Web Designer</small>
            </div>
        </div>
    </a></li>
</ul>
<ul class="main-search-list-defaultlist-other-list d-none">
    <li class="auto-suggestion justify-content-between"><a
            class="d-flex align-items-center justify-content-between w-100 py-50">
        <div class="d-flex justify-content-start"><span class="me-75" data-feather="alert-circle"></span><span>No results found.</span>
        </div>
    </a></li>
</ul>
<!-- END: Header-->

