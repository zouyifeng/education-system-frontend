<template>
    <div>
        <el-row :gutter="24">
            <el-col :span="4">
                <el-menu class="el-menu-vertical-demo" theme="dark">
                    <router-link to="/admin/news">
                        <el-menu-item index="1">
                            <i class="el-icon-message"></i>
                            新闻管理
                        </el-menu-item>
                    </router-link>
                    <router-link to="/admin/teacher">
                        <el-menu-item index="2">
                            <i class="el-icon-message"></i>
                            教师管理
                        </el-menu-item>
                    </router-link>
                    <router-link to="/admin/student">
                        <el-menu-item index="3">
                            <i class="el-icon-message"></i>
                            学生管理
                        </el-menu-item>
                    </router-link>
                    <router-link to="/admin/classes">
                        <el-menu-item index="4">
                            <i class="el-icon-message"></i>
                            班级管理
                        </el-menu-item>
                    </router-link>
                </el-menu>
            </el-col>
            <el-col :span="18">
                <el-row :gutter="20">    
                    <router-view></router-view>    
                </el-row>
            </el-col>
        </el-row>
    </div>
</template>
<style>
    .form-container {
        width: 500px;
    }
</style>