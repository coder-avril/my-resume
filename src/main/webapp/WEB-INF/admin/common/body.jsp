<!-- Overlay For Sidebars -->
<div class="overlay"></div>
<!-- #END# Overlay For Sidebars -->
<!-- Search Bar -->
<div class="search-bar">
    <div class="search-icon">
        <i class="material-icons">search</i>
    </div>
    <input type="text" placeholder="输入开始搜索">
    <div class="close-search">
        <i class="material-icons">close</i>
    </div>
</div>
<!-- #END# Search Bar -->
<!-- Top Bar -->
<nav class="navbar">
    <div class="container-fluid">
        <div class="navbar-header">
            <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
            <a href="javascript:void(0);" class="bars"></a>
            <a class="navbar-brand" href="#">简历管理</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <!-- Call Search -->
                <li><a href="javascript:void(0);" class="js-search" data-close="true"><i class="material-icons">search</i></a></li>
                <!-- #END# Tasks -->
                <li><a href="javascript:void(0);" data-close="true"><i class="material-icons">more_vert</i></a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- #Top Bar -->
<section>
    <!-- Left Sidebar -->
    <aside id="leftsidebar" class="sidebar">
        <!-- User Info -->
        <div class="user-info">
            <div class="image">
                <img src="${ctx}/asset/admin/img/avatar.png" alt="User">
            </div>
            <div class="info-container">
                <div class="name">${user.name}</div>
                <div class="email">${user.email}</div>
                <div class="btn-group user-helper-dropdown">
                    <i class="material-icons" data-toggle="dropdown">keyboard_arrow_down</i>
                    <ul class="dropdown-menu pull-right">
                        <li><a href="${ctx}/front/user"><i class="material-icons">person</i>个人信息</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${ctx}/front/logout"><i class="material-icons">input</i>退出登录</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- #User Info -->
        <!-- Menu -->
        <div class="menu">
            <ul class="list">
                <li class="user">
                    <a href="${ctx}/admin/user">
                        <i class="material-icons">person</i>
                        <span>个人信息</span>
                    </a>
                </li>
                <li class="skill">
                    <a href="${ctx}/admin/skill">
                        <i class="material-icons">accessibility</i>
                        <span>专业技能</span>
                    </a>
                </li>
                <li class="password">
                    <a href="${ctx}/admin/password">
                        <i class="material-icons">lock</i>
                        <span>修改密码</span>
                    </a>
                </li>
                <li class="education">
                    <a href="${ctx}/admin/education">
                        <i class="material-icons">school</i>
                        <span>教育经验</span>
                    </a>
                </li>
                <li class="company">
                    <a href="${ctx}/admin/company">
                        <i class="material-icons">domain</i>
                        <span>公司信息</span>
                    </a>
                </li>
                <li class="experience">
                    <a href="${ctx}/admin/experience">
                        <i class="material-icons">work</i>
                        <span>工作经验</span>
                    </a>
                </li>
                <li class="project">
                    <a href="${ctx}/admin/project">
                        <i class="material-icons">build</i>
                        <span>项目经验</span>
                    </a>
                </li>
                <li class="award">
                    <a href="${ctx}/admin/award">
                        <i class="material-icons">plus_one</i>
                        <span>获奖成就</span>
                    </a>
                </li>
                <li class="contact">
                    <a href="${ctx}/admin/contact">
                        <i class="material-icons">comment</i>
                        <span>留言信息</span>
                    </a>
                </li>
                <li class="website">
                    <a href="${ctx}/admin/website">
                        <i class="material-icons">language</i>
                        <span>网站信息</span>
                    </a>
                </li>
            </ul>
        </div>
        <!-- #Menu -->
    </aside>
    <!-- #END# Left Sidebar -->
</section>