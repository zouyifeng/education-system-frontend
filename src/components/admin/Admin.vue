<template>
    <div class="container">
        <div class="col-md-3">
            <div class="panel-body">
                <router-link to="/admin/article" class="list-group-item">文章管理</router-link>
                <router-link to="/admin/teacher" class="list-group-item">教师管理</router-link>
                <router-link to="/admin/class" class="list-group-item">班级管理</router-link>

                <!--<a href="#" class="list-group-item">Vestibulum at eros</a>-->
            </div>
        </div>
        <div class="col-md-9">
            <router-view></router-view>
        </div>
    </div>
</template>